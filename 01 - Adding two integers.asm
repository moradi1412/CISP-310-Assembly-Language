
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    ; declare variables here


.code
main PROC
	mov eax,5                 ; move 5 to the eax register / eax = decimal 5 
	add eax,6                 ; add 6 to the eax register =

	INVOKE ExitProcess,0      ; end the program
main ENDP
END main