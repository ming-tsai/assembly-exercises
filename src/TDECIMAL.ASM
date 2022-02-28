Code SEGMENT
   ASSUME CS: Code
   XOR BX, BX
   MOV BX, 6879
   XOR CX, CX
   XOR AX, AX
   MOV AX, BX

   Sube:
   XOR DX, DX
   MOV BX, 10
   DIV BX
   PUSH DX
   ADD CX, 1
   CMP AX, 0
   JNE Sube

   Arriba:
   MOV AH, 02H
   XOR DX, DX
   POP DX
   ADD DL, 30H
   INT 21H
   Loop Arriba

   MOV AH, 4CH
   INT 21H  

Code ENDS

END
