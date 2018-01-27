.MODEL SMALL
 
.STACK 100H

.DATA

A DW 10,13,'TYPE A CHARACTER: $'

B DW 10,13,'THE ASCII CODE OF $'

C DW ' IN HEX IS: $'



X DB 0

Y DB 0

.CODE

MAIN PROC
    
    MOV AX,@DATA
    
    MOV DS,AX
    
    INPUT:
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    MOV X,AL
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,2
    MOV DL,X
    INT 21H
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV CX,2
    
    PRINT:
    
    ROL BL,4
    MOV DL,BL
    JCXZ INPUT
    AND DL,00001111B
    
    CMP DL,10
    JB NUMBER
    JMP CHARACTER
    
    NUMBER:
    
    MOV AH,2
    ADD DL,48
    INT 21H
    
    DEC CX
    
    JMP PRINT
    
    CHARACTER:
    MOV AH,2
    ADD DL,55
    INT 21H
    
    DEC CX
    
    JMP PRINT 
    
    
    
    ENDC:
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN