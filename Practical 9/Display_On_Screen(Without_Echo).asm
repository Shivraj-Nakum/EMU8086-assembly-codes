;Enter Data Through Keyboard
CODE    SEGMENT
        ASSUME CS: CODE
L2:     MOV AH,08H ; Use DOS 08H function for data/string entry 
        INT 21H ; through keyboard (without echo)
        CMP AL, 'z' ; Compare ASCII hex value of key pressed (AL)
        JZ L1 ; with z key, if ZF = 1, go to label L1 (termination)
        MOV DL, AL ; Load DL with AL
        MOV AH,02H ; Use DOS 02H function for display key
        INT 21H ; which you pressed through keyboard
        JMP L2 ; Jump to label L2 (next key)
L1:     MOV AX,4C00H
        INT 21H
CODE    ENDS
        END L