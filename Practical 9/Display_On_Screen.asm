;Enter Data Through Keyboard
CODE    SEGMENT
        ASSUME CS: CODE
L1:     MOV AH,01H ; Use DOS 01H function for data/string entry 
        INT 21H ; through keyboard (with echo) and see on screen 
        CMP AL, 'z' ; Compare ASCII hex value of key pressed (AL)
        JNZ L1 ; with z key, if ZF = 0, go to label L1 (for next key)
        MOV AX,4C00H
        INT 21H
CODE    ENDS
        END L1