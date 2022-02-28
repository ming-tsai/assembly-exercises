Code SEGMENT
        ASSUME CS: Code
                XOR AX, AX
                XOR DX, DX

                MOV AH, 01H
                INT 21H

                MOV DL, AL
                MOV AH, 02H
                INT 21H

                MOV AH, 4CH
                INT 21H
        Code ENDS 
END
