;Write an assembly language program to the ASCII string is palindrome or 
;not. Read the ASCII string through keyboard and display result on screen.
; macro for print any message
PRINT MACRO MSG
MOV AH, 09H
MOV DX, OFFSET MSG
INT 21H
ENDM
DATA SEGMENT
CR EQU 0DH
LF EQU 0AH
MSG1 DB 'ENTER THE STRING: ','$'
MSG2 DB CR, LF,'REVERSE STRING: ','$'
STRING DB 20 DUP (00H)
REVSTRING DB 20 DUP (00H)
CNT DW 0000H
DATA ENDS
CODE SEGMENT
ASSUME CS: CODE, DS:DATA
START: MOV AX, DATA
MOV DS, AX
PRINT MSG1
MOV SI, OFFSET STRING 
L2: MOV AH,08H
INT 21H
CMP AL,0DH
JZ L1 
MOV [SI], AL
INC CNT
INC SI
MOV DL, AL 
MOV AH,02H
INT 21H
JMP L2
L1: PRINT MSG2 
 MOV SI, OFFSET STRING
MOV DI, OFFSET REVSTRING
MOV BX, CNT
L3: MOV DL, [SI+BX-1]
MOV [DI], DL
INC DI
PUSH DI
MOV AH,02H
INT 21H
POP DI
DEC BX
JNZ L3
 MOV SI, OFFSET STRING ; Initialized SI as a pointer for STRING
MOV DI, OFFSET REVSTRING ; Initialized DI for REVSTRING
MOV CX, CNT ; Load BX with CNT variable
L5: MOV AL, [SI] ; Load AL from STRING 
CMP AL, [DI] ; Compare AL with REVSTRING data
JNE L4 ; If both not same, go to label L4 (print MSG4)
INC SI ; SI is incremented by 1 for next data from STRING
INC DI ; DI incremented by 1 for next data from REVSTRING
LOOP L5 ; Repeat until CX ? 0
PRINT MSG 3
JMP L6 ; Jump to label L6 (for display MSG3)
L4: PRINT MSG4
L6: MOV AX,4C00H
INT 21H
CODE ENDS
END START
