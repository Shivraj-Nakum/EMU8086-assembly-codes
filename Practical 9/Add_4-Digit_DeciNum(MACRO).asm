;Add 4-digit DEcinum
; macro for print any message
PRINT MACRO MSG
MOV AH, 09H
MOV DX, OFFSET MSG
INT 21H
ENDM
; macro for entering value of the numbers for addition through keyboard
; in 0000 - 9999 decimal
READ MACRO NUM ; READ macro read the data entering from
MOV AH,01H ; keyboard using DOS function 01H and
INT 21H ; convert into hex equivalent of decimal number
SUB AL,30H ; Subtract -30H form AL to get 1st decimal digit (LSB)
MOV AH,00H ; Load AH with 00H (MSB)
MOV BX,03E8H ; Load BX with 03E8H (place value of 1st decimal digit)
MUL BX ; Multiply AX with BX (weightage value of 1st digit in AX)
MOV NUM, AX ; Store 1st digit weightage value (AX) into NUM
MOV AH,01H ; Use DOS 01H for 2nd digit entry through keyboard
INT 21H
SUB AL,30H ; Subtract 30H form AL to get 2nd decimal digit (LSB)
MOV AH,00H ; Load AH with 00H (MSB)
MOV BX,0064H ; Load BX with 0064H (place value of 2nddecimal digit)
MUL BX ; Multiply AX with BX (weightage value of 2nd digit in AX)
ADD NUM, AX ; Add NUM with AX (add weightage of 1st and 2nddigit)
MOV AH,01H ; Use DOS 01H for 3rd digit entry through keyboard
INT 21H
SUB AL,30H ; Subtract 30H form AL to get 3rd decimal digit (LSB)
MOV AH,00H ; Load AH with 00H (MSB)
MOV BX,000AH ; Load BX with 000AH (place value of 3rddecimal digit)
MUL BX ; Multiply AX with BX (weightage value of 3rd digit in AX)
ADD NUM, AX ; Add NUM with AX (add weightage of 3rd digit)
MOV AH,01H ; Use DOS 01H for 4th digit entry through keyboard
INT 21H
SUB AL,30H ; Subtract 30H for0m AL to get 4th decimal digit (LSB)
MOV AH,00H ; Load AH with 00H (MSB)
ADD NUM, AX ; Add NUM with AX (for obtain final number)
ENDM
; macro for displaying result of 5-digit decimal number 00000 - 99999
DISPLAY MACRO RES ; DISPLAY macro display RES (result of addition)
MOV AX, RES ; Load AX with RES value (lower word of dividend)
MOV DX,0000H ; Load DX with 0000H value ((upper word of dividend)
MOV BX,2710H ; Load BL with 2710H as divisor (place value of 1stdigit)
DIV BX ; Divide (DX:AX) by BX
MOV RES, DX ; Store DX into RES for next division (Remainder)
ADD AL,30H ; Add AL with 30H (1st digit ASCII hex) (Quotient)
Microprocessor Programming & Interfacing Lab (20CP202P)
B. Tech 3rd (CSE) 2022-23 89
MOV DL, AL ; Load DL with AL (1st digit ASCII hex)
MOV AH,02H ; Use of DOS 02H for 1st decimal digit ASCII hex value
INT 21H ; display on screen 
MOV AX, RES ; Load AX with RES value (lower word of dividend)
MOV DX,0000H ; Load DX with 0000H value ((upper word of dividend)
MOV BX,03E8H ; Load BL with 03E8H as divisor (place value of 2
nddigit)
DIV BX ; Divide (DX:AX) by BX
MOV RES, DX ; Store DX into RES for next division (Remainder)
ADD AL,30H ; Add AL with 30H (2nd digit ASCII hex) (Quotient)
MOV DL, AL ; Load DL with AL (2nd digit ASCII hex)
MOV AH,02H ; Use of DOS 02H for 2nddecimal digit ASCII hex value
INT 21H ; display on screen 
MOV AX, RES ; Load AX with RES value (lower word of dividend)
MOV DX,0000H ; Load DX with 0000H value ((upper word of dividend)
MOV BX,0064H ; Load BL with 0064H as divisor (place value of 3rd digit)
DIV BX ; Divide (DX:AX) by BX
MOV RES, DX ; Store DX into RES for next division (Remainder) 
ADD AL,30H ; Add AL with 30H (3rd digit ASCII hex) (Quotient)
MOV DL, AL ; Load DL with AL (3rd digit ASCII hex)
MOV AH,02H ; Use of DOS 02H for 3rd decimal digit ASCII hex value
INT 21H ; display on screen
MOV AX, RES ; Load AX with RES value (lower word of dividend)
MOV DX,0000H ; Load DX with 0000H value ((upper word of dividend)
MOV BX,000AH ; Load BL with 000AH as divisor (place value of 4thdigit)
DIV BX ; Divide (DX:AX) by BX
MOV RES, DX ; Store DX into RES as 5
th decimal digit (Remainder)
ADD AL,30H ; Add AL with 30H (4th digit ASCII hex) (Quotient)
MOV DL, AL ; Load DL with AL (4th digit ASCII hex)
MOV AH,02H ; Use of DOS 02H for 4th decimal digit ASCII hex value
INT 21H ; display on screen
MOV AX, RES ; Store RES into AX as 5th decimal digit
ADD AL, 30H ; Add AL with 30H (5th digit ASCII hex)
MOV DL, AL ; Load DL with AL (5th digit ASCII hex)
MOV AH,02H ; Use of DOS 02H for 5th decimal digit ASCII hex value
INT 21H ; display on screen 
ENDM
DATA SEGMENT ; DS declared in separate user defined data segment
CR EQU 0DH
LF EQU 0AH
MSG1 DB 'ENTER 4-DIGIT DECIMAL NUMBER1: ','$' 
MSG2 DB CR, LF,'ENTER 4-DIGIT DECIMAL NUMBER2: ','$'
MSG3 DB CR, LF,'RESULT OF TWO 4-DIGIT DECIMAL NUMBERS 
 ADDITION: ','$'
NUM1 DW ?
NUM2 DW ?
RES DW ?
DATA ENDS
CODE SEGMENT
ASSUME CS: CODE, DS:DATA
START: MOV AX, DATA
MOV DS, AX
PRINT MSG1
READ NUM1 ; Call macro name READ for NUM1
PRINT MSG2
READ NUM2 ; Call macro name READ for NUM1
MOV AX, NUM1
ADD AX, NUM2
MOV RES, AX
PRINT MSG3
DISPLAY RES ; Call macro name DISPLAY to display RES 
MOV AX,4C00H
INT 21H
CODE ENDS
END START