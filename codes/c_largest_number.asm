DATA SEGMENT
     N1 DB 05H
     N2 DB 34H,45H,23H,12H,09H
     N3 DB ?
DATA ENDS

CODE  SEGMENT
      ASSUME CS:CODE , DS:DATA

START:MOV AX,DATA
      MOV DS,AX
      
      MOV CL,N1             ;CL=05H
      DEC CL                ;CL=04H as only 4 comparisions (you can also take N1 as 04H then no need for this line)
      MOV SI ,OFFSET N2     ;SI as pointer of N2
      MOV AL,[SI]           ;content of SI moved to AL (AL=34H)

L2:   INC SI                ;NOW [SI]=45H
      CMP AL,[SI]           ;compare AL and SI if AL < SI then carry=1 otherwise carry=0
      JNC L1                ;if no carry jump to L1  (AL > SI)
      MOV AL,[SI]           ;move SI to AL

L1:   DEC CL                ;decriment CL count
      JNZ L2                ;if CL not zero jump to L2   (loop runs till CL =0)
      MOV N3,AL             ;at end which ever no. is large moved to N3 
      
      MOV AX,4C00H
      INT 21H

CODE  ENDS      
      END START   
      