.MODEL SMALL

.STACK 100H

.DATA

.CODE

MAIN PROC
    
    ;DISPLAY ?
    MOV AH,2
    MOV DL,'?'
    INT 21H
    
    ;INPUT 1ST
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    ;INPUT 2ND
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    ;COMPARE
    CMP BH,BL
    JLE PRINTBH
    JMP PRINTBL
    
    PRINTBH:
    MOV DL,BH
    MOV AH,2
    INT 21H
    
    MOV DL,BL
    INT 21H
    
    JMP ENDC
    
    PRINTBL:
    MOV DL,BL
    MOV AH,2
    INT 21H
    
    MOV DL,BH
    INT 21H
    JMP ENDC
    
    ENDC:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    
    
    
    
    