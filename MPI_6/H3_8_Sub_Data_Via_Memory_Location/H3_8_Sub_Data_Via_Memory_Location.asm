DATA    SEGMENT
        N1 DB 99H;User Defined N1 Variable Which Is Byte Type Has 99H Value
        N2 DB 88H;User Defined N2 Variable Which Is Byte Type Has 88H Value
        N3 DB ?;User Defined N2 Variable Which Is Byte Type Has No Value
DATA    ENDS



CODE    SEGMENT ;Segment Declaration
        
        ASSUME CS:CODE,DS:DATA ;Assume CODE As CS(Code Segment)-->Directly Loaded(Along With SS)
                               ;Assume DATA As DS(Data Segemnt)-->Not Loaded(Along With ES)
                
        ;For Initializing Data Segment
        ;AX Will Start From 003 Since 3Bytes(1+1+1) Are Reserved To DS
START:  MOV AX,DATA ;Storing Offset Address Of DATA In AX
        MOV DS,AX ;Moving Address OF Code To DS To Load Data Segment
        
        MOV AL,N1 ;Making AL = 88H Since In Subtraction Both Operands Cannot Be Memory Operand-->AL Segment
        
        SUB AL,N2 ;Subtracting AL And N2 And Stores The Difference Value
        
        JNC L1 ;Jump To L1 If Borrow Is Not Generated
        NEG AL ;NEG Destination;2's Complement;Why????
                             
L1:     MOV N3,AL ;Stores Answer In N3
                  ;First Lower Byte Is Stored And Then Upper Byte
        
        ;Terminating DOS?? Function By Making AX=4C00H
        ;09H Display Screen Function
        MOV AX,4C00H ;Replacing Value At AX With 4C00H
        INT 21H ;Interrupt Function
        
CODE    ENDS
        
        END START   
        
        ;(1 Memory Location For Each = 8 Bit)
        ;DB = Defined Byte (8 Bit)(Eg. N1 = 25H,23H,55H)
        ;DW = Defined Word (16 Bit)
        ;DD = Double Word (32 Bit)
        ;DQ = Quad Word (64 Bit)
        ;DT = Ten Word (80 Bit)
        
        ;To Change Data While Running Initialize The DS And Then CHange The Value At The Memory Locations In Memory Menu