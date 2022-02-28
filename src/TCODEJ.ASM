Code SEGMENT
   ASSUME CS:Code, DS: Data

   XOR BX,BX
   XOR AX, AX

   MOV AX, Data
   MOV DS, AX

   MOV AH, 01H
   INT 21H

   MOV BL,AL
   SUB BL, 30H
   XOR AX, AX
   MOV AH, 01H
   INT 21H

   MOV AH, 09H
   MOV DX, OFFSET Jump
   INT 21H

   MOV BH,AL
   SUB BH, 30H
   CMP BL,BH
   JG Label1
   JL Label2
   JE Label3

   MOV AH, 4CH
   INT 21H

   Label1:
   SUB BL, BH
   MOV DL, BL

   MOV AH, 02H
   ADD DL, 30H
   INT 21H

   MOV AH, 4CH
   INT 21H

   Label2:
   ADD BL, BH
   MOV DL, BL

   MOV AH, 02H
   ADD DL, 30H
   INT 21H

   MOV AH, 4CH
   INT 21H

   Label3:
   XOR DX, DX
   MOV AH, 09H
   MOV DX, OFFSET Equal
   INT 21H

   MOV AH, 4CH
   INT 21H

 
Code ENDS

Data SEGMENT
   Jump DB 10,13,'$'
   Equal DB 'Es igual$'
Data ENDS
END
