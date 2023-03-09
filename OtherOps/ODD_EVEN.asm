;ODD&EVEN
DATA    SEGMENT
        N1 DB 06H
        N2 DB 58H,99H,45H,23H,87H,76H
        N3 DB 6 DUP(?)
        N4 DB 6 DUP(?)
DATA    ENDS
CODE    SEGMENT
        ASSUME CS: CODE, DS:DATA
START:  MOV AX, DATA
        MOV DS, AX
        MOV CL, N1 
        MOV SI, OFFSET N2
        MOV DI, OFFSET N3
        MOV BX, OFFSET N4
L3:     MOV AL, [SI] 
        ROR AL,01H  
        JNC L1 
        ROL AL,01H
        MOV [DI], AL 
        INC DI  
        JMP L2 
L1:     ROL AL,01H
        MOV [BX], AL
        INC BX  
L2:     INC SI 
        DEC CL 
        JNZ L3 
        MOV AX,4C00H
        INT 21H
CODE    ENDS
        END START