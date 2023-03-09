DATA    SEGMENT
        N1 DW 0099H
        N2 DB 88H
        N3 DW ?
DATA    ENDS
 
CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX 
        MOV AH,00H 
        MOV AX,N1
        MOV BL,N2
        DIV BL
        MOV N3,AX  ;AH contains remainder AL contains quotient
        MOV AX,4C00H
        INT 21H
CODE    ENDS
        END START
