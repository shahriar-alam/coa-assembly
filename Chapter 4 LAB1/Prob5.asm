.MODEL SMALL

.STACK 100H

.DATA

B DW 010,013,'#######','$'
C DW 010,013,'##','$'
D DW '##','$'
E DB 0
F DB 0
G DB 0
H DW 010,013,'Enter Three Initials: ','$'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    ;INPUT
    MOV AH,9
    LEA DX,H
    INT 21H
    MOV AH,1
    INT 21H
    MOV E,AL
    MOV AH,1
    INT 21H
    MOV F,AL
    MOV AH,1
    INT 21H
    MOV G,AL
    
    ;OUTPUT
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV AH,2
    MOV DL,E
    INT 21H
    
    MOV AH,2
    MOV DL,F
    INT 21H
    
    MOV AH,2
    MOV DL,G
    INT 21H
    
    MOV AH,9
    LEA DX,D
    INT 21H
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN