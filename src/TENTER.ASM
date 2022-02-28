Code SEGMENT
        ASSUME CS:Code, DS: Data

        XOR AX, AX
        MOV AX, Data
        MOV DS, AX

        MOV AH, 09H
        XOR DX, DX
        MOV DX, OFFSET Id
        INT 21H

        XOR DX,DX
        MOV DX, OFFSET Names
        INT 21H

        XOR DX, DX
        MOV DX, OFFSET LastNAME
        INT 21H

        MOV AH, 4CH
        INT 21H
Code ENDS

Data SEGMENT
        Id DB '15-0094', 0AH, '$'
        Names DB 'Ming Jia', 0AH, '$'
        LastName DB 'Tsai Huang$'
Data ENDS
END
