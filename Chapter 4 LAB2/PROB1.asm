.MODEL SMALL

.STACK 100H

.DATA

A DW 10,13,'Enter First Digit X: $'
B DW 10,13,'Enter Second Digit Y: $'
C DW 10,13,'The Swapped Values are:$'
D DW 10,13,'X= $'
E DW 10,13,'Y= $'

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
    
    XCHG BH,BL ;SWAP
    
    ;OUTPUT
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV AH,9
    LEA DX,D
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,9
    LEA DX,E
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN