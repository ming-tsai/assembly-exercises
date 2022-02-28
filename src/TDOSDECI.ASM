Code SEGMENT
   ASSUME CS:Code

   XOR BX, BX
   MOV DI, 10
   Leer:
   XOR AX, AX
   XOR DX, DX
   MOV AH, 08H
   INT 21H
   CMP AL, 0DH
   JE Print
   CMP AL, 30H
   JL Leer
   CMP AL, 39H
   JG Leer
   MOV AH, 02H
   MOV DL, AL
   INT 21H
   SUB AL, 30H
   PUSH AX
   MOV AX, BX
   MUL DI
   POP BX
   XOR BH, BH
   ADD BX, AX
   JMP Leer

   Print:
   MOV AX, 10
   ADD AX, BX

   XOR CX, CX
   XOR BX, BX
   MOV BX, 10

   PushPila:
   XOR DX, DX
   DIV BX
   PUSH DX
   INC CX
   CMP AX, 0
   JNE PushPila

   XOR AX, AX
   XOR DX, DX
   MOV AH, 02H
   MOV DL, 10
   INT 21H

   PopPila:
   XOR DX, DX
   POP DX
   ADD DL, 30H
   INT 21H
   Loop PopPila
   
   MOV AH, 4CH
   INT 21H

Code ENDS
END
