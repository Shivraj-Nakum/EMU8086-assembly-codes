DATA SEGMENT
     N2 DB 34H,45H,23H,12H,99H 
     N3 DW ?
     
DATA ENDS

CODE  SEGMENT
      ASSUME CS:CODE , DS:DATA

START:MOV AX,DATA
      MOV DS,AX
      
      MOV AX,0000H
      MOV BX,0000H
      MOV SI ,OFFSET N2     ;SI as pointer of N2 
      MOV DI ,OFFSET N3 
      MOV CX,05H 
           
L1:   MOV BL,[SI]
      ADD AX,BX
      INC SI
       
      DEC CX
      JNZ L1
            
      MOV [DI],BX
      MOV AX,[DI]
     
      MOV AX,4C00H
      INT 21H

CODE  ENDS      
      END START   
      
        
        
