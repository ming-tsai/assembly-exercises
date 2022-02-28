Code SEGMENT
   ASSUME CS: Code

   XOR AX,AX
   MOV AH,01H
   INT 21H

   XOR DX,DX
   SUB AL,30H
   MOV DH,AL
   XOR AL,AL
   MOV AH,01H
   INT 21H

   SUB AL,30H
   MOV DL,AL
   ADD DL,DH

   MOV AH,02H
   ADD DL,30H
   INT 21H

   MOV AH,4CH
   INT 21H
Code ENDS
END
