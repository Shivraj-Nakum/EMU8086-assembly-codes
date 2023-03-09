DATA SEGMENT
     N1 DB 05H
     N2 DB 46H,57H,78H,34H,16H
     N3 DB 5 DUP(?)
     N4 DB 5 DUP(?)
DATA ENDS

CODE  SEGMENT
      ASSUME CS:CODE , DS:DATA

START:MOV AX,DATA
      MOV DS,AX

      MOV CL,N1
      MOV SI,OFFSET N2
      MOV DI,OFFSET N3       ;ODD
      MOV BX,OFFSET N4       ;EVEN

L3:   MOV AL,[SI]    ;46H
      ROR AL,01H
      JNC L1
      ROL AL,01H
      MOV [DI],AL
      INC DI
      JMP L2
      
L1:   ROL AL,01H
      MOV [BX],AL
      INC BX 
      
L2:   INC SI
      DEC CL
      JNZ L3

      MOV AX,4C00H
      INT 21H

CODE  ENDS      
      END START   
      