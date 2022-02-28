Code SEGMENT
    ASSUME CS: Code, DS: Data

    XOR AX, AX
    MOV AX, Data
    MOV DS, AX

    XOR BX, BX
    MOV DI, 10
    XOR CX, CX

    ReadNumber:
    CMP CX, 3
    JE Validar
    XOR AX, AX
    MOV AH, 08H
    INT 21H
    CMP AL, 13
    JE SaveNumber
    CMP AL, 30H
    JL ReadNumber
    CMP AL, 39H
    JG ReadNumber
    MOV AH, 02H
    MOV DL, AL
    INT 21H
    XOR AH, AH
    SUB AL, 30H
    PUSH AX
    MOV AX, BX
    MUL DI
    POP BX
    ADD BX, AX
    JMP ReadNumber

    SaveNumber:
    CMP BX, 0
    JE ErrorValor
    PUSH BX
    MOV AH, 02H
    MOV DL, 10
    INT 21H

    INC CX
    XOR BX, BX
    JMP ReadNumber

    ErrorValor:
    MOV AH, 09H
    MOV DX, OFFSET ValorCero
    INT 21H
    JMP ReadNumber

    Validar:
    POP AX
    POP BX
    POP DX

    CMP AX, BX
    JE Igual1

    CMP BX, DX
    JE Diferente1

    CMP AX, DX
    JE Diferente1

    MOV AH, 09H
    MOV DX, OFFSET Escaleno
    INT 21H
    JMP EndProgram

    Igual1:
    CMP AX, DX
    JNE Diferente1

    Igual2:
    MOV AH, 09H
    MOV DX, OFFSET Equilatero
    INT 21H
    JMP EndProgram

    Diferente1:
    MOV AH, 09H
    MOV DX, OFFSET Isosceles
    INT 21H
    JMP EndProgram

    EndProgram:
    MOV AH, 4CH
    INT 21H
Code ENDS

Data SEGMENT
    ValorCero DB 10,13,'NIGUNO DE LOS LADOS PUEDE SER 0',10,13,'$'
    Equilatero DB 'Equilatero$'
    Isosceles DB 'ISOSCELES$'
    Escaleno DB 'ESCALENO$'
Data ENDS
END
