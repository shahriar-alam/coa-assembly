.MODEL SMALL

.STACK 100H

.DATA

.CODE

MAIN PROC
    
    MOV AH,2
    MOV CX,127
    MOV BL,10
    MOV BH,128
    
    TOP:
    MOV DL,BH
    INC BH
    CMP BH,255
    JE ENDC
    INT 21H
    MOV DL,32
    INT 21H
    DEC BL
    CMP BL,0
    JE NEWLINE
    CMP CX,0
    JE ENDC
    LOOP TOP
    
    NEWLINE:
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV BL,10
    
    JMP TOP
    
    ENDC:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN