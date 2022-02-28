Code SEGMENT
   ASSUME DS: Data, CS:Code

   XOR AX, AX
   MOV AX, Data
   MOV DS, AX

   XOR CX, CX
   ReadNumber:
   CMP CX, 3
   JE Compare
   XOR AX, AX
   MOV AH, 09H
   MOV DX, OFFSET Valor
   INT 21H
   Read:
   MOV AH, 08H
   INT 21H
   CMP AL, 30H
   JL Read
   CMP AL, 39H
   JG Read
   MOV AH, 02H
   MOV DL, AL
   INT 21H
   MOV AH, 09H
   MOV DX, OFFSET Salto
   INT 21H
   XOR AH, AH
   PUSH AX
   INC CX
   JMP ReadNumber

   Compare:
   MOV AH, 09H
   MOV DX, OFFSET Menor
   INT 21H

   
   POP AX
   POP BX
   POP CX

   CMP AX, BX
   JL Amenor

   CMP BX, CX
   JL Bmenor

   Cmenor:
   MOV DL, CL
   JMP EndProgram

   Amenor:
   CMP AX, CX
   JL Amenor1
   JMP Cmenor

   Amenor1:
   MOV DL, AL
   JMP EndProgram

   Bmenor:
   MOV DL, BL

   EndProgram:
   MOV AH, 02H
   INT 21H

   MOV AH, 4CH
   INT 21H

Code ENDS

Data SEGMENT
   Menor DB 10,13,'EL MENOR ES: $'
   Salto DB 10, 13, '$'
   Valor DB 'DIGITA NUMERO: $'
Data ENDS
END
