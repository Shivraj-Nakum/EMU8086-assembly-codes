;8-bit Array Addition
DATA    SEGMENT
        N1 DB 03H
        N2 DB 34H,67H,0A5H
        N3 DW ?
DATA    ENDS

CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        
        MOV SI,OFFSET N2
        MOV AH,00H
        MOV CL,N1
        DEC CL
        MOV AL,[SI]
L2:     INC SI
        ADD AL,[SI]
        JNC L1
        INC AH
L1:     DEC CL
        JNZ L2
        MOV N3,AX
        MOV AX,4C00H
        INT 21H
CODE    ENDS
        END START
