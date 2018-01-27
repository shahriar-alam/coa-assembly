.MODEL SMALL

.STACK 100H

.DATA
A DB 0
B DB 0
C DB 0
D DW 'Enter Three Initials: ','$'

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;USER INPUT
    MOV AH,9
    LEA DX,D
    INT 21H
    MOV AH,1
    INT 21H
    MOV A,AL
    MOV AH,1
    INT 21H
    MOV B,AL
    MOV AH,1
    INT 21H
    MOV C,AL
    
    ;OUTPUT
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV AH,2
    MOV DL,A
    INT 21H
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV AH,2
    MOV DL,B
    INT 21H
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV AH,2
    MOV DL,C
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP

END MAIN