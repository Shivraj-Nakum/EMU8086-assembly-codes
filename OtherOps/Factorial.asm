;Factorial
DATA    SEGMENT
        N1 DW 0005H
        N2 DW 0000H
        N3 DW 0000H
        N4 DW 0000H 
        N5 DW 0000H
DATA    ENDS
CODE    SEGMENT
        ASSUME CS: CODE, DS:DATA
START:  MOV AX, DATA
        MOV DS, AX
        MOV AX, N1 
        MOV N2, AX 
        MOV CX, AX 
        DEC CX
L1:     PUSH CX 
        PUSH CX
        MOV AX, N2
        MUL CX 
        MOV N2, AX
        ADD N3, DX 
        POP CX 
        DEC CX 
        JZ L2 
        PUSH CX
        MOV AX, N3
        MUL CX 
        MOV N3, AX 
        ADD N4, DX  
        POP CX 
        DEC CX 
        JZ L2 
        PUSH CX
        MOV AX, N4
        MUL CX 
        MOV N4, AX
        ADD N5, DX 
        POP CX  
        DEC CX 
        JZ L2 
        MOV AX, N5
        MUL CX 
        MOV N5, AX
L2:     POP CX 
        DEC CX
        JNZ L1  
        MOV AX,4C00H
        INT 21H
CODE    ENDS
        END START