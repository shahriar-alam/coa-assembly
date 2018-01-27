.MODEL SMALL

.STACK 100H

.DATA

A DW 'Enter a HEX digit (A-F): ','$'
B DW 10,13,' The Decimal value of ','$'
C DW ' is: ','$'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    ;USER INPUT
    MOV AH,9
    LEA DX,A
    INT 21H
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    ;OUTPUT
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    SUB BL,17
    
    MOV AH,2
    MOV DL,49
    INT 21H
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN