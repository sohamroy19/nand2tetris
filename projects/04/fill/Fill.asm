// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(BEGIN)
	@KBD
	D = M;
	@WHITE
	D; JEQ
	@BLACK
	D; JNE
(WHITE)
	@SCREEN
	D = A;
	@a
	M = D;
(LOOPB)
	@SCREEN
	D = A;
	@a
	D = M - D;
	@BEGIN
	D; JGE
	@a
	A = M;
	M = 0;
	@a
	M = M + 1;
	@LOOPB
	0; JMP
(BLACK)
	@SCREEN
	D = A;
	@a
	M = D;
(LOOPW)
	@SCREEN
	D = A;
	@a
	D = M - D;
@BEGIN
	D; JGE
	@a
	A = M;
	M = -1;
	@a
	M = M + 1;
@LOOPW
	0; JMP
