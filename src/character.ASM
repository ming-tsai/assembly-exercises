Codigo Segment
ASSUME CS:Codigo

MOV AH, 02H 
MOV DL, '@'
INT 21H

MOV AH,4CH
INT 21H
Codigo ends
end
