@261
D=A
@0
M=D
@1
M=D
@2
M=D
@3
M=D
@4
M=D
@Sys.init
0;JMP
(Sys.init)
@6
D=A
@SP
M=M+1
A=M-1
M=D
A=A+1
@8
D=A
@SP
M=M+1
A=M-1
M=D
A=A+1
@5
 D=A
 @SP
 M=M+D
 D=M-D
 @retAddOf_Class1.set0
D=D+A
 A=D-A
 M=D-A
 D=A+1
@LCL
D=D+M
 A=D-M
 M=D-A
 D=A+1
@ARG
D=D+M
 A=D-M
 M=D-A
 D=A+1
@THIS
D=D+M
 A=D-M
 M=D-A
 D=A+1
@THAT
D=D+M
 A=D-M
 M=D-A
 D=A+1
@LCL
M=D
@7
D=D-A
@ARG
M=D
@Class1.set
0;JMP
(retAddOf_Class1.set0)
@SP
AM=M-1
D=M
@5
M=D
@23
D=A
@SP
M=M+1
A=M-1
M=D
A=A+1
@15
D=A
@SP
M=M+1
A=M-1
M=D
A=A+1
@5
 D=A
 @SP
 M=M+D
 D=M-D
 @retAddOf_Class2.set1
D=D+A
 A=D-A
 M=D-A
 D=A+1
@LCL
D=D+M
 A=D-M
 M=D-A
 D=A+1
@ARG
D=D+M
 A=D-M
 M=D-A
 D=A+1
@THIS
D=D+M
 A=D-M
 M=D-A
 D=A+1
@THAT
D=D+M
 A=D-M
 M=D-A
 D=A+1
@LCL
M=D
@7
D=D-A
@ARG
M=D
@Class2.set
0;JMP
(retAddOf_Class2.set1)
@SP
AM=M-1
D=M
@5
M=D
@5
 D=A
 @SP
 M=M+D
 D=M-D
 @retAddOf_Class1.get2
D=D+A
 A=D-A
 M=D-A
 D=A+1
@LCL
D=D+M
 A=D-M
 M=D-A
 D=A+1
@ARG
D=D+M
 A=D-M
 M=D-A
 D=A+1
@THIS
D=D+M
 A=D-M
 M=D-A
 D=A+1
@THAT
D=D+M
 A=D-M
 M=D-A
 D=A+1
@LCL
M=D
@5
D=D-A
@ARG
M=D
@Class1.get
0;JMP
(retAddOf_Class1.get2)
@5
 D=A
 @SP
 M=M+D
 D=M-D
 @retAddOf_Class2.get3
D=D+A
 A=D-A
 M=D-A
 D=A+1
@LCL
D=D+M
 A=D-M
 M=D-A
 D=A+1
@ARG
D=D+M
 A=D-M
 M=D-A
 D=A+1
@THIS
D=D+M
 A=D-M
 M=D-A
 D=A+1
@THAT
D=D+M
 A=D-M
 M=D-A
 D=A+1
@LCL
M=D
@5
D=D-A
@ARG
M=D
@Class2.get
0;JMP
(retAddOf_Class2.get3)
(WHILE)
@WHILE
0;JMP
(Class1.set)
@0
D=A
@ARG
A=M+D
D=M
@SP
M=M+1
A=M-1
M=D
A=A+1
@SP
AM=M-1
D=M
@Class1.0
M=D
@1
D=A
@ARG
A=M+D
D=M
@SP
M=M+1
A=M-1
M=D
A=A+1
@SP
AM=M-1
D=M
@Class1.1
M=D
@0
D=A
@SP
M=M+1
A=M-1
M=D
A=A+1
@LCL
D=M
@R13
M=D
@R13
D=M
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
AM=M-1
D=M
@THAT
M=D
@R13
AM=M-1
D=M
@THIS
M=D
@R13
AM=M-1
D=M
@ARG
M=D
@R13
AM=M-1
D=M
@LCL
M=D
@R14
A=M
0;JMP
(Class1.get)
@Class1.0
D=M
@SP
M=M+1
A=M-1
M=D
A=A+1
@Class1.1
D=M
@SP
M=M+1
A=M-1
M=D
A=A+1
@SP
AM=M-1
D=M
A=A-1
M=M-D
@LCL
D=M
@R13
M=D
@R13
D=M
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
AM=M-1
D=M
@THAT
M=D
@R13
AM=M-1
D=M
@THIS
M=D
@R13
AM=M-1
D=M
@ARG
M=D
@R13
AM=M-1
D=M
@LCL
M=D
@R14
A=M
0;JMP
(Class2.set)
@0
D=A
@ARG
A=M+D
D=M
@SP
M=M+1
A=M-1
M=D
A=A+1
@SP
AM=M-1
D=M
@Class2.0
M=D
@1
D=A
@ARG
A=M+D
D=M
@SP
M=M+1
A=M-1
M=D
A=A+1
@SP
AM=M-1
D=M
@Class2.1
M=D
@0
D=A
@SP
M=M+1
A=M-1
M=D
A=A+1
@LCL
D=M
@R13
M=D
@R13
D=M
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
AM=M-1
D=M
@THAT
M=D
@R13
AM=M-1
D=M
@THIS
M=D
@R13
AM=M-1
D=M
@ARG
M=D
@R13
AM=M-1
D=M
@LCL
M=D
@R14
A=M
0;JMP
(Class2.get)
@Class2.0
D=M
@SP
M=M+1
A=M-1
M=D
A=A+1
@Class2.1
D=M
@SP
M=M+1
A=M-1
M=D
A=A+1
@SP
AM=M-1
D=M
A=A-1
M=M-D
@LCL
D=M
@R13
M=D
@R13
D=M
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
AM=M-1
D=M
@THAT
M=D
@R13
AM=M-1
D=M
@THIS
M=D
@R13
AM=M-1
D=M
@ARG
M=D
@R13
AM=M-1
D=M
@LCL
M=D
@R14
A=M
0;JMP
