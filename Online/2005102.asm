.MODEL SMALL

.STACK 100H

.DATA

    MSG1 DB 13,10,"ENTER THE STRING:$"
 
    K DW ?
    N DW ?
    MSG5 DB 13,10,"VOWEL COUNT:$"
    MSG6 DB 13,10,"CONSONANT COUNT:$" 
    A DB 065
    E DB 069
    I DB  073
    O DB  079
    U DB 085 
    AA DB 097
    EE DB 101
    II DB 105
    OO DB 111
    UU DB 117

.CODE
        
    MAIN PROC 
    
    
    MOV AX,@DATA
    MOV DS,AX 
    
    TAKE_INPUT:

    LEA DX,MSG1          
    MOV AH,9
    INT 21H 
     
    MOV K,0

    MOV CX,0
    MOV BX,0
    MOV AX,0
    
    INPUT_N:            
    
        MOV AX,0
        MOV AH,1
        INT 21H 
        
        MOV CL,AL
        
        CMP CL,A
        JE NEXT
        
        CMP CL,E
        JE NEXT 
        
        CMP CL,I
        JE NEXT
        
         CMP CL,O
        JE NEXT
        
            
        CMP CL,U
        JE NEXT
        
        CMP CL,AA
        JE NEXT
        
            
            
        CMP CL,EE
        JE NEXT
        
         CMP CL,II
        JE NEXT
        
         CMP CL,OO
        JE NEXT
        
        CMP CL,UU
        JE NEXT
        
        
        CMP CL,13
        JE PRINT
         
        ADD N,1
        JMP INPUT_N 
    
    NEXT:
    
       ADD K,1
       JMP INPUT_N 
       
    PRINT:
       
        JMP CONSOLE  
        
    PRINT2:
        JMP CONSOLE2
    
    CONSOLE:
         
        LEA DX,MSG5
        MOV AH,9
        INT 21H
        
        MOV AX,K
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

        LOOP FINAL_OUTPUT    
     
     
       
        
    CONSOLE2: 
    
        LEA DX,MSG6
        MOV AH,9
        INT 21H
        
        MOV AX,N
        MOV BX,0
        MOV BL,10
   
        MOV CX,0
        MOV DX,0
     
    STAC2:
        
        DIV BX
        PUSH DX
        MOV DX,0

        INC CX
        CMP AX,0
        
        JNE STAC2
        
        MOV AH,2
        MOV BX,0


    FINAL_OUTPT:
    
        POP DX
        ADD DX,'0'
        
        INT 21H

        LOOP FINAL_OUTPT  
        
        MOV AH,4CH
        INT 21H
    
    MAIN ENDP

    END MAIN
    