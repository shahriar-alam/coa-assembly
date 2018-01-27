.MODEL SMALL

.STACK 100H

.DATA

A DW 10,13,'TYPE A HEX NUMBER, 0-FFFF: $'

B DW 10,13,'TYPE A HEX NUMBER, 0-FFFF: $'

C DW 10,13,'THE SUM IS: $'

D DW 10,13,'ILLEGAL INPUT, TRY AGAIN: $'

X DW 0

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BX,0
    
    MOV CX,4
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    
    INPUT1:
    JCXZ COUNTER
    
    MOV AH,1
    INT 21H
    
    CMP AL,13
    JE COUNTER
    
    CMP AL,58
    JB NUMBER1
    
    CMP AL,71
    JB CHARACTER1
    
    JMP ERROR1
    
    
    
    
    NUMBER1:
    
    CMP AL,48
    JB ERROR1
    
    ROL BX,4
    
    SUB AL,48
    OR BL,AL
    
    DEC CX
    
    JMP INPUT1
    
    CHARACTER1:
    
    CMP AL,65
    JB ERROR1
    
    ROL BX,4
    
    SUB AL,55
    OR BL,AL
    
    DEC CX
    
    JMP INPUT1
    
    
    ERROR1:
    MOV BX,0
    MOV CX,4
    
    MOV AH,9
    LEA DX,D
    INT 21H
    
    JMP INPUT1
    
    
    
    
    
    COUNTER:
    
    MOV X,BX
    
    MOV BX,0
    
    MOV CX,4
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    
    INPUT2:
    JCXZ ADDITION
    
    MOV AH,1
    INT 21H
    
    CMP AL,13
    JE ADDITION
    
    CMP AL,58
    JB NUMBER2
    
    CMP AL,71
    JB CHARACTER2
    
    JMP ERROR2
    
    NUMBER2:
    CMP AL,48
    JB ERROR2
    
    SUB AL,48
    ROL BX,4
    OR BL,AL
    
    DEC CX
    
    JMP INPUT2
    
    CHARACTER2:
    
    CMP AL,65
    JB ERROR2
    
    ROL BX,4
    
    SUB AL,55
    OR BL,AL
    
    DEC CX
    
    JMP INPUT2
    
    
    
    ERROR2:
    MOV BX,0
    MOV CX,4
    
    MOV AH,9
    LEA DX,D
    INT 21H
    
    JMP INPUT2
    
    
    ADDITION:
    MOV CX,4
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV AX,X
    
    ADD BX,AX
    
    JC ONE
    
    
    
    OUTPUT:
    JCXZ ENDC
    
    
    
    ROL BX,4
    MOV DL,BL
    AND DL,00001111B
    
    CMP DL,10
    JB NUMBER
    
    JMP CHARACTER
    
    NUMBER:
    
    MOV AH,2
    ADD DL,48
    INT 21H
    
    DEC CX
    
    JMP OUTPUT
    
    CHARACTER:
    MOV AH,2
    ADD DL,55
    INT 21H
    
    DEC CX
    
    JMP OUTPUT
    
    ONE:
    MOV AH,2
    MOV DL,49
    INT 21H
    
    JMP OUTPUT
    
    ENDC:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN