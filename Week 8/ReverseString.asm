.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


.data
; declaration of a string within a byte 0 should be there inorder to be conside a string 
source BYTE "ABCDEFGHIJ", 0

.code
main PROC
     ; push the string on the stack

     ; variable to contain the length of string  
     mov ecx, LENGTHOF source-1 
     ; variable to point to the begining index of string
     mov esi, OFFSET source 
     ; clear to eax and assign to 0
     mov eax,0
     ; start of the of the loop
L1: 
     mov al, BYTE PTR[esi]
     push eax
     ; increment the index 
     inc esi
     loop L1	

     ; variable to contain the length of string  
     mov ecx, LENGTHOF source-1 
     ; variable to point to the begining index of string
     mov esi, OFFSET source

L2: 
    pop eax
    mov [esi], al
    inc esi 
    Loop l2


         invoke ExitProcess,0
main ENDP
END main