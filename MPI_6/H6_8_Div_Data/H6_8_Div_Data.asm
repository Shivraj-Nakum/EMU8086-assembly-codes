CODE    SEGMENT ;Segment Declaration
        
        ASSUME CS:CODE ;Assume CODE As CS(Code Segment)-->Directly Loaded(Along With SS)

START:  MOV AX,0099H
        MOV BL,88H;Storing 88H(*Bit)In BL

        DIV BL;Division Of AX By BX
        
        MOV BX,AX;Storing Values Of AX In BX
        
        ;Terminating DOS?? Function By Making AX=4C00H
        ;09H Display Screen Function
        MOV AX,4C00H ;Replacing Value At AX With 4C00H
        INT 21H ;Interrupt Function
        
CODE    ENDS
        
        END START
        
        ;INPUT
        ;For 8 Bit Division Convert The Numberator In 16Bit(AX-Dividend) And Denominator As 8Bit(SRC-Divisor>
        ;For 16 Bit Division Convert The Numberator In 32Bit(DX(U),AX(L)-Dividend) And Denominator As 16Bit(SRC-Divisor>
        ;Just Like Multiplication, In Division We Have Same Syntax;
        ;MUL SRC
        ;DIV SRC
        ;SRC Is Divisor
        ;Direct Data Value Is Not Allowed As Source Operand
        
        ;OUTPUT
        ;Floating Numbers Not Allowed
        ;We Will Be Storing It In Quotient(8 For 8Bit And 16 For 16Bit) And Remainder(8 For 8Bit And 16 For 16Bit)
        ;8-Bit: AL->Quotient And AH->Remainder -->Overflow Can Occur In If Quotient Is Of More Than 8Bit
        ;8-Bit: AX->Quotient And DX->Remainder -->Overflow Can Occur In If Quotient Is Of More Than 16Bit  