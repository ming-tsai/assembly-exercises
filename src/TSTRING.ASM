Code SEGMENT
   ASSUME CS: Code,DS:Data

   XOR AX, AX
   MOV AX, Data
   MOV DS, AX

   MOV AH, 09H
   XOR DX, DX
   MOV DX, OFFSET Names
   INT 21H

   MOV DX, OFFSET LastName
   INT 21H

   MOV AH, 4CH
   INT 21H

Code ENDS

Data SEGMENT
   Names DB 'MING $'
   LastName DB 'TSAI$'
Data ENDS
END
