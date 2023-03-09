DATA    SEGMENT
        N1 DB 05H
        N2 DB 23H,36H,12H,45H,58H
DATA    ENDS  

CODE    SEGMENT
        ASSUME CS:CODE , DS:DATA
        
START:  MOV AX,DATA
        MOV DS,AX
        
        MOV CH,N1
        
L4:     MOV CL,N1
        DEC CL
        MOV SI,OFFSET N2
        MOV AL,[SI]         ;AL=23H
        
L3:     INC SI              
        MOV BL,[SI]         ;BL=36H
        CMP AL,BL
        JNC L1              ;AL > BL  , C=0
        DEC SI              ;AL < BL  , C=1
        MOV [SI],AL
        MOV AL,BL
        INC SI
        JMP L2
        
L1:     DEC SI
        MOV [SI],BL
        INC SI
        
L2:     DEC CL
        JNZ L3
        MOV [SI],AL
        DEC CH
        JNZ L4
        
        MOV AX,4C00H
        INT 21H
    
CODE    ENDS
        END START                      
        
        
        
        
