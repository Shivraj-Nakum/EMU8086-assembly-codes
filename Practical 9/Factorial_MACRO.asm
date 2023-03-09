;Write an assembly language program to find out factorial of given number. 
;Read the data through keyboard and display result on screen using procedure 
;near
; macro for print any message
PRINT MACRO MSG
MOV AH, 09H
MOV DX, OFFSET MSG
INT 21H
ENDM
DATA SEGMENT
CR EQU 0DH
LF EQU 0AH
MSG1 DB 'ENTER THE NO. FOR FACTORIAL: ','$'
MSG2 DB CR, LF,'RESULT OF FACTORIAL: ','$' 
N1 DB ?
N2 DW ?
N3 DW ?
N4 DW ?
N5 DW ?
RES DW ?
DATA ENDS 
CODE SEGMENT
ASSUME CS: CODE, DS:DATA
START: MOV AX, DATA
MOV DS, AX
PRINT MSG1
CALL A2H ; Call procedure name A2H for factorial no. (N1)
MOV AH,00H
 MOV AL, N1
 MOV N2, AX
 MOV CX, AX
 DEC CX
B1: PUSH CX
 PUSH CX
 MOV AX, N2
 MUL CX
 MOV N2, AX
 ADD N3, DX 
 POP CX 
 DEC CX
 JZ B2
 PUSH CX
 MOV AX, N3
 MUL CX
 MOV N3, AX
 ADD N4, DX 
 POP CX
 DEC CX
 JZ B2
 PUSH CX
 MOV AX, N4
 MUL CX
 MOV N4, AX
 ADD N5, DX
 POP CX 
 DEC CX
 JZ B2
 MOV AX, N5
 MUL CX
 MOV N5, AX
B2: POP CX
 DEC CX
 JNZ B1
PRINT MSG2
MOV AX, N5
MOV RES, AX
CALL H2A ; Call procedure name H2A to display N5 (MSB3)
MOV AX, N4
MOV RES, AX
CALL H2A ; Call procedure name H2A to display N4 (MSB2)
MOV AX, N3
MOV RES, AX
CALL H2A ; Call procedure name H2A to display N3 (MSB1)
MOV AX, N2
MOV RES, AX
CALL H2A ; Call procedure name H2A to display N2 (LSB)
MOV AX,4C00H
INT 21H
; procedure for entering value of the number for addition through keyboard 
; in 00 - FF hexadecimal
A2H PROC NEAR ; A2H procedure read the data entering from
MOV AH, 01H ; keyboard using DOS function 01H and
INT 21H ; convert into hex decimal number
CMP AL, 39H
JA L1
SUB AL, 30H
JMP L2
L1: SUB AL, 37H
L2: MOV BL, 10H
MUL BL
MOV TEMP, AL
MOV AH, 01H
INT 21H
CMP AL, 39H
JA L3
SUB AL, 30H
JMP L4
L3: SUB AL, 37H 
L4: ADD TEMP, AL
RET
A2H ENDP
; procedure for displaying result of 4-digit hexadecimal number 0000H - FFFFH
H2A PROC NEAR
MOV AX, RES
MOV AX, RES
MOV DX, 0000H
MOV CX, 1000H
DIV CX
MOV RES, DX
CMP AL, 09H
JA K1
ADD AL, 30H
JMP K2
K1: ADD AL, 37H
K2: MOV DL, AL
MOV AH, 02H
INT 21H
MOV AX, RES
MOV DX, 0000H
MOV CX, 0100H
DIV CX
MOV RES, DX
CMP AL, 09H
JA K3
ADD AL, 30H
JMP K4
K3: ADD AL, 37H
K4: MOV DL, AL
MOV AH, 02H
INT 21H
MOV AX, RES
MOV DX,0000H
MOV CX,0010H
DIV CX
MOV RES, DX
CMP AL,09H
JA K5
ADD AL,30H
JMP K6
K5: ADD AL,37H
K6: MOV DL, AL
MOV AH,02H
INT 21H 
MOV DX, RES
CMP DL, 09H
JA K7
ADD DL, 30H
JMP K8
K7: ADD DL, 37H 
K8: MOV AH, 02H
INT 21H
RET
H2A ENDP
CODE ENDS
END START