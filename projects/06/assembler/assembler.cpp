#include <bitset>
#include <cassert>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <unordered_map>
#include <vector>

class SymbolTable {
private:
    std::unordered_map<std::string, int> table = {{"SP", 0}, {"LCL", 1}, {"ARG", 2}, {"THIS", 3}, {"THAT", 4}, {"R0", 0}, {"R1", 1}, {"R2", 2}, {"R3", 3}, {"R4", 4}, {"R5", 5}, {"R6", 6}, {"R7", 7}, {"R8", 8}, {"R9", 9}, {"R10", 10}, {"R11", 11}, {"R12", 12}, {"R13", 13}, {"R14", 14}, {"R15", 15}, {"SCREEN", 16384}, {"KBD", 24576}};
    int curr_add = 16;

public:
    void insert(std::string s, int add) {
        if (table.count(s) == 0) table[s] = add;
    }

    int get(std::string s) {
        if (table.count(s) == 0) table[s] = curr_add++;
        return table[s];
    }
};

class Parser {
private:
    std::string input;
    std::vector<std::string> parsed;
    std::vector<int> ind_to_line;

    void open(std::string filepath) {
        std::ifstream file(filepath);

        if (file.is_open()) {
            input.clear();
            std::ostringstream ss;
            ss << file.rdbuf();
            input = ss.str();
        }
    }

    void pre_process() {
        input.erase(remove(input.begin(), input.end(), ' '), input.end());
        input.erase(remove(input.begin(), input.end(), '\t'), input.end());

        parsed.clear();
        auto lbegin = input.begin(), lend = input.end();
        int newline_loc = input.find("\n");
        if (newline_loc != -1) lend = input.begin() + newline_loc;
        int line_no = 0;

        while (lbegin != input.end()) {
            std::string temp(lbegin, lend - 1);

            if (temp.empty()) {
                ++line_no;
                lbegin = lend + 1;
                lend = input.begin() + input.find("\n", lend - input.begin() + 1);
                continue;
            }

            if (temp.find("//") != -1) {
                temp = std::string(temp.begin(), temp.begin() + temp.find("//"));
            }

            if (temp.empty()) {
                ++line_no;
                lbegin = lend + 1;
                lend = input.begin() + input.find("\n", lend - input.begin() + 1);
                continue;
            }

            if (temp[0] == '(') {
                assert(temp.size() >= 3);
                table.insert(std::string(temp.begin() + 1, temp.end() - 1), parsed.size());
            } else {
                parsed.push_back(temp);
                ind_to_line.push_back(line_no);
            }

            ++line_no;
            lbegin = lend + 1;

            if (input.find("\n") != -1) {
                lend = input.begin() + input.find("\n", lend - input.begin() + 1);
            } else {
                lend = input.end();
            }
        }
    }

public:
    SymbolTable table;

    Parser(std::string filepath) {
        open(filepath);
        pre_process();
    }

    std::vector<std::string> get_vec() { return parsed; }

    int get_line_no(int index) { return ind_to_line[index]; }
};

class Instructions {
private:
    Parser parser;
    std::vector<std::string> in, out;
    std::unordered_map<std::string, std::string> ALU_table = {{"0", "101010"}, {"1", "111111"}, {"-1", "111010"}, {"D", "001100"}, {"A", "110000"}, {"!D", "001101"}, {"!A", "110001"}, {"-D", "001111"}, {"-A", "110011"}, {"D+1", "011111"}, {"1+D", "011111"}, {"A+1", "110111"}, {"1+A", "110111"}, {"D-1", "001110"}, {"A-1", "110010"}, {"D+A", "000010"}, {"A+D", "000010"}, {"D-A", "010011"}, {"A-D", "000111"}, {"D&A", "000000"}, {"A&D", "000000"}, {"D|A", "010101"}, {"A|D", "010101"}};
    int index = 0;

    bool is_A_ins(std::string s) {
        return (s[0] == '@');
    }

    void A_ins(std::string s) {
        std::string temp(s.begin() + 1, s.end());
        if (isdigit(s[1])) {
            out.push_back(std::bitset<16>(stoi(temp)).to_string());
        } else {
            out.push_back(std::bitset<16>(parser.table.get(temp)).to_string());
        }
    }

    bool is_C_ins(std::string s) {
        return (s.find(";") != -1 || s.find("=") != -1);
    }

    std::string ALU_ins(std::string s) {
        std::string temp;
        if (s.find("M") == -1) {
            temp = "0";
            if (ALU_table.count(s)) temp += ALU_table[s];
        } else {
            temp = "1";
            replace(s.begin(), s.end(), 'M', 'A');
            if (ALU_table.count(s)) {
                temp += ALU_table[s];
            } else {
                replace(s.begin(), s.end(), 'A', 'M');
            }
        }
        return temp;
    }

    std::string jump_ins(std::string s) {
        std::string temp = "000";
        if (s.empty()) {
            return temp;
        } else if (s[0] == 'J') {
            if (s.find("E") != -1) temp[1] = '1';
            if (s.find("G") != -1) temp[2] = '1';
            if (s.find("L") != -1) temp[0] = '1';
            if (s == "JNE") temp = "101";
            if (s == "JMP") temp = "111";
        }
        return temp;
    }

    std::string dest_ins(std::string s) {
        std::string temp = "000";
        if (s.empty()) return "000";
        if (s.find("A") != -1) temp[0] = '1';
        if (s.find("D") != -1) temp[1] = '1';
        if (s.find("M") != -1) temp[2] = '1';
        return temp;
    }

    void C_ins(std::string s) {
        auto ALU_ib = s.begin(), ALU_ie = s.end(), dest_i = s.begin(), jump_i = s.end();

        if (s.find(";") != -1) {
            jump_i = s.begin() + s.find(";") + 1;
            ALU_ie = jump_i - 1;
        }
        if (s.find("=") != -1) {
            dest_i = s.begin() + s.find("=");
            ALU_ib = dest_i + 1;
        }

        std::string dest(s.begin(), dest_i);
        std::string jump(jump_i, s.end());
        std::string ALU(ALU_ib, ALU_ie);

        out.push_back("111" + ALU_ins(ALU) + dest_ins(dest) + jump_ins(jump));
    }

public:
    Instructions(Parser inputs) : parser(inputs) {
        in = inputs.get_vec();
    }

    std::vector<std::string> get_output() {
        for (auto &elem : in) {
            ++index;
            if (is_A_ins(elem)) {
                A_ins(elem);
            } else if (is_C_ins(elem)) {
                C_ins(elem);
            }
        }
        return out;
    }
};

int main(int argc, char *argv[]) {
    assert(argc >= 3);

    Parser parser(argv[1]);
    Instructions ins(parser);
    auto out = ins.get_output();

    std::ofstream out_file(argv[2]);
    for (auto &elem : out) out_file << elem << '\n';
}
