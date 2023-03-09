;16 bit addition


CODE    SEGMENT
        ASSUME CS:CODE , DS:CODE
        
        N1 DW 0202H
        N2 DW 0408H
        N3 DW ?
        N4 DB ?
        
START:  MOV AX,CODE
        MOV DS,AX
        
        MOV AX,N1
        MOV CL,00H
        ADD AX,N2
        JNC L1
        INC CL
        
L1:     MOV N3,AX
        MOV N4,CL
        
        MOV AX,4C00H
        INT 21H
        
CODE    ENDS
        END START