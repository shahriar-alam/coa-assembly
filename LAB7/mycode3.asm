.MODEL SMALL
 
.STACK 100H

.DATA

A DW 10,13,'TYPE A HEX NUMBER(0 TO FFFF): $'

B DW 10,13,'IN BINARY IT IS $'

C DW 10,13,'ILLEGAL HEX DIGIT,TRY AGAIN: $'



.CODE

MAIN PROC
    
    MOV AX,@DATA
    
    MOV DS,AX
    
    
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    XOR BX,BX
    
    MOV CX,4
    
    INPUT:
    
    JCXZ OUTPUT
    
    SHL BX,4
    
    MOV AH,1
    INT 21H
    
    CMP AL,58
    JB NUMBER
    
    CMP AL,71
    JB CHARACTER
    
    JMP ILLEGAL
    
    NUMBER:
    
    CMP AL,48
    JB ILLEGAL
    
    SUB AL,48
    OR BL,AL
    
    DEC CX
    
    
    
    JMP INPUT
    
    CHARACTER:
    CMP AL,65
    JB ILLEGAL
    
    SUB AL,55
    OR BL,AL
    
    DEC CX
    
    
    
    JMP INPUT
    
    ILLEGAL:
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV CX,4
    
    XOR BX,BX
    
    JMP INPUT
     
    OUTPUT:
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV CX,16
    
    BINARY:
    
    JCXZ ENDC
    SHL BX,1
    JC ONE
    JMP ZERO
    
    ONE:
    MOV AH,2
    MOV DL,'1'
    INT 21H
    
    DEC CX
    JMP BINARY
    
    ZERO:
    MOV AH,2
    MOV DL,'0'
    INT 21H
    
    DEC CX
    JMP BINARY    
    
    ENDC:
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN