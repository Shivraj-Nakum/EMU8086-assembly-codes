CODE SEGMENT
     ASSUME CS:CODE , DS:CODE
     N1 DW 9999H
     N2 DW 8888H
     N3 DD ?

START:   MOV AX,CODE
         MOV DS,AX
         
         MOV AX,N1
         MUL N2
         MOV SI,OFFSET N3  ; SI is declared as pointer of N3
         MOV [SI],AX       ;lower word of result is stored in N3
         MOV [SI+2],DX     ;upper word of result is stored in N3
         
         MOV AX,4C00H
         INT 21H

CODE     ENDS
         END START        