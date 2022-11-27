
;Mohammad Javid Moradi 
;Reverse Array Solution 


COMMENT ! 

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


.data

array DWORD 0000h, 1111h, 2222h, 3333h, 4444h, 5555h

.code
main PROC


;	
    mov edx,0                           
	mov ecx, LENGTHOF array/2          
	mov eax,0                          
	mov ebx, SIZEOF array - TYPE array 
	                                    
	L1:
	mov eax,array[edx]         
    mov edi,array[ebx]         
	mov array[edx],edi          
	mov array[ebx],eax          
	sub ebx,TYPE array          
	add edx, TYPE array       
	loop L1                  
	


	mov	edx, OFFSET array             
	


         invoke ExitProcess,0
main ENDP
END main