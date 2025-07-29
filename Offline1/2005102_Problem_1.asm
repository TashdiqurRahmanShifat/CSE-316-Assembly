.MODEL SMALL
.STACK 100H
.DATA
  MSG DB "Enter an input:$"
  CAP DB "Uppercase letter$" 
  DIG DB "Number$"  
  SMA DB "Lowercase letter$"
  OTH DB "Not an alphanumeric value$"
.CODE
MAIN PROC  
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG 
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL 
    
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
            
            
    CMP BL,048
    JNGE OTHER 
    CMP BL,057
    JNLE CAPITAL
    

    MOV AH,9   
    LEA DX,DIG
    INT 21H 
    JMP EXIT
        
    CAPITAL:
    
    
    CMP BL,065
    JNGE OTHER
    CMP BL,090
    JNLE SMALL 


    MOV AH,9   
    LEA DX,CAP
    INT 21H 
    JMP EXIT
    
    SMALL:
    
    CMP BL,097
    JNGE OTHER
    CMP BL,122
    JNLE OTHER 
    

    MOV AH,9   
    LEA DX,SMA
    INT 21H 
    JMP EXIT
    
    
    OTHER:
    

    MOV AH,9   
    LEA DX,OTH
    INT 21H 
    JMP EXIT
    
    
    EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP
END MAIN