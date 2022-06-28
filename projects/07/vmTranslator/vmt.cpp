#include <cassert>
#include <fstream>
#include <map>
#include <set>
#include <sstream>
#include <string>
#include <vector>

class Parser {
private:
    std::string input;
    std::vector<std::vector<std::string>> parsed;
    std::vector<int> ind_to_line;

    void open(std::string filepath) {
        std::ifstream file(filepath);

        if (file.is_open()) {
            input.clear();
            std::stringstream ss;
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

            std::stringstream bufs(temp);
            std::vector<std::string> tempv;

            while (bufs >> temp) tempv.push_back(temp);

            if (tempv.size() > 0) {
                parsed.push_back(tempv);
                ind_to_line.push_back(line_no);
            }

            if (input.find("\n") != -1) {
                lend = input.begin() + input.find("\n", lend - input.begin() + 1);
            } else {
                lend = input.end();
            }
        }
    }

public:
    Parser(std::string filepath) {
        open(filepath);
        pre_process();
    }

    std::vector<std::vector<std::string>> get_vec() { return parsed; }

    int get_line_no(int index) { return ind_to_line[index]; }
};

class assembly_code {
private:
    int loop_no = 0;
    std::map<std::string, std::string> arithmetic;
    std::set<std::string> comp;
    std::map<std::string, std::string> segment_map1;
    std::map<std::string, int> segment_map2;
    std::string file_name;

public:
    void init(std::string fn) {
        arithmetic["add"] = "@SP\nAM=M-1\nD=M\nA=A-1\nM=M+D\n";
        arithmetic["sub"] = "@SP\nAM=M-1\nD=M\nA=A-1\nM=M-D\n";
        arithmetic["and"] = "@SP\nAM=M-1\nD=M\nA=A-1\nM=M&D\n";
        arithmetic["or"] = "@SP\nAM=M-1\nD=M\nA=A-1\nM=M|D\n";
        arithmetic["neg"] = "@SP\nA=M-1\nM=-M\n";
        arithmetic["not"] = "@SP\nA=M-1\nM=!M\n";
        comp.insert("eq");
        comp.insert("gt");
        comp.insert("lt");
        segment_map1["argument"] = "ARG";
        segment_map1["local"] = "LCL";
        segment_map1["this"] = "THIS";
        segment_map1["that"] = "THAT";
        segment_map1["local"] = "LCL";
        segment_map2["constant"] = 0;
        segment_map2["pointer"] = 3;
        segment_map2["temp"] = 5;
        segment_map2["static"] = -1;
        file_name = fn.substr(0, fn.find('.'));
    }

    bool is_arithmetic(std::vector<std::string> s) { return s.size() == 1 && arithmetic.count(s[0]); }

    bool is_comp(std::vector<std::string> s) { return s.size() == 1 && comp.count(s[0]); }

    bool is_push(std::vector<std::string> s) { return s.size() == 3 && s[0] == "push"; }

    bool is_pop(std::vector<std::string> s) { return s.size() == 3 && s[0] == "pop"; }

    std::string comp_ins(std::string in) {
        for (auto &e : in) e += 'A' - 'a';
        return "@SP\nAM=M-1\nD=M\nA=A-1\nD=M-D\nM=-1\n@IFEQ" +
               std::to_string(loop_no) + "\nD;J" + in + "\n@SP\nA=M-1\nM=0\n(IFEQ" +
               std::to_string(loop_no++) + ")\n";
    }

    std::string push_ins(std::string segment, std::string ind_string) {
        if (segment_map1.count(segment)) {
            std::string seg = segment_map1[segment];
            std::string temp = "@" + ind_string + "\nD=A\n@" + seg + "\nA=M+D\nD=M\n@SP\nM=M+1\nA=M-1\nM=D\nA=A+1\n";
            return temp;
        } else if (segment_map2.find(segment) != segment_map2.end()) {
            int ind = stoi(ind_string) + segment_map2[segment];
            std::string seg = std::to_string(ind);
            if (segment == "static") {
                seg = file_name + "." + ind_string;
            }
            std::string temp = "@" + seg + "\nD=M\n@SP\nM=M+1\nA=M-1\nM=D\nA=A+1\n";
            if (segment == "constant") temp = "@" + seg + "\nD=A\n@SP\nM=M+1\nA=M-1\nM=D\nA=A+1\n";
            return temp;
        }
    }

    std::string pop_ins(std::string segment, std::string ind_string) {
        if (segment_map1.count(segment)) {
            std::string seg = segment_map1[segment];
            std::string temp = "@" + ind_string + "\nD=A\n@" + seg + "\nD=M+D\n@SP\nM=M-1\nA=M+1\nM=D\nA=A-1\nD=M\nA=A+1\nA=M\nM=D\n";
            return temp;
        } else if (segment_map2.count(segment)) {
            int ind = stoi(ind_string) + segment_map2[segment];
            std::string seg = std::to_string(ind);
            if (segment == "static") seg = file_name + "." + ind_string;
            std::string temp = "@SP\nAM=M-1\nD=M\n@" + seg + "\nM=D\n";
            return temp;
        }
    }

    std::string arithins(std::string s) {
        return arithmetic[s];
    }
};

class convert_to_assembly {
private:
    std::vector<std::vector<std::string>> input;
    std::string output;
    assembly_code ac;

    void run() {
        for (auto in : input) {
            if (ac.is_arithmetic(in)) {
                output += ac.arithins(in[0]);
            } else if (ac.is_comp(in)) {
                output += ac.comp_ins(in[0]);
            } else if (ac.is_pop(in)) {
                output += ac.pop_ins(in[1], in[2]);
            } else if (ac.is_push(in)) {
                output += ac.push_ins(in[1], in[2]);
            }
        }
    }

public:
    convert_to_assembly(std::vector<std::vector<std::string>> a, std::string file_name) {
        input = a;
        ac.init(file_name);
        run();
    }

    std::string get_out() {
        return output;
    }
};

int main(int argc, char *argv[]) {
    assert(argc >= 2);
    std::string file_name(argv[1]);

    std::string mod_file_name(file_name.begin(), find(file_name.begin(), file_name.end(), '.'));
    Parser parser(argv[1]);
    auto intermediate = parser.get_vec();
    convert_to_assembly res(intermediate, mod_file_name);

    std::string out_file_name = mod_file_name + ".asm";
    std::ofstream file(out_file_name);
    file << res.get_out() << '\n';
}
