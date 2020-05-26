;INCLUDE DOS.MAC HERE
INCLUDE DOS.MAC

STACK_SEG SEGMENT STACK USE16
 DB 100 DUP(?)
STACK_SEG ENDS

DATA_SEG SEGMENT 'DATA' USE16
;DEFINE ARRAY HERE

ARRAY DB 4,7,2,9,3,1,5,6

MESSAGE DB 'CE302 LAB6',0DH,0AH
NEWLINE DB 0DH,0AH,'$'

DATA_SEG ENDS

CODE_SEG SEGMENT PARA 'CODE' PUBLIC USE16
ASSUME CS:CODE_SEG, DS:DATA_SEG, SS:STACK_SEG



PRINT PROC NEAR
PRINTCHAR ARRAY
RET
ENDP



MAIN PROC FAR
INITIATE



LEA DI,ARRAY
MOV SI,DI
;;;;;PRINT ARRAY SHOULD BE DEFINED AS A SEPERATE PROCEDURE FROM THE MAIN

;CALL PRINT 


MOV CX,8

BACK:
MOV AL,[SI]
MOV BL,[SI+1] 
ADD AL,30H
ADD BL,30H

PRINTCHAR AL

PRINTSTRING NEWLINE
INC SI
LOOP BACK
;;;;;PRINT ARRAY END

DEC SI
;;;;; BUBBLE SORT SKELETON - THIS PART HERE IS TO ONLY GIVE YOU AN ABSTRACT ILLUSTRATION ABOUT HOW TO IMPLEMENT A SORTING ALGORITHM
;;LEA DI,ARRAY ; Initialize DI again
;;MOV SI,DI
;;;;; Sort the ARRAY
MOV DX,8     ;Length of the Array -> counter of Back2
BACK2:       ;Outer Loop
MOV CX,7     ;Length of the Array -> counter of Back1
             ;CX set to 8 after each iteration for inner loop
DEC SI
DEC SI
DEC SI
DEC SI
DEC SI
DEC SI
DEC SI
DEC DX
CMP DX,0
JE ENDPROGRAM

BACK1:
MOV AL,[SI]
MOV BL,[SI+1]
CMP AL,BL    ;Check whether swap is necessary
JA SWAP
INC SI       ;Else increment DI to the next element
LOOP BACK1   ;And return Inner Loop
JMP BACK2

SWAP:
;swap two elements AL,BL to [DI],[DI+1]

MOV [SI],BL
INC SI
MOV [SI],AL


LOOP BACK1
JMP BACK2

ENDPROGRAM:
;;;;;; PRINT SORTED ARRAY HERE

MOV CX,08

SORTEDPRINT:
XOR BX,BX
MOV BL,[SI]
ADD BL,30H
PRINTCHAR BL
INC SI
LOOP SORTEDPRINT

RET
MAIN ENDP
CODE_SEG ENDS
END MAIN