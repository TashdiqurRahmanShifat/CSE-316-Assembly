                                                              
.MODEL SMALL

.STACK 100H

.DATA

    MSG1 DB "ENTER THE VALUE OF N:$"
    MSG2 DB 13,10,"YOU ENTERED:$"
    MSG3 DB 13,10,"SUMMATION OF THE ALL DIGIT IS:$"  
    F DW ?
    K DW ?

.CODE
        
    MAIN PROC 
    
    
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,MSG1           ;PROMT THE USER TO GIVE AN INPUT
    MOV AH,9
    INT 21H 


    MOV CX,0
    MOV BX,0
    MOV AX,0
    
    INPUT:                 ;TAKING INPUT FROM USER
    
        MOV AX,0
        MOV AH,1
        INT 21H
        MOV CL,AL
        
        CMP CL,13
        JE  NEXT           ;WHEN 'ENTER' IS PRESSED ,GO TO NEXT
        
        SUB CL,'0'
        MOV AX,10
        MUL BX
        MOV BX,AX
        ADD BX,CX
        MOV CX,0
        JMP INPUT 
    
    NEXT:
    
    
        LEA DX,MSG2        
        MOV AH,9
        INT 21H

        MOV AX,BX
        MOV K,0
        MOV K,AX
        MOV DX,0 

        MOV BX,0
        MOV BL,10
        MOV CX,0 


    STACK1:
        
        DIV BX
        PUSH DX
        MOV DX,0

        INC CX
        CMP AX,0
        JNE STACK1
        MOV AH,2
        MOV BX,0
 

    OUTPUT:                     ;DISPLAY WHAT YOU HAVE ENTERED
        
        POP DX
        ADD DX,'0'

        INT 21H
        ADD BX,DX
        SUB BX,'0'

        LOOP OUTPUT
    
    EXIT:

        
        MOV AH,2
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H 
        
        LEA DX,MSG3
        MOV AH,9
        INT 21H
        
        MOV DX,BX
               
               
        MOV AH,0
        MOV AL,0
        ;MOV AX,DX
        MOV BX,0
        MOV BL,10
        MOV CX,0
        MOV DX,0        
        
        MOV AX,K
        
        
        CALL CALCULATE_SUM
        
        MOV F,CX 
        MOV AX,F
        MOV BX,0
        MOV BL,10
   
        MOV CX,0
        MOV DX,0
     
    STACK2:
        
        DIV BX
        PUSH DX
        MOV DX,0

        INC CX
        CMP AX,0
        
        JNE STACK2
        
        MOV AH,2
        MOV BX,0


    FINAL_OUTPUT:
    
        POP DX
        ADD DX,'0'
        
        INT 21H

        LOOP FINAL_OUTPUT    ;DISPLAY SUM HERE
     
     
        MOV AH,4CH
        INT 21H

    MAIN ENDP 
    

    
    
  
    
    CALCULATE_SUM PROC
        
        CMP AX,0
        JE RETURN
        
        DIV BX
        PUSH DX
        MOV DX,0

        MOV CX,0
        
        CALL CALCULATE_SUM    ;RECUSIVE CALL

        MOV BX,0
        MOV BL,10
        MUL BX      
        POP DX
        ADD CX,DX    ;ADDING THE SUM HERE
        ADD AX,DX
        MOV BX,AX
        
        
       

    RETURN:

        RET    
     
    CALCULATE_SUM ENDP

   
    
END MAIN
