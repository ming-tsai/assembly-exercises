Code Segment
    Assume CS: Code

        MOV AH, 02H
        MOV DL, 'M'
        INT 21H

        MOV DL, 'i'
        INT 21H

        MOV DL, 'n'
        INT 21H

        MOV DL, 'g'
        INT 21H

        MOV DL, ' '
        INT 21H

        MOV DL, 'J'
        INT 21H

        MOV DL, 'i'
        INT 21H	

        MOV DL, 'a'
        INT 21H

        MOV AH,4CH
        INT 21H

    Code ENDS
END
