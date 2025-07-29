.MODEL SMALL
.STACK 100H
.DATA
MSG DB "Enter three lowercase letters:$"
ERR DB "Please enter lowercase letter$"
EQUAL DB "All letters are equal$"


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    MOV AH,1
    INT 21H
    CMP AL,097
    JL INPUT
    CMP AL,122
    JG INPUT
    MOV BL,AL
    
    
    ;MOV DL,32
    ;INT 21H
           
           
    ;MOV AH,1
    INT 21H
    CMP AL,097
    JL INPUT
    CMP AL,122
    JG INPUT 
    MOV BH,AL
    
    
    ;MOV DL,32
    ;INT 21H 
     
     
    ;MOV AH,1
    INT 21H
    CMP AL,097
    JL INPUT
    CMP AL,122
    JG INPUT
    MOV CL,AL
    
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    CMP BL,BH
    JE CHECK_LOWER_BETWEEN_BL_AND_CL 
    
    CMP BL,CL
    JE CHECK_LOWER_BETWEEN_BH_AND_CL
    
    CMP BH,CL
    JE CHECK_LOWER_BETWEEN_BL_AND_CL
    
      
    CMP BL,BH
    JL CHECK_IF_BL_GREATER_THAN_CL
    CMP BL,CL     
    JG CHECK_GREATER_BETWEEN_BH_AND_CL   
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP EXIT
     

    
    CHECK_IF_BL_GREATER_THAN_CL: 
    
        CMP BL,CL      
        JL CHECK_IF_BH_GREATER_THAN_BL  
        CMP BL,BH      
        JG CHECK_GREATER_BETWEEN_BH_AND_CL 
        MOV AH,2
        MOV DL,BL
        INT 21H
        JMP EXIT
   
    CHECK_IF_BH_GREATER_THAN_BL:
   
        CMP BH,BL
        JL CHECK_IF_BH_GREATER_THAN_CL
        CMP BH,CL      
        JG CHECK_GREATER_BETWEEN_BL_AND_CL     
        MOV AH,2
        MOV DL,BH
        INT 21H
        JMP EXIT

        
    CHECK_IF_BH_GREATER_THAN_CL:
       
       CMP BH,CL
       JL CHECK_IF_CL_GREATER_THAN_BL
       CMP BH,BL     
       JG CHECK_GREATER_BETWEEN_BL_AND_CL 
       MOV AH,2
       MOV DL,BH
       INT 21H
       JMP EXIT
     
     
    CHECK_IF_CL_GREATER_THAN_BL:  
        
        CMP CL,BL
        JL CHECK_IF_CL_GREATER_THAN_BH
        CMP CL,BH     
        JG CHECK_GREATER_BETWEEN_BH_AND_BL  
    
        MOV AH,2
        MOV DL,CL
        INT 21H
        JMP EXIT 
     

    CHECK_IF_CL_GREATER_THAN_BH:
        
        CMP CL,BH     
        JL EXIT 
        CMP CL,BL     
        JG CHECK_GREATER_BETWEEN_BH_AND_BL
        MOV AH,2
        MOV DL,CL
        INT 21H
        JMP EXIT 
        
        
    CHECK_GREATER_BETWEEN_BH_AND_CL:
        
        CMP BH,CL
        JL PRINT_CL
        MOV AH,2
        MOV DL,BH
        INT 21H
        JMP EXIT
        
        
    CHECK_GREATER_BETWEEN_BL_AND_CL:
        
        CMP BL,CL
        JL PRINT_CL
        MOV AH,2
        MOV DL,BL
        INT 21H
        JMP EXIT  
        
        
    CHECK_GREATER_BETWEEN_BH_AND_BL:
        
        CMP BH,BL
        JL PRINT_BL
        MOV AH,2
        MOV DL,BH
        INT 21H
        JMP EXIT 
        
       
    PRINT_CL: 
    
        MOV AH,2
        MOV DL,CL
        INT 21H
        JMP EXIT
        
        
    PRINT_BL:
        MOV AH,2
        MOV DL,BL
        INT 21H
        JMP EXIT 
        
        
    CHECK_LOWER_BETWEEN_BH_AND_CL:    
        
        CMP CL,BH
        JE PRINT_EQUAL
        CMP CL,BH
        JL PRINT_CL
        MOV AH,2
        MOV DL,BH
        INT 21H
        JMP EXIT   
        
            
    CHECK_LOWER_BETWEEN_BL_AND_CL:
        
        CMP CL,BL 
        JE PRINT_EQUAL
        CMP CL,BL
        JL PRINT_CL
        MOV AH,2
        MOV DL,BL
        INT 21H
        JMP EXIT
    
    PRINT_EQUAL:
     
        MOV AH,9
        LEA DX,EQUAL
        INT 21H
    
    
    EXIT:
    
        MOV AH,4CH
        INT 21H 
        
    INPUT:
    
        MOV AH,2
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
        MOV AH,9
        LEA DX,ERR   
        INT 21H
    
MAIN ENDP
END MAIN