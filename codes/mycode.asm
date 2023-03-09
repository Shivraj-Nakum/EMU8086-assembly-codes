; Read the ASCII string through keyboard and display result on screen. ;PALINDROME

PRINT MACRO MSG
      MOV AH, 09H
      MOV DX, OFFSET MSG
      INT 21H
ENDM  

DATA SEGMENT
     CR EQU 0DH
     LF EQU 0AH
     MSG1 DB 'ENTER THE STRING: ','$'
     MSG2 DB CR, LF,'REVERSE STRING: ','$'
     MSG3 DB CR ,LF,'PALINDROME ','$' 
     MSG4 DB CR ,LF,'NOT PALINDROME ','$'
     STRING DB 20 DUP (00H)
     REVSTRING DB 20 DUP (00H)
     CNT DW 0000H
DATA ENDS 

CODE SEGMENT
            ASSUME CS: CODE, DS:DATA
START:      MOV AX, DATA
            MOV DS, AX
            PRINT MSG1
            MOV SI, OFFSET STRING 
L2:         MOV AH,08H
            INT 21H
            CMP AL,0DH      
            JZ L1 
            MOV [SI], AL
            INC CNT
            INC SI
            MOV DL, AL 
            MOV AH,02H
            INT 21H
            JMP L2
L1:         PRINT MSG2 
            MOV SI, OFFSET STRING
            MOV DI, OFFSET REVSTRING
            MOV BX, CNT
L3:         MOV DL, [SI+BX-1]
            MOV [DI], DL
            INC DI
            PUSH DI
            MOV AH,02H
            INT 21H
            POP DI
            DEC BX
            JNZ L3
            MOV SI, OFFSET STRING       
            MOV DI, OFFSET REVSTRING    
            MOV CX, CNT                 
L5:         MOV AL, [SI]                 
            CMP AL, [DI]                
            JNE L4                      
            INC SI                    
            INC DI                      
            LOOP L5                     
            PRINT MSG3   
            JMP L6                      
L4:         PRINT MSG4
L6:         MOV AX,4C00H
            INT 21H
CODE ENDS
END START
