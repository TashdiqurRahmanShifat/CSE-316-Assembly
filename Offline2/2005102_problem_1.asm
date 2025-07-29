.MODEL SMALL

.STACK 100H

.DATA

    MSG1 DB 13,10,"ENTER THE VALUE OF N & K SEPARATED BY SPACE:$"
   ; MSG2 DB 13,10,"YOU ENTERED:$"
   ; MSG3 DB 13,10,"ENTER THE VALUE OF K:$"
   ; MSG4 DB 13,10,"YOU ENTERED:$" 
    K DW ?
    N DW ?
    MSG5 DB 13,10,"TOTAL NUMBER OF CHOCOLATE:$"
    MSG6 DB 13,10,"THE VALUE OF K SHOULD BE GREATER THAN 1:$"

.CODE
        
    MAIN PROC 
    
    
    MOV AX,@DATA
    MOV DS,AX 
    
    TAKE_INPUT:

    LEA DX,MSG1          ;PROMT TO TAKE INPUT N & K FROM USER
    MOV AH,9
    INT 21H 


    MOV CX,0
    MOV BX,0
    MOV AX,0
    
    INPUT_N:            ;TAKING INPUT N
    
        MOV AX,0
        MOV AH,1
        INT 21H
        MOV CL,AL
        
        CMP CL,032
        JE  NEXT
        
        SUB CL,'0'
        MOV AX,10
        MUL BX
        MOV BX,AX
        ADD BX,CX
        MOV CX,0
        JMP INPUT_N 
    
    NEXT:
    
    
       ; LEA DX,MSG2
       ; MOV AH,9
       ; INT 21H

        MOV AX,BX
        MOV N,BX
        MOV DX,0 

        MOV BX,0
        MOV BL,10
        MOV CX,0 


    STACK_N:
        
        DIV BX
        PUSH DX
        MOV DX,0

        INC CX
        CMP AX,0
        JNE STACK_N
        MOV AH,2
        MOV BX,0
 

   ; OUTPUT_N:               ;PRINTING THE VALUE OF N
   ;    
   ;   POP DX
   ;   ADD DX,'0'
       
   ;   INT 21H
   ;   ADD BX,DX
   ;   SUB BX,'0'
      

   ;   LOOP OUTPUT_N 
        
        
    
    PROMT_K:
    
        ;LEA DX,MSG3            ;PROMT TO TAKE INPUT K FROM USER
        ;MOV AH,9
        ;INT 21H 

        MOV DX,0
        MOV CX,0
        MOV BX,0
        MOV AX,0
    
    INPUT_K:                   ;TAKING INPUT K
    
        MOV AX,0
        MOV AH,1
        INT 21H
        MOV CL,AL
        
        CMP CL,13
        JE  NEXT1
        
        SUB CL,'0'
        MOV AX,10
        MUL BX
        MOV BX,AX
        ADD BX,CX
        MOV CX,0
        JMP INPUT_K 
    
    NEXT1:
    
    
       ; LEA DX,MSG4
       ; MOV AH,9
       ; INT 21H

        MOV AX,BX 
        MOV K,AX
        MOV DX,0 

        MOV BX,0
        MOV BL,10
        MOV CX,0 


    STACK_K:                   
        
        DIV BX
        PUSH DX
        MOV DX,0

        INC CX
        CMP AX,0
        JNE STACK_K
        MOV AH,2
        MOV BX,0
 

   ; OUTPUT_K:                    ;PRINTING THE VALUE OF K
        
   ;    POP DX
   ;    ADD DX,'0'
      
   ;    INT 21H
   ;    ADD BX,DX
   ;    SUB BX,'0'

   ;    LOOP OUTPUT_K 
    
    
    MOV AX,0    

    MOV BX,K
   
    CMP BX,0001H  
    JE ERROR      
    
    ;MOV CX,N
    ;CMP CX,BX
    ;JE INCREMENT
    
    MOV BX,0    
    MOV CX,0
    MOV DX,0

    MOV AX,N 
    MOV CX,AX  
    
    CHOCOLATE_COUNT:
     
        MOV AX,N
        CMP AX,K
        JL NEXT2
        
        MOV BX,0
        MOV BX,K 
        

        
        DIV BX 
        ADD CX,AX
        MOV N,0 
        ADD AX,DX
        MOV N,AX

        MOV AX,0
        MOV DX,0
        JMP CHOCOLATE_COUNT
    
    
    
        
  
    NEXT2:
    
        LEA DX,MSG5
        MOV AH,9
        INT 21H
    
        MOV DX,0
        MOV DX,CX

        MOV AH,0
        MOV AL,0
        MOV AX,DX
        MOV BX,0
        MOV BL,10
        MOV CX,0
        MOV DX,0   
    
    FINAL_STACK:
        
        DIV BX
        PUSH DX
        MOV DX,0

        INC CX
        CMP AX,0
        JNE FINAL_STACK
        MOV AH,2
        MOV BX,0
    
    

    PRINT_ANS:                 ;PRINTING ANS
    
        POP DX
        ADD DX,'0'
        
        INT 21H

        LOOP PRINT_ANS
    
    EXIT:
        
        MOV AH,4CH
        INT 21H
              
    ERROR:
        
        LEA DX,MSG6
        MOV AH,9
        INT 21H  
        
       
        JMP TAKE_INPUT  
 

       
      
        
    
END MAIN


