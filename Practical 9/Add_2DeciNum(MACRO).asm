;Add 2-Digit Decinum(MACRO)
PRINT   MACRO MSG
        MOV AH, 09H
        MOV DX, OFFSET MSG
        INT 21H
        ENDM
        ; macro for entering value of the number for addition through keyboard in 00 - 99 decimal
READ    MACRO NUM ; READ macro read the data entering from
        MOV AH,01H ; keyboard using DOS function 01H and
        INT 21H ; convert into hex equivalent of decimal number
        SUB AL,30H ; Subtract 30H form AL to get 1st decimal digit
        MOV BL,0AH ; Load BL with 0AH (place value of 1st decimal digit)
        MUL BL ; Multiply AL with BL (weightage value of 1st digit in AL)
        MOV NUM, AL ; Store 1st digit weightage value (AL) into NUM 
        MOV AH,01H ; Use DOS 01H for 2nd digit entry through keyboard
        INT 21H
        SUB AL,30H ; Subtract 30H from AL to get 2nd decimal digit
        ADD NUM, AL ; Add NUM with AL (for obtain final number)
        ENDM 
        ; macro for displaying result of 3-digit decimal number range from 000 - 999
DISPLAY MACRO RES ; DISPLAY macro display RES (result of addition)
        MOV AL, RES ; Load AL with RES value (lower byte of dividend)
        MOV AH,00H ; Load AH with 00H value ((upper byte of dividend)
        MOV BL,64H ; Load BL with 64H as divisor (place value of 1st digit)
        DIV BL ; Divide AX by BL
        MOV RES, AH ; Store AH into RES for next division (Remainder)
        ADD AL,30H ; Add AL with 30H (1st digit ASCII hex) (Quotient)
        MOV DL, AL ; Load DL with AL (1st digit ASCII hex)
        MOV AH,02H ; Use of DOS 02H for 1st decimal digit ASCII hex value
        INT 21H ; display on screen
        MOV AL, RES ; Load AL with RES value (lower byte of dividend)
        MOV AH,00H ; Load AH with 00H value ((upper byte of dividend)
        MOV BL,0AH ; Load BL with 0AH as divisor (place value of 2nd digit)
        DIV BL ; Divide AX by BL
        MOV RES, AH ; Store AH into RES as 3rd decimal digit (Remainder)
        ADD AL,30H ; Add AL with 30H (2nd digit ASCII hex) (Quotient)
        MOV DL, AL ; Load DL with AL (2nd digit ASCII hex)
        MOV AH, 02H ; Use of DOS 02H for 2nddecimal digit ASCII hex value
        INT 21H ; display on screen 
        ADD RES, 30H ; Add RES with 30H (3rd digit ASCII hex) (3rd digit)
        MOV DL, RES ; Load DL with RES (3rddigit ASCII hex)
        MOV AH,02H ; Use of DOS 02H for 3rd decimal digit ASCII hex value
        INT 21H
        ENDM
DATA    SEGMENT
        CR EQU 0DH
        LF EQU 0AH
        MSG1 DB 'ENTER 2-DIGIT DECIMAL NUMBER1: ','$' 
        MSG2 DB CR, LF,'ENTER 2-DIGIT DECIMAL NUMBER2: ','$'
        MSG3 DB CR, LF,'RESULT OF TWO 2-DIGIT DECIMAL NUMBER ADDITION: ','$'
        NUM1 DB ?
        NUM2 DB ?
        RES DB ?
DATA    ENDS
CODE    SEGMENT
        ASSUME CS: CODE, DS:DATA
START:  MOV AX, DATA
        MOV DS, AX
        PRINT MSG1 ; Call macro name PRINT to display MSG1
        READ NUM1 ; Call macro name READ for NUM1
        PRINT MSG2 ; Call macro name PRINT to display MSG2
        READ NUM2 ; Call macro name READ for NUM2
        MOV AL, NUM1
        ADD AL, NUM2
        MOV RES, AL
        PRINT MSG3 ; Call macro name PRINT to display MSG3
        DISPLAY RES ; Call macro name DISPLAY to display RES
        MOV AX,4C00H
        INT 21H 
CODE    ENDS
        END START 