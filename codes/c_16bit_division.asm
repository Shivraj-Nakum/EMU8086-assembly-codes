CODE SEGMENT
     ASSUME CS:CODE , DS:CODE 
     N1 DW 4444H
     N2 DW 0002H
     N3 DW ?
     

START:   MOV AX,CODE
         MOV DS,AX  
         
         MOV AX,N1
        ; MOV BX,N2
         DIV N2
         MOV N3,AX
         
         MOV AX,4C00H
         INT 21H

CODE     ENDS
         END START        