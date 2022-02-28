Code SEGMENT
   ASSUME CS:Code, DS:Data

   XOR DX, DX
   XOR AX, AX
   MOV AX, Data
   MOV DS, AX

   MOV CL,20
   MOV BH,15
   CMP CL,BH
   JG Mayor
   MOV DX, OFFSET Cod_Menor
   JMP Resultado

   Mayor:
   MOV DX, OFFSET Cod_Mayor

   Resultado:
   MOV AH, 09H
   INT 21H

   MOV AH, 4CH
   INT 21H

Code ENDS

Data SEGMENT
  Cod_Mayor DB 'MAYOR$'
  Cod_Menor DB 'MENOR$'      
Data ENDS
END
