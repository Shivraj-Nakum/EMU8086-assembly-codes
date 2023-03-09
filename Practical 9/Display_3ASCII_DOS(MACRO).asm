;Display 3 ASCII Strings Using DOS(MACRO)
PRINT   MACRO MSG ; PRINT macro declares to display
        MOV AH, 09H ; ASCII string using DOS function 09H
        MOV DX, OFFSET MSG
        INT 21H
        ENDM
DATA    SEGMENT 
        CR EQU 0DH
        LF EQU 0AH
        MSG1 DB 'MY NAME IS RAJU', CR, LF, '$'
        MSG2 DB 'HOW ARE YOU?', CR, LF, '$'
        MSG3 DB 'I AM FINE','$'
DATA    ENDS
CODE    SEGMENT
        ASSUME CS: CODE, DS:DATA
START:  MOV AX, DATA
        MOV DS, AX
        PRINT MSG1 ; Call macro name PRINT to display MSG1
        PRINT MSG2 ; Call macro name PRINT to display MSG2
        PRINT MSG3 ; Call macro name PRINT to display MSG3
        MOV AX,4C00H
        INT 21H
CODE    ENDS
        END START