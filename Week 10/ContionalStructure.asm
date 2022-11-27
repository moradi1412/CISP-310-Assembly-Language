; Mohammad Javid Moradi 


.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


.data
; declaration of a string within a byte 0 should be there inorder to be conside a string 
source BYTE "hEllo", 0
varB DWORD 60h ; max  value of uppercases  

.code
main PROC  
     ; loop counter to the length of string 
     mov ecx, LENGTHOF source-1 
     ; point to the begining of string 
     mov esi, OFFSET source 

L1 : 
    cmp esi, varB  ; compares if it is less then decimal 96 would consider upper cases, then it will jump to L2  
    JA L2
    OR BYTE PTR[esi],00100000b
    jmp next

    L2 :  AND BYTE PTR[esi],11011111b 
    
   next: 
   inc esi 
   loop L1

    


   
            invoke ExitProcess,0
main ENDP
END main 