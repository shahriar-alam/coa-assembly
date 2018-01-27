.MODEL SMALL

.STACK 100H

.DATA

A DW 10,13,'ENTER A HEX DIGIT: $'
B DW 10,13,'IN DECIMAL IT IS: $'
C DW 10,13,'DO YOU WANT TO DO IT AGAIN?(Y/N) $'
D DW 10,13,'ILLEGAL CHARACTER - ENTER 0-9 OR A-F: $'


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
    MOV BH,AL
    
    COMPARE:
    CMP BH,'9'
    JBE DISPLAY1
    
    CMP BH,71
    JA DISPLAY2
    
    CMP BH,71
    JB DISPLAY3
    
    DISPLAY1:
    CMP BH,48
    JB DISPLAY2
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    JMP OPTION
    
    DISPLAY2:
    MOV AH,9
    LEA DX,D
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    JMP COMPARE
    
    JMP INPUT
    
    DISPLAY3:
    CMP BH,65
    JB DISPLAY2
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,2
    MOV DL,49
    INT 21H
    
    MOV AH,2
    SUB BH,17
    MOV DL,BH
    INT 21H
    
    JMP OPTION
    
    OPTION:
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL,'Y'
    JE INPUT
    CMP AL,'N'
    JE ENDC
    JMP OPTION
    
    ENDC:
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN