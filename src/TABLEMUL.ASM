Code SEGMENT
   ASSUME CS: Code, DS: Data

   XOR AX, AX
   MOV AX, Data
   MOV DS, AX

   XOR DX, DX
   MOV AH, 09H
   MOV DX, OFFSET Number
   INT 21H

   XOR BX, BX
   MOV DI, 10

   ReadN:
   XOR AX, AX
   XOR DX, DX
   MOV AH, 08H
   INT 21H
   CMP AL, 13
   JE Operation
   CMP AL, 30H
   JL ReadN
   CMP AL, 39H
   JG ReadN
   MOV AH, 02H
   MOV DL, AL
   INT 21H
   SUB DL, 30H
   PUSH DX
   MOV AX, BX
   MUL DI
   POP BX
   ADD BX, AX
   JMP ReadN

   Operation:

   MOV AH, 09H
   MOV DX, OFFSET Salto
   INT 21H

   MOV DX, OFFSET Result
   INT 21H

   MOV CX, 12

   Mult:
   XOR AX, AX
   MOV AX, BX
   MUL CX
   PUSH AX
   Loop Mult

   XOR BX, BX

   Print:
   XOR AX, AX
   XOR CX, CX

   POP AX

   PushN:
   XOR DX, DX
   DIV DI
   PUSH DX
   INC CX
   CMP AX, 0
   JNE PushN

   XOR DX, DX

   MOV AH, 09H
   MOV DX, OFFSET Salto
   INT 21H

   MOV AH, 02H
   PopN:
   XOR DX, DX
   POP DX
   ADD DL, 30H
   INT 21H
   Loop PopN

   INC BX
   CMP BX, 12
   JNE Print

   MOV AH, 4CH
   INT 21H
Code ENDS

Data SEGMENT
   Salto DB 10,13,'$'
   Number DB 'DIGITAL EL VALOR PARA MULTIPLICAR: $'
   Result DB 'SU TABLA DE MULTIPLICACION ES: ',10,13,'$'
Data ENDS

END
