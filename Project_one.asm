;For this project, you will be creating an assembly code program that reads an 8-bit binary string entered 
;by the user and then tells the user what ASCII character is represented by that binary string. 
;It must repeat these conversions until the user asks to quit the program. 
;If the user enters an invalid string, the program must tell the user that it is invalid and start over.
; Mohammad Javid Moradi 
INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    welcomeMessage BYTE "welcome to binary to ascii converter :  ",0 
    sPrompt  BYTE "Enter the binary number in 8-bits to convert into ASCII ? ",0
    binary1 BYTE 01000011b   ; BinaryString = C
   
    binary2 BYTE 01000011b 

    ;userInput variable with size of the input 
    buffer BYTE 10 DUP(0)           ; input buffer
    byteCount DWORD ?  
    


.code
main PROC

    mov edx, OFFSET welcomeMessage
    call WriteString
    call InputTheString

    ;mov edx, OFFSET welcomeMessage
   
    ; conditional jumps for comparing valid byte 
    ; 
    ;mov al, binary1 
    ;cmp al, binary2  ; compares the two input 
    ;je L1            ; it will jump to L1 if its equal 
    ;mov ecx,20
    
    ;L1: 
    ;mov edx, OFFSET welcomeMessage
    ;call WriteString 
    
    ;cmp eax, 0 
    ;jz L1  ; jump if zf =1 



    INVOKE ExitProcess,0
main ENDP

;-----------------------------------------------------
InputTheString PROC
;
; Prompts user for a plaintext string. Saves the string
; and its length.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
   pushad                      ; save 32-bit registers
   mov   edx,OFFSET sPrompt    ; display a prompt
   call  WriteString
   mov   edx,OFFSET buffer     ; point to the buffer
   mov   ecx,SIZEOF buffer
   call  ReadString            ; input the string
   mov   byteCount,eax         ; save the length
   call  Crlf
   popad
   ret
InputTheString ENDP




END main