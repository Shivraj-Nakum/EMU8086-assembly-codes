CODE    SEGMENT
        
        ASSUME CS:CODE
        
START:  MOV AL,88H ;Making AL = 88H Since In Addition Source Cannot Be A Data Value
        MOV AH,00H ;Making AH = 00H To Store Carry Since AL Is Of 8Bit Size
        
        ADD AL,99H ;Adding AL And 99H
        
        JNC L1 ;Jump To L1 If Carry Is Not Generated
        INC AH ;Increment AH
        
L1:     MOV BX,AX ;Stores Answer In BX
        
        MOV AX,4C00H ;Replacing Value At AX With 4C00H
        INT 21H ;Interrupt At 21H
        
CODE    ENDS
        
        END START