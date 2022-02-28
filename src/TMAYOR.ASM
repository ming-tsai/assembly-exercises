Code SEGMENT
   ASSUME CS: Code, DS: Data

   XOR AX, AX
   MOV AX, Data
   MOV DS, AX

   XOR CX, CX
   XOR BX, BX
   MOV DI, 10

   Read:
   CMP CX, 3
   JE Validar

   MOV AH, 09H
   MOV DX, OFFSET ReadValues
   INT 21H

   MOV AH, 02H
   MOV DL, CL
   ADD DL, 31H
   INT 21H

   MOV DL, ':'
   INT 21H

   ReadNumber:
   XOR AX, AX
   MOV AH, 08H
   INT 21H
   CMP AL, 13
   JE SaveValues
   CMP AL, 30H
   JL ReadNumber
   CMP AL, 39H
   JG ReadNumber
   CMP BX, 6552
   JG SysError
   Continuar:
   MOV AH, 02H
   MOV DL, AL
   INT 21H
   XOR AH, AH
   SUB AL, 30H
   PUSH AX
   MOV AX, BX
   MUL DI
   POP BX
   ADD BX, AX
   JMP ReadNumber
 
   SaveValues:
   CMP BX, 0
   JE ValuesCero
   PUSH BX
   INC CX
   XOR BX, BX
   JMP Read

   ValuesCero:
   MOV AH, 09H
   MOV DX, OFFSET VarCero
   INT 21H
   JMP ReadNumber

   SysError:
   CMP AL, 35H
   JLE Continuar

   MOV AH, 09H
   MOV DX, OFFSET NotMore
   INT 21H
   XOR BX, BX
   JMP Read

   Validar:
   MOV AH, 09H
   MOV DX, OFFSET ValuesTop
   INT 21H

   POP AX
   POP BX
   POP CX

   CMP AX, BX
   JG AMayor

   CMP BX, CX
   JG BMayor

   MOV AX, CX
   JMP Print

   AMayor:
   CMP AX, CX
   JG Print

   MOV AX, CX
   JMP Print

   BMayor:
   MOV AX, BX

   Print:
   XOR CX, CX
   MOV BX, 10

   PushNumber:
   XOR DX, DX
   DIV BX
   PUSH DX
   INC CX
   CMP AX, 0
   JNE PushNumber

   MOV AH, 02H
   PopNumber:
   POP DX
   ADD DL, 30H
   INT 21H
   Loop PopNumber

   MOV AH, 4CH
   INT 21H
   
Code ENDS

Data SEGMENT
   ReadValues DB 10,13,'DIGITA VALOR $'
   ValuesTop DB 10,13,'EL VALOR MAYOR ES: $'
   VarCero DB 10,13,'NO PUEDE SER 0$'
   NotMore DB 10,13,'NO PUEDE SER MAYOR DE 65535$'
Data ENDS
END
