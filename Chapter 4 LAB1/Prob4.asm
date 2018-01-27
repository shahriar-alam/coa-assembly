.MODEL SMALL

.STACK 100H

.DATA

A DW 10,13,'##########','$'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    ;OUTPUT
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN