;16-bit Division
DATA    SEGMENT
        N1 DD 00009999H
        N2 DW 8888H
        N3 DD ?
DATA    ENDS

CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX 
        MOV SI,OFFSET N3
        MOV DI,OFFSET N1
        
        
        MOV AX,[DI]
        MOV DX,[DI+2]
        DIV N2
        
        MOV [SI],AX
        MOV [SI+2],DX
        MOV AX,4C00H 
        INT 21H
CODE    ENDS
        END START
