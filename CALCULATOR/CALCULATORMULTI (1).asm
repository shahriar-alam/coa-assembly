;COA PROJECT

;GROUP 5

;MEMBERS:

;ALAM, SHAHRIAR   15-30130-2
;AKTER, SHARIFA   15-30154-2
;TABASSUM, ROMANA 14-26221-1


;REFERENCE:

;Assembly Language Programming and Organization of the IBM PC By Ytha Y. Yu, Charles Marut
;http://www.slideshare.net/HassnainJamil/mul-div-instructions-in-assembly-language


.MODEL SMALL

.STACK 100H

.DATA

COS1 DW 10,13,'=============================================================================$'
COS2 DW 10,13,'$'
COS3 DW 10,13,'                       PROJECT NAME: SIMPLE CALCULATOR                       $'
COS4 DW 10,13,'                  COURSE INSTRUCTOR: MOHAMMAD SAMAWAT ULLAH                  $'
COS5 DW 10,13,'            COURSE TITLE:COMPUTER ORGANIZATION AND ARCHITECHTURE             $'
COS6 DW 10,13,'               PRESENTED BY: ALAM, SHAHRIAR   15-30130-2                     $'
COS7 DW 10,13,'                             AKTER, SHARIFA   15-30154-2                     $'
COS8 DW 10,13,'                             TABASSUM, ROMANA 14-26221-1                     $'
COS9 DW 10,13,'                        PRESS ANY KEY TO CONTINUE....$'
COS0 DW 10,13,'                                 GROUP 5$'
COS11 DW 10,13,'                               PROGRAM ENDED$'

CHOICEM1 DW 10,13,'PRESS 1 & ENTER FOR ADDITION$'

CHOICEM2 DW 10,13,10,13,'PRESS 2 & ENTER FOR SUBSTRACTION$'

CHOICEM3 DW 10,13,10,13,'PRESS 3 & ENTER FOR MULTIPLICATION$'

CHOICEM4 DW 10,13,10,13,'PRESS 4 & ENTER FOR DIVISION$'

CHOICEM5 DW 10,13,10,13,'PRESS 5 & ENTER TO EXIT$'

CHOICEM DW 10,13,10,13,'PRESS YOUR CHOICE: $'

ERRORM DW 10,13,10,13,'INVALID INPUT, TRY AGAIN: $'

TRYM DW 10,13,'DO YOU WANT TO TRY AGAIN(Y/N): $'

NUMBER1M DW 10,13,'ENTER FIRST DIGIT & PRESS ENTER(-32767 to 32767): $'

NUMBER2M DW 10,13,10,13,'ENTER SECOND DIGIT & PRESS ENTER(-32767 to 32767): $'

OVERFLOWM DW 10,13,10,13,'INVALID INPUT. TRY AGAIN: $'

OVERFLOW1M DW 10,13,'OUT OF RANGE$'

RESULTM DW 10,13,'THE RESULT IS: $'

MATHERRORM DW 10,13,'MATH ERROR$'

QUOTIENTM DW 10,13,'THE QOUTIENT IS: $'

REMAINDERM DW 10,13,10,13,'THE REMAINDER IS: $'

X DW 0

Y DW 0

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,COS3
    INT 21H
    
    MOV AH,9
    LEA DX,COS1
    INT 21H
    
    MOV AH,9
    LEA DX,COS5
    INT 21H
    
    MOV AH,9
    LEA DX,COS2
    INT 21H
    
    MOV AH,9
    LEA DX,COS4
    INT 21H
    
    MOV AH,9
    LEA DX,COS1
    INT 21H
    
    MOV AH,9
    LEA DX,COS0
    INT 21H
    
    MOV AH,9
    LEA DX,COS1
    INT 21H
    
    MOV AH,9
    LEA DX,COS6
    INT 21H
    
    MOV AH,9
    LEA DX,COS2
    INT 21H
    
    MOV AH,9
    LEA DX,COS7
    INT 21H
    
    MOV AH,9
    LEA DX,COS2
    INT 21H
    
    MOV AH,9
    LEA DX,COS8
    INT 21H
    
    MOV AH,9
    LEA DX,COS1
    INT 21H
    
    MOV AH,9
    LEA DX,COS9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    TOP:
    
    
    MOV AX,03H
    INT 10H
    
    MOV CX,0                        ;CLEARING CX
    
    MOV AH,9
    LEA DX,CHOICEM1                 
    INT 21H
    
    MOV AH,9
    LEA DX,CHOICEM2
    INT 21H
    
    MOV AH,9
    LEA DX,CHOICEM3
    INT 21H
    
    MOV AH,9
    LEA DX,CHOICEM4
    INT 21H
    
    MOV AH,9
    LEA DX,CHOICEM5
    INT 21H
    
    MOV AH,9
    LEA DX,CHOICEM
    INT 21H
    
    
    CHOICE:
    
    CALL INDEC
    
    CMP BX,1
    JE CALLADD                      ;JUMP TO CALLADD IF CHOICE WAS 1
    
    CMP BX,2
    JE CALLSUB                      ;JUMP TO CALLSUB IF CHOICE WAS 2
    
    CMP BX,3
    JE CALLMUL                      ;JUMP TO CALLMUL IF CHOICE WAS 3
    
    CMP BX,4
    JE CALLDIV                      ;JUMP TO CALLDIV IF CHOICE WAS 4
    
    CMP BX,5
    JE ENDC
    
    MOV AX,03H
    INT 10H
    
    MOV AH,9
    LEA DX,ERRORM                   ;SHOWING ERROR MESSAGE
    INT 21H
    
    JMP CHOICE                      ;JUMP TO CHOICE
    
    
    CALLADD:
    
    MOV AX,03H
    INT 10H
    
    CALL ADDD                       ;CALLING ADDD PROCEDURE
    
    JMP TRY                         ;JUMP TO TRY
    
    CALLSUB:
    
    
    MOV AX,03H
    INT 10H
    
    
    CALL SUBB                       ;CALLING SUBB PROCEDURE
    
    JMP TRY                         ;JUMP TO TRY
    
    CALLMUL:
    
    MOV AX,03H
    INT 10H
    
    CALL MULL                       ;CALLING MULL PROCEDURE
    
    JMP TRY                         ;JUMP TO TRY
    
    CALLDIV:                        
    
    MOV AX,03H
    INT 10H
    
    CALL DIVV                       ;CALLING DIVV PROCEDURE
    
    JMP TRY                         ;JUMP TO TRY
    
    TRY:
    
    MOV AH,2
    MOV DL,10
    INT 21H
    
    MOV AH,2
    MOV DL,13
    INT 21H
    
    
    MOV AH,9
    LEA DX,TRYM                     ;SHOWING MESSAGE
    INT 21H
    
    
    XOR BL,BL
    
    INPUTRY:
    MOV AH,1
    INT 21H
    
    CMP AL,13
    JE YES
    
    SHL BL,4
    
    OR BL,AL
    
    JMP INPUTRY                         ;GETTING INPUT
     
    YES: 
    CMP BL,'Y'                      ;COMPARING AL WITH CHARACTER 'Y'
    JE TOP                          ;JUMP IF EQUAL TO 'Y'
    
    CMP BL,'y'
    JE TOP
    
    CMP BL,'N'
    JE ENDC
    
    CMP BL,'n'
    JE ENDC
    
    MOV AX,03H
    INT 10H
    
    MOV AH,9
    LEA DX,ERRORM                     ;SHOWING MESSAGE
    INT 21H
    
    XOR BL,BL
    
    JMP INPUTRY
    
    ENDC:
    
    MOV AX,03H
    INT 10H
    
    MOV AH,9
    LEA DX,COS1
    INT 21H
    
    MOV AH,9
    LEA DX,COS11
    INT 21H
    
    MOV AH,9
    LEA DX,COS1
    INT 21H
    
    
    MOV AH,4CH
    INT 21H                         ;GIVE CONTROL TO OS
    
    MAIN ENDP



ADDD PROC
    
    MOV AH,9                        ;SHOWING MESSAGE
    LEA DX,NUMBER1M                                        
    INT 21H
    
    CALL INDEC                      ;CALLING INDEC PROCEDURE TO GET FIRST NUMBER
    
    MOV X,BX                        ;MOVING FIRST NUMBER TO X
    
    MOV AH,9
    LEA DX,NUMBER2M                 ;SHOWING MESSAGE                     
    INT 21H
    
    CALL INDEC                      ;CALLING INDEC PROCEDURE TO GET SECOND NUMBER
    
    MOV AX,X                        ;MOVING FIRST NUMBER TO AX
    
    ADD BX,AX                       ;ADDING FIRST AND SECOND NUMBER
    
    JO OVERFLOWA                    ;JUMP IF OVERFLOW OCCURS
    
    CMP BX,32767
    JG OVERFLOWA                    ;JUMP IF RESULT IS GREATER THAN 32767
    
    CMP BX,-32767
    JL OVERFLOWA                    ;JUMP IF RESULT IS LESS THAN -32767
    
    MOV AX,03H
    INT 10H
    
    MOV AH,9
    LEA DX,RESULTM                  ;SHOWING MESSAGE
    INT 21H
    
    CALL OUTDEC                     ;CALLING OUTDEC PROCEDURE TO SHOW RESULT
    
    RET                             ;RETURNING TO MAIN PROCEDURE
    
    OVERFLOWA:
    
    MOV AX,03H
    INT 10H
    
    
    MOV AH,9
    LEA DX,OVERFLOW1M               ;SHOWING OVERFLOW MESSAGE
    INT 21H
    
    
    RET                             ;RETURNING TO MAIN PROCEDURE
    
    ADDD ENDP


SUBB PROC
    
    MOV AH,9
    LEA DX,NUMBER1M                 ;SHOWING MESSAGE                       
    INT 21H
    
    CALL INDEC                      ;CALLING INDEC PROCEDURE TO GET 1ST NUMBER
    
    MOV X,BX                        ;MOVING FIRST NUMBER TO X
    
    MOV AH,9
    LEA DX,NUMBER2M                 ;SHOWING MESSAGE                     
    INT 21H
    
    CALL INDEC                      ;CALLING INDEC PROCEDURE TO GE THE SECOND NUMBER
    
    MOV AX,X                        ;MOVING FIRST NUMBER TO AX
    
    SUB AX,BX                       ;SUBSTRACT FIRST AND SECOND NUMBER
    
    JO OVERFLOWS                    ;JUMP IF OVERFLOW OCCURS
    
    CMP AX,32767
    JG OVERFLOWS                    ;JUMP IF RESULT IS GREATER THAN 32767
    
    CMP AX,-32767
    JL OVERFLOWS                    ;JUMP IF RESULT IS LESS THAN -32767
    
    MOV BX,AX                       ;MOVING RESULT TO BX
    
    MOV AX,03H
    INT 10H
    
    MOV AH,9
    LEA DX,RESULTM                  ;SHOWING MESSAGE
    INT 21H
    
    CALL OUTDEC                     ;CALLING OUTDEC PROCEDURE TO SHOW RESULT
    
    RET                             ;RETURNING TO MAIN PROCEDURE
    
    OVERFLOWS:
    
    MOV AX,03H
    INT 10H
    
    MOV AH,9                        
    LEA DX,OVERFLOW1M               ;SHOWING OVERFLOW MESSAGE
    INT 21H
    RET                             ;RETURNING TO MAIN PROCEDURE
    
    
    SUBB ENDP


MULL PROC
    
    MOV AH,9
    LEA DX,NUMBER1M                 ;SHOWING MESSAGE                       
    INT 21H
    
    CALL INDEC                      ;CALLING INDEC PROCEDURE TO GET 1ST NUMBER
    
    MOV X,BX                        ;MOVING 1ST NUMBER TO X
    
    MOV AH,9
    LEA DX,NUMBER2M                 ;SHOWING MESSAGE                     
    INT 21H
    
    CALL INDEC                      ;CALLING INDEC PROCEDURE TO GET 2ND NUMBER
    
    MOV AX,X                        ;MOVING 1ST NUMBER TO AX
    
    IMUL BX                         ;MULTYPLYING AX WITH BX
    
    JO OVERFLOW1                    ;JUMP IF OVERFLOW OCCURS
    
    CMP AX,32767
    JG OVERFLOW1                    ;JUMP IF AX IS GREATER THAN 32767
    
    CMP AX,-32767
    JL OVERFLOW1                    ;JUMP IF AX IS LOWER THAN -32767
    
    MOV BX,AX                       ;MOVING RESULT TO BX
    
    MOV AX,03H
    INT 10H
    
    MOV AH,9
    LEA DX,RESULTM                  ;SHOWING MESSAGE
    INT 21H
    
    CALL OUTDEC                     ;CALLING OUTDEC PROCEDURE TO SHOW RESULT
    
    RET                             ;RRETURNING TO MAIN PROCEDURE
    
    OVERFLOW1:
    
    MOV AX,03H
    INT 10H
    
    MOV AH,9
    LEA DX,OVERFLOW1M               ;SHOWING OVERFLOW MESSAGE
    INT 21H
    RET                             ;RETURNING TO MAIN
    
    MULL ENDP


DIVV PROC
    
    MOV AH,9
    LEA DX,NUMBER1M                 ;SHOWING MESSAGE                       
    INT 21H
    
    CALL INDEC                      ;CALLING INDEC PROCEDURE TO GET 1ST NUMBER
    
    MOV X,BX                        ;MOVING 1ST NUMBER TO X
    
    MOV AH,9
    LEA DX,NUMBER2M                 ;SHOWING MESSAGE                     
    INT 21H
    
    CALL INDEC                      ;CALLING INDEC PROCEDURE TO GET 2ND NUMBER
    
    MOV AX,X                        ;MOVING FIRST NUMBER TO AX
    
    CMP BX,0                        ;COMPARING SECOND NUMBER WITH ZERO
    JE MATHERROR                    ;JUMP IF SECOND NUMBER IS ZERO
    
    CWD                             ;CONVERT WORD TO DOUBLE WORD
    
    IDIV BX                         ;DIVIDE AX WITH BX
    
    JO OVERFLOWD                    ;JUMP IF OVERFLOW OCCURS
    
    CMP AX,32767
    JG OVERFLOWD                    ;JUMP IF QUOSIENT IS GREATER THAN 32767
    
    CMP AX,-32767
    JL OVERFLOWD                    ;JUMP IF QUOSIENT IS LESS THAN -32767
    
    MOV X,DX                        ;MOVING REMAINDER TO X
    
    MOV BX,AX                       ;MOVING QUOSIENT TO BX
    
    MOV AX,03H
    INT 10H
    
    MOV AH,9
    LEA DX,QUOTIENTM                ;SHOWING MESSAGE
    INT 21H
    CALL OUTDEC                     ;CALLING OUTDEC PROCEDURE TO SHOW QUOSIENT
    
    MOV AH,9
    LEA DX,REMAINDERM               ;SHOWING MESSAGE
    INT 21H
    
    MOV BX,X                        ;MOVING REMAINDER TO BX
    
    CALL OUTDEC                     ;CALLING OUTDEC PROCEDURE TO SHOW REMAINDER
    
    RET                             ;RETURN TO MAIN PROCEDURE
    
    OVERFLOWD:
    
    MOV AX,03H
    INT 10H
    
    MOV AH,9
    LEA DX,OVERFLOW1M               ;SHOWING OVERFLOW MESSAGE
    INT 21H
    RET                             ;RETURNING TO MAIN PROCEDURE
    
    MATHERROR:
    
    MOV AX,03H
    INT 10H
    
    MOV AH,9
    LEA DX,MATHERRORM               ;SHOWING MATH ERROR MESSAGE
    INT 21H
    RET                             ;RETURNING TO MAIN PROCEDURE
    
    DIVV ENDP

INDEC PROC
                                    
    JMP CLEAR                       ;JUMP TO CLEAR
    
    OVERFLOW:
    
    MOV CH,0                        ;CLEARING CH REGISTER
    
    ZERO:
    
    JCXZ OVERFLOW2                  ;JUMP IF CX IS EQUAL TO ZERO
    
    POP AX                          ;POPPING AX
    
    LOOP ZERO                       ;LOOPING TO ZERO
    
    ENTER:
    MOV AH,1
    INT 21H
    
    CMP AL,13
    JE OVERFLOW2
    
    JMP ENTER
    
    OVERFLOW2:
    
    MOV AX,03H
    INT 10H
    
    
    MOV AH,9
    LEA DX,OVERFLOWM                ;SHOWING OVERFLOW MESSAGE
    INT 21H
    JMP CLEAR                       ;JUMP TO CLEAR
    
    
    ERROR:                       
    
    MOV AX,03H
    INT 10H
    
    
    MOV AH,9
    LEA DX,ERRORM                   ;SHOWING ERROR MESSAGE               
    INT 21H

    CLEAR:                        
    XOR AX,AX                       ;CLEARING AX
    XOR BX,BX                       ;CLEARING BX
    XOR CX,CX                       ;CLEARING CX
    
    MOV AH,1                     
    INT 21H                         ;GETTING INPUT

    CMP AL,'-'                   
    JE MINUS                        ;JUMP IF INPUT WAS '-' CHARACTER

    CMP AL,'+'                    
    JE PLUS                         ;JUMP IF INPUT WAS '+' CHARACTER
    JMP INPUT                       ;JUMP TO INPUT

    MINUS:                       
    MOV CH,1                        ;SETTING 1 IN CH REGISTER

    PLUS:                         
    INT 21H                         ;GETTING INPUT
    
    INPUT:                       
    CMP AL,48                  
    JL ENTER                        ;JUMP TO ERROR IF INPUT IS LESS THAN '0'

    CMP AL,57                 
    JG ENTER                        ;JUMP TO ERROR IF INPUT IS GREATER THAN '9'

    AND AX,000FH                    ;MAKING CHARACTER TO NUMBER

    PUSH AX                         ;PUSHING AX TO STACK
    
    INC CL                          ;INCREMENTING CL
    
    MOV AX,10                       ;MOVING 10 TO AX
    
    MUL BX                          ;MULTIPLYING AX WITH BX
    
    JO OVERFLOW                     ;JUMP IF OVERFLOW OCCURS
    
    CMP AX,32767
    JA OVERFLOW                     ;JUMP IF AX IS GREATER THAN 32767
    
    CMP AX,-32767
    JL OVERFLOW                     ;JUMP IF AX IS LESS THAN -32767
    
    MOV BX,AX                       ;MOVING VALUE OF AX TO BX
    
    POP AX                          ;POPING TO AX
    
    DEC CL                          ;DECREMENTING CL
    
    ADD BX,AX                       ;ADD BX AND AX
    
    JO OVERFLOW                     ;JUMP IF OVERFLOW OCCURS
    
    CMP BX,32767
    JA OVERFLOW                     ;JUMP IF BX IS GREATER THAN 32767
    
    CMP BX,-32767
    JL OVERFLOW                     ;JUMP IF BX IS LESS THAN -32767
    
    MOV AH,1                  
    INT 21H                         ;GETTING INPUT

    CMP AL,13                 
    JNE INPUT                       ;JUMP TO INPUT IF AL IS NOT CR
    
    END1:
    CMP CH,0                      
    JE EXIT                         ;JUMP IF CH IS EQUAL TO ZERO
    NEG BX                        
                                    ;NEGATING BX
    EXIT:                         
    
    RET                             ;RETURNING TO CALLING PROCEDURE
    
    INDEC ENDP

    


OUTDEC PROC
    
    
    CMP BX,0                        ;JUMP IF RESULT IS EQUAL OR GREATER THAN ZERO
    JGE START
    
    MOV AH,2                        ;SHOWING '-' CHARACTER
    MOV DL,'-'                    
    INT 21H                       

    NEG BX                          ;NEGATING BX
                                    
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


;REFERENCE:
;Assembly Language Programming and Organization of the IBM PC By Ytha Y. Yu, Charles Marut
;http://www.slideshare.net/HassnainJamil/mul-div-instructions-in-assembly-language