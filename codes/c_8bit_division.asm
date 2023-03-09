CODE SEGMENT
     ASSUME CS:CODE , DS:CODE 
     N1 DB 28H
     N2 DB 02H
     N3 DW ?
     

START:   MOV AX,CODE
         MOV DS,AX  
         
         MOV AX,0000H
         MOV AL,N1
         DIV N2
         MOV N3,AX
         
         MOV AX,4C00H
         INT 21H

CODE     ENDS
         END START        