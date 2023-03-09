;Write an assembly language program to read 16-bit I/O port which has 
;address of 112 and lower byte of this given to the 8-bit I/O port which has 
;address of 110.
#start=simple.exe# ; Call the simple 8 /16 – bit I/O port
#make_bin#
name "simple" 
L1: IN AX, 112 ; Read the 16-bit I/O port of 112 address
OUT 110, AL ; put AL content to 8-BIT I/O port of 110 address
CMP AL, 100 ; Compare AL with 100 data
JNZ L1 ; If not equal, again it read the 8-bit I/O port of 110 address
HLT ; If equal, emulator halts