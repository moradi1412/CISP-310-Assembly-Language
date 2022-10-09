.data							; this is the data area 
	sum DWORD 0					; create a variable named sum 
	
.code 							; this is the code area 		
	main PROC 
		mov eax, 5				; move 5 to the eax resgister 
		add eax, 6				; add 6 to the eax resgister
		mov sum, eax 
		
		INVOKE ExistProcess,0	; end the program 
	main ENDP
		