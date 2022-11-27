; Program template (Template.asm)

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
   True = 1
   FALSE = 0 
   varA DWORD 7
   varB DWORD 6
   result DWORD 0
.code

main PROC
    
    ; example 1     
    ; if varA < varB 
    ; result = true 

    mov eax, varA 
    cmp eax, varB 
    jae L1        ; jump if a >= b (zf=0 , CY = 0)
    mov result, TRUE 
    jmp l2 


    L1: 
        mov result, FALSE
    L2: 


    INVOKE ExitProcess,0
main ENDP
END main