.MODEL SMALL

.STACK 100H

.DATA

A DW 10,13,'ENTER A DECIMAL DIGIT STRING: $'

B DW 10,13,'THE SUM OF THE DIGITS IN HEX IS: $'

C DW 10,13,'ILLEGAL INPUT, ENTER AGAIN: $'

X DW 0

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BX,0
    
    
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    
    INPUT1:
    
    
    MOV AH,1
    INT 21H
    
    CMP AL,13
    JE COUNTER
    
    CMP AL,58
    JB NUMBER1
    
    
    
    JMP ERROR1
    
    
    
    
    NUMBER1:
    
    CMP AL,48
    JB ERROR1
    
    MOV AH,0
    SUB AL,48
    ADD BX,AX
    
    JMP INPUT1
    
    
    ERROR1:
    MOV BX,0
    
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    JMP INPUT1
     
    
    COUNTER:
    MOV CX,4
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
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