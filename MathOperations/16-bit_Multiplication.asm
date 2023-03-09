;16-Bit multiplication
DATA    SEGMENT
        N1 DW 9999H
        N2 DW 8888H
        N3 DD ?
DATA    ENDS

CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX 
        MOV SI,OFFSET N3
        MOV DX,0000H
        MOV AX,N1
        MUL N2
        
        MOV [SI],AX
        MOV [SI+2],DX
        MOV AX,4C00H 
        INT 21H
CODE    ENDS
        END START
