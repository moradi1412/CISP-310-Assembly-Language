main PROC
	mov eax,5                 ; move 5 to the eax register
	add eax,6                 ; add 6 to the eax register

	INVOKE ExitProcess,0      ; end the program
main ENDP