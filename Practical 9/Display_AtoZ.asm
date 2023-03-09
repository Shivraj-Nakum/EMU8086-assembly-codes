;Display A to Z
CODE    SEGMENT
        ASSUME CS: CODE
START:  MOV CL,'A' ; Load CL with ASCII hex value of ‘A’
L1:     MOV DL, CL ; Load DL with CL content for display
        MOV AH,02H ; Use DOS 02H function to display ASCII
        INT 21H ; hex value of character in DL
        INC CL ; Increment CL by 1 for next character
        CMP CL, 'z' ; Compare CL content with ‘z’
        JLE L1 ; If CL = ‘z’, go to label L1 (for next display) 
        MOV AX,4C00H
        INT 21H
CODE    ENDS
        END START 