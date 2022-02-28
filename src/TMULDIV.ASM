Code SEGMENT
   ASSUME CS:Code
   XOR AX, AX
   XOR BX, BX

   MOV AX, 2
   MOV BX, 4
   MUL BX

   XOR DX, DX
   MOV BX, AX
   MOV DL, AL
   MOV AH, 02H
   ADD DL, 30H
   INT 21H

   MOV AX, BX
   ADD AX, 6
   MOV BX, 2
   XOR DX, DX
   DIV BX

   MOV BX, AX
   MOV AH, 02H
   ADD DL, 30H
   INT 21H

   MOV DL, BL
   MOV AH, 02H
   ADD DL, 30H
   INT 21H

   MOV AH, 4CH
   INT 21H
Code ENDS
END
