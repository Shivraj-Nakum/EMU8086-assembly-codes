CODE SEGMENT
     ASSUME CS:CODE , DS:CODE 
     N1 DW 840CH
     N2 DW 0B2CAH
     N3 DW ?
     

START:   MOV AX,CODE
         MOV DS,AX  
         
         MOV AX,N1
         MOV BX,N2 
         MOV CL,00H
         SUB AX,BX 
         JNC L1
         INC CL
         NEG AX
         
L1:      MOV N3,AX
         
         MOV AX,4C00H
         INT 21H

CODE     ENDS
         END START        