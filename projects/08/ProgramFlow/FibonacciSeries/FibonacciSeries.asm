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
@4
M=D
@0
D=A
@SP
M=M+1
A=M-1
M=D
A=A+1
@0
D=A
@THAT
D=M+D
@SP
M=M-1
A=M+1
M=D
A=A-1
D=M
A=A+1
A=M
M=D
@1
D=A
@SP
M=M+1
A=M-1
M=D
A=A+1
@1
D=A
@THAT
D=M+D
@SP
M=M-1
A=M+1
M=D
A=A-1
D=M
A=A+1
A=M
M=D
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
@0
D=A
@ARG
D=M+D
@SP
M=M-1
A=M+1
M=D
A=A-1
D=M
A=A+1
A=M
M=D
(FibonacciSeries_MAIN_LOOP_START)
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
@FibonacciSeries_COMPUTE_ELEMENT
D;JNE
@FibonacciSeries_END_PROGRAM
0;JMP
(FibonacciSeries_COMPUTE_ELEMENT)
@0
D=A
@THAT
A=M+D
D=M
@SP
M=M+1
A=M-1
M=D
A=A+1
@1
D=A
@THAT
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
A=A-1
M=M+D
@2
D=A
@THAT
D=M+D
@SP
M=M-1
A=M+1
M=D
A=A-1
D=M
A=A+1
A=M
M=D
@4
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
M=M+D
@SP
AM=M-1
D=M
@4
M=D
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
@0
D=A
@ARG
D=M+D
@SP
M=M-1
A=M+1
M=D
A=A-1
D=M
A=A+1
A=M
M=D
@FibonacciSeries_MAIN_LOOP_START
0;JMP
(FibonacciSeries_END_PROGRAM)
