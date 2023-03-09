;32 bit subtraction

; MNEMONIC DESTINATION , SOURCE 
;whenever one operand and it is memory operand than we must specify e.g.- word ptr [BX] --> word access. (w.)
; e.g- byte ptr [BX] --> byte access. (b.)
;whenever ans in negative --> stored in 2's compliment form 


DATA SEGMENT
     N1 DD 12345678H
     N2 DD 0AABBCCDDH
     N3 DD ?
DATA ENDS

CODE    SEGMENT
        ASSUME CS:CODE DS:DATA
START:  MOV AX,DATA         ;DATA DECLARED IN DATA SEGMENT IS MOVED TO AX
        MOV DS,AX           ;DIRECTLY CANT BE LOADED TO DS REGISTER
        
                            ;POINTER DECLARED AND INTIALISED BY THIS INSTRUCTIOINS      
        MOV SI,OFFSET N1    ;SI CAN BE USED AS POINTER NOW FOR N1 VARIABLE --5678
        MOV DI,OFFSET N2    ;DI CAN BE USED AS POINTER NOW FOR N2 VARIABLE --CCDD
        MOV BX,OFFSET N3    ;BX CAN BE USED AS POINTER NOW FOR N3 VARIABLE   ____
        
        MOV AX,[SI]         ;AX- 5678
        SUB AX,[DI]         ;5678 - 0CCDD
        MOV [BX],AX         ;TRANSFER LOWER WORD OF N3
        
        MOV AX,[SI+2]       ;MOVE SI + 2BYTE TO AX (UPPER WORD)
        SBB AX,[DI+2]       ;SUB AX + DI INCREMENTED 2 BYTE (upper word subtraction)  
        JNC L1              ;JUMP TO L1 IF NO CARRY
        
        NOT WORD PTR[BX]    ;taking 1's complement of result
        NOT AX              ;1'S COMPLEMENT OF UPPER WORD
        ADD [BX],01H
        JNC L1
        INC AX              ;IF CARRY IS THERE WE INCREMENT IN UPPERWORD OF RESULT(1'S COMPLEMENT)
        
L1:     MOV [BX+2],AX       ;TRANSFERING UPPERWORD AFTER ADC INSTRUCTION IN BX+2BYTE LOCATION
        
        MOV AX,4C00H
        INT 21H

CODE    ENDS                                   
        END START
        
        ; 1234 5678 H 
        ; AABB CCDD H
        ;       [BX]