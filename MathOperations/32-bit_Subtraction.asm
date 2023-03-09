;32-bit Subtraction
DATA    SEGMENT
        N1 DD 12345678H
        N2 DD 0AABBCCDDH
        N3 DD ?
DATA    ENDS
CODE    SEGMENT
        ASSUME CS: CODE, DS: DATA
START:  MOV AX, DATA
        MOV DS, AX
        MOV SI, OFFSET N1
        MOV DI, OFFSET N2
        MOV BX, OFFSET N3
        MOV AX, [SI] 
        SUB AX, [DI]
        MOV AX, [SI+2]
        SBB AX, [DI+2]
        JNC L1 
        NOT WORD PTR [BX] 
        NOT AX 
        ADD [BX], 01H
        JNC L1
        INC AX
L1:     MOV [BX+2], AX
        MOV AX,4C00H
        INT 21H
CODE    ENDS
        END START