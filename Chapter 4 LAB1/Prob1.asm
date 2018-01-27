.MODEL SMALL
.STACK 100H
.DATA
A DW 10,13,'The sum of ','$'
B DW ' and ','$'
C DW ' is ','$'
D DB 0
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;PRINTING ?
    MOV AH,2
    MOV DL,'?'
    INT 21H
    
    ;USER INPUT
    MOV AH,1
    INT 21H
    MOV BL,AL
    MOV D,AL
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    ;SUM
    ADD BL,BH
    SUB BL,48
    
    ;OUTPUT
    MOV AH,9
    LEA DX,A
    INT 21H
    MOV AH,2
    MOV DL,D
    INT 21H
    MOV AH,9
    LEA DX,B
    INT 21H 
    MOV AH,2
    MOV DL,BH
    INT 21H
    MOV AH,9
    LEA DX,C
    INT 21H
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
