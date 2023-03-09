; 32-Bit Addition
DATA    SEGMENT
        N1 DD 12345678H
        N2 DD AABBCCDDH
        N3 DD ? 
        N4 DB ?
DATA    ENDS
 
CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX 
        MOV CL,00H
        MOV SI,OFFSET N1
        MOV DI,OFFSET N2 
        MOV BX,OFFSET N3 
        
        MOV AX,[SI] 
        ADD AX,[DI]
        MOV [BX],AX 
        
        MOV AX,[SI+2]
        ADC AX,[DI+2]
        JNC L1
        INC CL
L1:     MOV [BX+2],AX
        MOV N4,CL
        MOV AX,4C00H
        INT 21H
CODE    ENDS
        END START
