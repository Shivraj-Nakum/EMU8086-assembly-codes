;Display Three ASCII Strings Using DOS
DATA    SEGMENT
        MSG1 DB 'MY NAME IS RAJU',0DH,0AH,'$'
        MSG2 DB 'HOW ARE YOU?',0DH,0AH,'$'
        MSG3 DB 'I AM FINE','$'
DATA    ENDS
CODE    SEGMENT
        ASSUME CS: CODE, DS:DATA
START:  MOV AX, DATA
        MOV DS, AX
        MOV AH,09H ; Use of DOS 09H function to display
        ; ASCII string MSG1 on screen
        MOV DX, OFFSET MSG1
        INT 21H
        MOV AH,09H ; Use of DOS 09H function to display
        ; ASCII string MSG2 on screen
        MOV DX, OFFSET MSG2
        INT 21H
        MOV AH,09H ; Use of DOS 09H function to display
        ; ASCII string MSG3 on screen
        MOV DX, OFFSET MSG2
        INT 21H
        MOV AX,4C00H
        INT 21H
CODE    ENDS
        END START