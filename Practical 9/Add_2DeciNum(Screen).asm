; Write an assembly language program to add two 2-digit decimal numbers. Read the data through keyboard and display result on screen using near procedure
                                                                                        ; macro for print any message
PRINT MACRO MSG
MOV AH, 09H
MOV DX, OFFSET MSG
INT 21H
ENDM 
DATA SEGMENT
CR EQU 0DH
LF EQU 0AH
MSG1 DB 'ENTER 2-DIGIT DECIMAL NUMBER1: ','$' 
MSG2 DB CR, LF,'ENTER 2-DIGIT DECIMAL NUMBER2: ','$'
MSG3 DB CR, LF,'RESULT OF TWO 2-DIGIT DECIMAL NUMBER ADDITION: ','$'
NUM DB ?
NUM1 DB ?
NUM2 DB ?
RES DB ?
DATA ENDS
CODE SEGMENT
ASSUME CS: CODE, DS:DATA
START: MOV AX, DATA
MOV DS, AX
PRINT MSG1
CALL A2D ; Call procedure name A2D for NUM1
MOV AL, NUM ; Load AL with NUM variable value
MOV NUM1, AL ; Load NUM1 variable with AL content
PRINT MSG2
CALL A2D ; Call procedure name A2D for NUM2 
MOV AL, NUM ; Load AL with NUM variable value
MOV NUM2, AL ; Load NUM2 variable with AL content
MOV AL, NUM1
ADD AL, NUM2 
MOV RES, AL
PRINT MSG3
CALL D2A ; Call procedure name D2A to display RES
MOV AX,4C00H
INT 21H
; procedure near for entering value of the number for addition through keyboard 
; in 00 - 99 decimal
A2D PROC NEAR ; A2D procedure read the data entering from
MOV AH,01H ; keyboard using DOS function 01H and
INT 21H ; convert into hex equivalent of decimal number
SUB AL,30H
MOV BL,0AH
MUL BL
MOV NUM, AL 
MOV AH,01H
INT 21H
SUB AL,30H
ADD NUM, AL
RET ; Return to main program (next instruction after call A2D)
A2D ENDP
; procedure for displaying result of 3-digit decimal number 000 - 999
D2A PROC NEAR ; D2A procedure for display RES (result of addition)
MOV AL, RES
MOV AH,00H
MOV BL,64H
DIV BL
MOV RES, AH
ADD AL,30H
MOV DL, AL
MOV AH,02H
INT 21H
MOV AL, RES
MOV AH,00H
MOV BL,0AH
DIV BL
MOV RES, AH
ADD AL,30H
MOV DL, AL
MOV AH, 02H
INT 21H 
ADD RES, 30H
MOV DL, RES
MOV AH,02H
INT 21H
RET ; Return to main program (next instruction after call D2A)
D2A ENDP
CODE ENDS
END START
