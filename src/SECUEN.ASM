Code SEGMENT
   ASSUME CS:Code, DS:Data

   XOR AX, AX
   MOV AX, Data
   MOV DS, AX

   XOR CX, CX
   XOR DI, DI
   MOV DI, 10
   
   Read:
   XOR BX, BX
   CMP CX, 1
   JG Operation
   JE ReadTama

   MOV AH, 09H
   MOV DX, OFFSET ReadS
   INT 21H
   JMP ReadN

   ReadTama:
   MOV AH, 09H
   MOV DX, OFFSET ReadT
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
   CMP BX, 0
   JE Error
   INC CX
   PUSH BX
   XOR BX, BX
   JMP Read

   Error:
   MOV AH, 09H
   MOV DX, OFFSET SysERR
   INT 21H
   XOR BX, BX
   JMP Read

   Operation:

   MOV AH, 09H
   MOV DX, OFFSET Salto
   INT 21H

   MOV AH, 09H
   MOV DX, OFFSET SUS
   INT 21H

   XOR BX, BX
   POP BX

   XOR CX, CX
   POP CX

   XOR AX, AX
   MOV AX, 1

   Print:
   XOR SI, SI

   PUSH AX

   CMP AX, 1
   JE PushN

   PUSH AX
   MOV AH, 02H
   MOV DL, ','
   INT 21H

   XOR AX, AX
   POP AX

   PushN:
   XOR DX, DX
   DIV DI
   PUSH DX
   INC SI
   CMP AX, 0
   JNE PushN

   PopN:
   MOV AH, 02H
   XOR DX, DX
   POP DX
   ADD DL, 30H
   INT 21H
   SUB SI, 1
   CMP SI, 0
   JNE PopN

   XOR AX, AX
   POP AX
   ADD AX, BX
   LOOP Print

   MOV AH, 4CH
   INT 21H

Code ENDS

Data SEGMENT
   ReadT DB 10,13,'ESCRIBE EL TAMANO ENTRE DOS NUMERO: $'
   ReadS DB 'ESCRIBE EL VECES QUE QUIERE REPETIR: $'
   SysERR DB 10,13,'DEBE SER MAYOR QUE 0$'
   Salto DB 10,13,'$'
   SUS DB 10,13,'SU SECUENCIA ES: $'
Data ENDS
END
