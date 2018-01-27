.MODEL SMALL

.STACK 100H

.DATA

A DW 10,13,'Enter First Digit(5-9): $'
B DW 10,13,'Enter Second Digit(5-9): $'
C DW 10,13,'The Sum is= $'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    ;INPUT
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV BH,AL
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL
    
    ADD BH,BL
    SUB BH,58 ;MANIPULATION
    
    ;OUTPUT
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV AH,2
    MOV DL,49
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN