.MODEL SMALL
 
.STACK 100H

.DATA

A DW 10,13,'ENTER A CHARACTER: $'

B DW 10,13,'THE ASCII CODE OF $'

C DW ' IN BINARY IS: $'

D DW 10,13,'THE NUMBER OF 1 BITS IS: $'

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
    
    MOV CX,8
    
    PRINT:
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,2
    MOV DL,X
    INT 21H
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    
    BINARY:
    
    JCXZ PRINT2
    
    SHL BL,1
    JC ONE
    JMP ZERO
    
    
    ONE:
    MOV AH,2
    MOV DL,'1'
    INT 21H
    
    INC BH
    
    DEC CX
    
    JMP BINARY
    
    ZERO:
    MOV AH,2
    MOV DL,'0'
    INT 21H
    
    DEC CX
    
    JMP BINARY
    
    PRINT2:
    MOV AH,9
    LEA DX,D
    INT 21H
    
    ADD BH,48
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    ENDC:
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN