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
(Main.fibonacci)
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
@2
D=A
@SP
M=M+1
A=M-1
M=D
A=A+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@IFEQ0
D;JLT
@SP
A=M-1
M=0
(IFEQ0)
@SP
AM=M-1
D=M
@IF_TRUE
D;JNE
@IF_FALSE
0;JMP
(IF_TRUE)
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
(IF_FALSE)
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
@2
D=A
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
@5
 D=A
 @SP
 M=M+D
 D=M-D
 @retAddOf_Main.fibonacci0
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
@6
D=D-A
@ARG
M=D
@Main.fibonacci
0;JMP
(retAddOf_Main.fibonacci0)
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
@1
D=A
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
@5
 D=A
 @SP
 M=M+D
 D=M-D
 @retAddOf_Main.fibonacci1
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
@6
D=D-A
@ARG
M=D
@Main.fibonacci
0;JMP
(retAddOf_Main.fibonacci1)
@SP
AM=M-1
D=M
A=A-1
M=M+D
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
(Sys.init)
@4
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
 @retAddOf_Main.fibonacci2
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
@6
D=D-A
@ARG
M=D
@Main.fibonacci
0;JMP
(retAddOf_Main.fibonacci2)
(WHILE)
@WHILE
0;JMP

