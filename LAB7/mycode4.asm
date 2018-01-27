.MODEL SMALL
 
.STACK 100H

.DATA

A DW 10,13,'TYPE A BINARY NUMBER, UP TO 16 DIGITS: $'

B DW 10,13,'IN HEX IT IS $'

C DW 10,13,'ILLEGAL INPUT, TRY AGAIN: $'



.CODE

MAIN PROC
    
    MOV AX,@DATA
    
    MOV DS,AX
    
    
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    XOR BX,BX
    
    MOV CX,16
    
    INPUT:
    
    JCXZ OUTPUT
    
    
    
    MOV AH,1
    INT 21H
    
    CMP AL,'1'
    JE NUMBER
    
    CMP AL,'0'
    JE NUMBER
    
    CMP AL,13
    JE OUTPUT
    
    JMP ERROR
    
    NUMBER:
    SUB AL,48
    SHL BX,1
    OR BL,AL
    
    DEC CX
    
    JMP INPUT
    
    ERROR:
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV CX,16
    
    XOR BX,BX
    
    JMP INPUT
    
    OUTPUT:
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV CX,4
    
    PRINT:
    
    ROL BX,4
    MOV DL,BL
    JCXZ ENDC
    AND DL,00001111B
    
    CMP DL,10
    JB NUMBER1
    JMP CHARACTER1
    
    NUMBER1:
    
    
    
    MOV AH,2
    ADD DL,48
    INT 21H
    
    DEC CX
    
    JMP PRINT
    
    
    
    
    CHARACTER1:
    MOV AH,2
    ADD DL,55
    INT 21H
    
    DEC CX
    
    JMP PRINT    
    
        
    
    ENDC:
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN