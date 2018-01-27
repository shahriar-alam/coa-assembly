.MODEL SMALL

.STACK 100H

.DATA

A DW 10,13,'TYPE FIRST BINARY, UP TO 8 DIGIT: $'

B DW 10,13,'TYPE SECOND BINARY NUMBER UP TO 8 DIGITS: $'

C DW 10,13,'THE BINARY SUM IS: $'

D DW 10,13,'ILLEGAL INPUT, TRY AGAIN: $'


.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BX,0
    
    MOV CX,8
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    
    INPUT1:
    JCXZ COUNTER
    
    MOV AH,1
    INT 21H
    
    CMP AL,13
    JE COUNTER
    
    CMP AL,'1'
    JE SET1
    
    CMP AL,'0'
    JE SET1
    
    JMP ERROR1
    
    SET1:
    
    SHL BL,1
    
    SUB AL,48
    OR BL,AL
    
    DEC CX
    
    JMP INPUT1
    
    ERROR1:
    MOV BL,0
    MOV CX,8
    
    MOV AH,9
    LEA DX,D
    INT 21H
    
    JMP INPUT1
    
    NEXT:
    MOV AH,2
    MOV DL,48
    INT 21H
    
    
    
    COUNTER:
    
    MOV CX,8
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    
    INPUT2:
    JCXZ ADDITION
    
    MOV AH,1
    INT 21H
    
    CMP AL,13
    JE ADDITION
    
    CMP AL,'1'
    JE SET2
    
    CMP AL,'0'
    JE SET2
    
    JMP ERROR2
    
    SET2:
    
    SUB AL,48
    SHL BH,1
    OR BH,AL
    
    DEC CX
    
    JMP INPUT2
    
    ERROR2:
    MOV BH,0
    MOV CX,8
    
    MOV AH,9
    LEA DX,D
    INT 21H
    
    JMP INPUT2
    
    
    ADDITION:
    MOV CX,8
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    
    ADD BH,BL
    
    JC ONE
    
    
    OUTPUT:
    JCXZ ENDC
    
    DEC CX
    
    SHL BH,1
    JC ONE
    
    JMP ZERO1
    
    ONE:
    MOV AH,2
    MOV DL,49
    INT 21H
    
    JMP OUTPUT
    
    ZERO1:
    MOV AH,2
    MOV DL,48
    INT 21H
    
    JMP OUTPUT
    
    ENDC:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN