Code SEGMENT
   ASSUME CS:Code, DS: Data

   XOR AX, AX
   MOV AX, Data
   MOV DS, AX

   XOR CX, CX
   MOV DI, 10
   XOR DX, DX

   Read:
   CMP CX, 2
   JE Operation
   XOR BX, BX
   MOV AH, 09H
   MOV DX, OFFSET Posicion
   INT 21H

   MOV AH, 02H
   MOV DL, CL
   ADD DL, 31H
   INT 21H

   MOV DL, ':'
   INT 21H

   ReadN:
   XOR AX, AX
   XOR DX, DX
   MOV AH, 08H
   INT 21H
   CMP AL, 13
   JE Save
   CMP AL, 30H
   JL ReadN
   CMP AL, 39H
   JG ReadN
   CMP BX, 6552
   JG Test
   CONTINUO:
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

   Save:
   INC CX
   PUSH BX
   JMP Read

   Test:
   CMP AL, 36H
   JL Continuo
   MOV AH, 09H
   MOV DX, OFFSET VNull
   INT 21H
   JMP Read

   Operation:
   XOR BX, BX
   XOR AX, AX
   POP AX
   POP BX

   CMP AX, BX
   JL Lower

   SUB AX, BX
   JMP Print

   Lower:
   ADD AX, BX

   Print:
   XOR CX, CX

   PushN:
   XOR DX, DX
   DIV DI
   PUSH DX
   INC CX
   CMP AX, 0
   JNE PushN

   XOR DX, DX
   MOV AH, 09H
   MOV DX, OFFSET Result
   INT 21H

   MOV AH, 02H
   LoopN:
   XOR DX, DX
   POP DX
   ADD DL, 30H
   INT 21H
   Loop LoopN

   MOV AH, 4CH
   INT 21H
Code ENDS

Data SEGMENT
   Posicion DB 10,13,'DIGITA EL VALOR$'
   Result DB 10, 13, 'SU RESULTADO ES: $'
   VNull DB 10, 13, 'ERROR$'
Data ENDS
END
