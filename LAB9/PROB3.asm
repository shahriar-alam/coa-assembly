.MODEL SMALL

.STACK 100H

.DATA

OVERFLOWM DW 10,13,'OUT OF RANGE. ENTER AGAIN: $'
ERRORM DW 10,13,'ILLEGAL INPUT, TRY AGAIN: $'
ENTER DW 'ENTER SECONDS: $'
HOUR DW ' HOUR $'
MINUTE DW ' MINUTE $'
SECOND DW ' SECOND.$'

X DW 0

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,ENTER
    INT 21H
    
    CALL INDEC
    
    MOV AX,BX
    
    MOV BX,3600
    
    MOV DX,0
    
    DIV BX
    
    MOV X,DX
    
    MOV BX,AX
    
    MOV AH,2
    MOV DL,10
    INT 21H
    
    CALL OUTDEC
    
    
    MOV AH,9
    LEA DX,HOUR
    INT 21H
    
    MOV AX,X
    MOV BX,60
    MOV DX,0
    
    DIV BX
    
    MOV X,DX
    
    MOV BX,AX
    
    CALL OUTDEC
    
    MOV AH,9
    LEA DX,MINUTE
    INT 21H
    
    MOV BX,X
    
    CALL OUTDEC
    
    MOV AH,9
    LEA DX,SECOND
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    
INDEC PROC
                                    
    JMP CLEAR                       ;JUMP TO CLEAR
    
    OVERFLOW:
    
    MOV CH,0                        ;CLEARING CH REGISTER
    
    ZERO:
    
    JCXZ OVERFLOW2                  ;JUMP IF CX IS EQUAL TO ZERO
    
    POP AX                          ;POPPING AX
    
    LOOP ZERO                       ;LOOPING TO ZERO
    
    OVERFLOW2:
    MOV AH,9
    LEA DX,OVERFLOWM                ;SHOWING OVERFLOW MESSAGE
    INT 21H
    JMP CLEAR                       ;JUMP TO CLEAR
    
    
    ERROR:                       
    MOV AH,9
    LEA DX,ERRORM                   ;SHOWING ERROR MESSAGE               
    INT 21H

    CLEAR:                        
    XOR AX,AX                       ;CLEARING AX
    XOR BX,BX                       ;CLEARING BX
    XOR CX,CX                       ;CLEARING CX
    
    MOV AH,1                     
    INT 21H                         ;GETTING INPUT
    
    INPUT:                       
    CMP AL,48                  
    JL ERROR                        ;JUMP TO ERROR IF INPUT IS LESS THAN '0'

    CMP AL,57                 
    JG ERROR                        ;JUMP TO ERROR IF INPUT IS GREATER THAN '9'

    AND AX,000FH                    ;MAKING CHARACTER TO NUMBER

    PUSH AX                         ;PUSHING AX TO STACK
    
    INC CL                          ;INCREMENTING CL
    
    MOV AX,10                       ;MOVING 10 TO AX
    
    MUL BX                          ;MULTIPLYING AX WITH BX
    
    JO OVERFLOW                     ;JUMP IF OVERFLOW OCCURS
    
    CMP AX,65535
    JA OVERFLOW                     ;JUMP IF AX IS GREATER THAN 32767
    
    MOV BX,AX                       ;MOVING VALUE OF AX TO BX
    
    POP AX                          ;POPING TO AX
    
    DEC CL                          ;DECREMENTING CL
    
    ADD BX,AX                       ;ADD BX AND AX
    
    JO OVERFLOW                     ;JUMP IF OVERFLOW OCCURS
    
    CMP BX,65535
    JA OVERFLOW                     ;JUMP IF BX IS GREATER THAN 32767
    
    MOV AH,1                  
    INT 21H                         ;GETTING INPUT

    CMP AL,13                 
    JNE INPUT                       ;JUMP TO INPUT IF AL IS NOT CR                                              
    
    RET                             ;RETURNING TO CALLING PROCEDURE
    
    INDEC ENDP

OUTDEC PROC
    
    
    CMP BX,0                        ;JUMP IF RESULT IS EQUAL OR GREATER THAN ZERO
    JA START
    
    MOV AH,2
    MOV DX,'0'
    INT 21H
    
    RET
                                    
    START:                        
                                   
    MOV AX,BX                       ;MOVING BX TO AX
    XOR CX,CX                       ;CLEARING CX
    MOV BX,10                       ;MOVING 10 TO BX

    REPEAT:                      
    XOR DX,DX                       ;CLEARING DX
    DIV BX                          ;DIVIDING AX WITH BX
    PUSH DX                         ;PUSHING DX TO STACK
    INC CX                          ;INCREMENTING CX
    CMP AX,0                        ;CMP AX WITH ZERO
    JNE REPEAT                      ;JUMP IF NOT EQUAL TO REPEAT
    
    MOV AH,2                        ;SET AH TO 2
    
    DISPLAY:                     
    POP DX                          ;POPING TO DX
    ADD DL,48                       ;ADDING 48
    INT 21H                         ;SHOWING DIGIT
    LOOP DISPLAY                    ;LOOPING DISPLAY

    RET                             ;RETURNING TO CALLING PROCEDURE

    OUTDEC ENDP

END MAIN