CODE    SEGMENT ;Segment Declaration
        
        ASSUME CS:CODE ;Assume CODE As CS(Code Segment)-->Directly Loaded(Along With SS)
                
START:  MOV AL,99H ;Making AL = 99H Since In Multiplication Both Operands Cannot Be Direct Values
        MOV BL,88H ;Making BL = 88H Since In Multiplication Both Operands Cannot Be Direct Values
        
        MUL BL ;Why????
        
        MOV BX,AX ;Stores Answer In BX
        
        ;Terminating DOS?? Function By Making AX=4C00H
        ;09H Display Screen Function
        MOV AX,4C00H ;Replacing Value At AX With 4C00H
        INT 21H ;Interrupt Function
        
CODE    ENDS
        
        END START   
        
        ;We Need Only One Register To Store The Data Since A*B=B*A
        ;Direct Data Value As Source Operand Is Not Allowed(Immideate Addressing Mode>
        
        ;INPUT
        ;First Input Must Be In AL And Second As Source Operand(8-Bit)
        ;First Input Must Be In AX And Second As Source Operand(16-Bit) 
        
        ;OUTPUT
        ;8-Bit : AX Is Used -->16-Bit ANSWER
        ;16-Bit ; DX(Upper Value Is Stored Here> And AX(Lower Value Is Stored Here> Both Are Used -->32-Bit ANSWER 