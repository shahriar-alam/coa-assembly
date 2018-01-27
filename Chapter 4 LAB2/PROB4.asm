.MODEL SMALL

.STACK 100H

.DATA

A DW 10,13,' 00000    9999999$'
B DW 10,13,'0     0   9      9$'
C DW 10,13,'0     0   9999999$'
D DW 10,13,'0     0          9$'
E DW 10,13,' 00000    9999999$'
F DW 10,13,'$'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,9
    LEA DX,F
    INT 21H
    
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,9
    LEA DX,F
    INT 21H
    
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV AH,9
    LEA DX,F
    INT 21H
    
    
    MOV AH,9
    LEA DX,D
    INT 21H
    
    MOV AH,9
    LEA DX,F
    INT 21H
    
    
    MOV AH,9
    LEA DX,E
    INT 21H
    
    
    
    MAIN ENDP
END MAIN