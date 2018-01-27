.MODEL SMALL  
.STACK 100H
.DATA 
A DW 'INCORRECT EXPRESSION$'
B DW 'TOO MANY LEFT EXPRESSION$'
C DW 'TOO MANY RIGHT EXPRESSION$'
D DW 'CORRECT EXPRESSION$'
E DW 'TYPE Y IF YOU WANT TO CONTINUE: $'
F DW 'ENTER AN ALGEBRAIC EXPRESSION: $'
X DB 0
COUNTER DB 0

.CODE 
MAIN PROC
        MOV AX,@DATA      
        MOV DS,AX
        
        
        
        MOV AH,9
        LEA DX,F
        INT 21H
        
        TOP:
        MOV AH,1
        INT 21H
        
        CMP AL,40
        JE PUSH1
        
        CMP AL,91
        JE PUSH1
        
        CMP AL,123
        JE PUSH1
        
        CMP AL,93
        JE POP2
        
        CMP AL,41
        JE POP1
        
        CMP AL,125
        JE POP3
        
        CMP AL,13
        JE PRINT
        
        JMP TOP
        
        PUSH1:
        MOV AH,0
        PUSH AX
        
        INC COUNTER
        
        JMP TOP
        
        POP1:
        POP BX
        SUB AL,1
        CMP AL,BL
        JNE INCORRECT
        
        DEC COUNTER
        
        JMP TOP
        
        
        POP2:
        POP BX
        SUB AL,2
        CMP AL,BL
        JNE INCORRECT
        
        DEC COUNTER
        
        JMP TOP
        
        POP3:
        POP BX
        SUB AL,2
        CMP AL,BL
        JNE INCORRECT
        
        DEC COUNTER
        
        JMP TOP
        
        
        INCORRECT:
        MOV BH,1
        MOV X,BH
        
        DEC COUNTER
        
        JMP TOP
        
        PRINT:
        MOV AH,2
        MOV DL,10
        INT 21H
        
        
        MOV BL,COUNTER
        
        MOV BH,X
        CMP BH,1
        JE ERROR
        
        CMP BL,0
        JG LEFT
        
        CMP BL,0
        JL RIGHT
        
        CMP BL,0
        JE CORRECT
        
        ERROR:
        MOV AH,9
        LEA DX,A
        INT 21H
        
        JMP OPTION
        
        LEFT:
        MOV AH,9
        LEA DX,B
        INT 21H
        
        JMP OPTION
        
        RIGHT:
        MOV AH,9
        LEA DX,C
        INT 21H
        
        JMP OPTION
        
        CORRECT:
        MOV AH,9
        LEA DX,D
        INT 21H
        
        JMP OPTION
        
        OPTION:
        
        MOV AH,2
        MOV DL,10
        INT 21H
        
        MOV AH,2
        MOV DL,13
        INT 21H
        
        
        MOV AH,9
        LEA DX,E
        INT 21H
        
        MOV AH,1
        INT 21H
        
        MOV BL,0
        MOV COUNTER,BL
        
        
        
        CMP AL,'Y'
        JE RETURN
        
        JMP ENDC
        
        RETURN:
        MOV AH,2
        MOV DL,10
        INT 21H
        
        MOV AH,2
        MOV DL,13
        INT 21H
        
        MOV AH,9
        LEA DX,F
        INT 21H
        
        
        JMP TOP
        
        
        ENDC:
        MOV AH,4CH
        INT 21H
        
        
        MAIN ENDP
END MAIN        