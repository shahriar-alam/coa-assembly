.MODEL SMALL

.STACK 100H

.DATA

A DW 'The Sum of $'
B DW ' and $'
C DW ' is $'
D DW '. $'
E DW 'However, if we multiply $'
F DW ' the product will be $'
G DW 'On the other hand if we subtract $'
H DW ' , the result will be $'
I DB 0
J DB 0

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV AH,AL
    MOV BL,AH
    MOV I,BL
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    MOV J,BH
    
    ADD BH,BL
    SUB BH,48
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,9
    LEA DX,D
    INT 21H
    
    MOV AH,9
    LEA DX,E
    INT 21H
    
    MOV AH,2
    MOV DL,I
    INT 21H
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,2
    MOV DL,J
    INT 21H
    
    MOV AH,9
    LEA DX,F
    INT 21H
    
    MOV AL,I
    SUB AL,48
    
    MOV BL,J
    SUB BL,48
    
    MUL BL
    
    ADD AL,48
    
    MOV AH,2
    MOV DL,AL
    INT 21H
    
    MOV AH,9
    LEA DX,D
    INT 21H
    
    MOV AH,9
    LEA DX,G
    INT 21H
    
    MOV AH,2
    MOV DL,I
    INT 21H
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,2
    MOV DL,J
    INT 21H
    
    MOV AH,9
    LEA DX,H
    INT 21H
    
    MOV AL,I
    SUB AL,48
    
    MOV BL,J
    SUB BL,48
    
    SUB AL,BL
    ADD AL,48
    
    MOV AH,2
    MOV DL,AL
    INT 21H
    
    MOV AH,9
    LEA DX,D
    INT 21H
    
    MAIN ENDP
END MAIN