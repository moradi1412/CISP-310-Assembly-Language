; AddVariable.asm - chapter 3 example 

.386
.model flat,stdcall 
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	firstval   DWORD 20002000h  	;declare variable 
	secondval  DWORD 11111111h
	thirdval   DWORD 22222222h
	sum        DWORD 0				;declare the sum

.code
	main PROC
		mov eax,firstval
		add eax,secondval
		add eax,thirdval
		mov sum,eax

	INVOKE ExitProcess,0
main ENDP
END main