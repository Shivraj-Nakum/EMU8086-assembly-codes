;16-bit Array Addition
DATA    SEGMENT
        N1 DB 04H
        N2 DW 1223H,4512H,5645H,6756H
        N3 DW ?
        N4 DB ?
DATA    ENDS 
CODE    SEGMENT
        ASSUME CS: CODE, DS:DATA
START:  MOV AX, DATA
        MOV DS, AX
        MOV CL, N1 
        DEC CL
        MOV SI, OFFSET N2 
        MOV CH,00H 
        MOV AX, [SI] 
L2:     INC SI 
        INC SI
        ADD AX, [SI]  
        JNC L1 
        INC CH 
L1:     DEC CL 
        JNZ L2 
        MOV N3, AX 
        MOV N4, CH 
        MOV AX,4C00H
        INT 21H
CODE    ENDS
        END START