; Program template (Template.asm)

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    ; declare variables here
    source BYTE "ABCDEFGHIJ", 0 

.code
main PROC
    
    ; push the string on the stack 
    mov ecx, LENGTHOG source-1 
    mov esi, OFFSET source 

    L1: 
        mov al, BYTE PTR[esi]
        push eax 
        inc esi 
        loop L1     

        ; it loops and add all the character to the stack 


    ; pop and reverse the string 

      mov ecx, LENGTHOG source-1 
      mov esi, OFFSET source 

    L2: 
        pop eax 
        mov [esi], al 
        loop L2 

    


    INVOKE ExitProcess,0
main ENDP
END main