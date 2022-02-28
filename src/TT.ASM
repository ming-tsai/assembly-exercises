Code SEGMENT
   ASSUME CS: Code, DS: Data

   XOR AX, AX
   MOV AX, Data
   MOV DS, AX

   MOV DI, 10
   XOR BX, BX
   XOR AX, AX  
   
   ReadNumber: 
   MOV AH, 08H
   INT 21H
   CMP AL, 13
   JE Operations
   CMP AL, '+'
   JE Aritmetric
   CMP AL, '-'
   JE Aritmetric
   CMP AL, '*'
   JE Aritmetric
   CMP AL, '/'
   JE Aritmetric
   CMP AL, 30H
   JL ReadNumber
   CMP AL, 39H
   JG ReadNumber
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

   Aritmetric:
   XOR AH, AH
   MOV SI, AX
   MOV AH, 02H
   MOV DL, AL
   INT 21H
   PUSH BX
   XOR BX, BX
   JMP ReadNumber

   Operations:
   MOV AH, 02H
   MOV DL, '='
   INT 21H

   POP AX
   CMP SI, '+'
   JE Adder
   CMP SI, '-'
   JE Subs
   CMP SI, '*'
   JE Mult
   CMP SI, '/'
   JE Divi
   MOV AX, BX
   JMP Print

   Adder:
   ADD AX, BX
   JMP Print

   Subs:
   SUB AX, BX
   JMP Print

   Mult:
   MUL BX
   JMP Print

   Divi:
   XOR DX, DX
   CMP BX, 0
   JNE Next
   MOV AH, 09H
   MOV DX, OFFSET ErrorDiv
   INT 21H
   JMP EndProgram
   Next:
   DIV BX

   Print:
   XOR CX, CX
   MOV BX, 10

   PushCaracter:
   XOR DX, DX
   DIV BX
   PUSH DX
   INC CX
   CMP AX, 0
   JNE PushCaracter

   XOR AX, AX

   MOV AH, 02H
   PopCaracter:
   XOR DX, DX
   POP DX
   ADD DL, 30H
   INT 21H
   LOOP PopCaracter

   EndProgram:
   MOV AH, 4CH
   INT 21H

Code ENDS

Data SEGMENT
   ErrorDiv DB 10,13,'ERROR$'
Data ENDS

END
