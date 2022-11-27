; Name:Mohammad javid moradi

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

.data
;delcaration of two arrays 
array1 BYTE 1,2,3,4
array2 BYTE 8,8,8,8,8,8,8,8

.code
main PROC
    mov eax, 0
    ; "call" for a procedure (method)
    call addThree      ; EAX = 3
    call addThree      ; EAX = 6
    call addThree     ; EAX = 9

    
    mov ebx, OFFSET array1
    mov ecx, LENGTHOF array1
    call arrayPlusOne     ; array1 = 2, 3, 4, 5 ; ECX = 4

    add ebx, 4                      ; if you didn't restore the values of ebx or ecx after the last procedure
    add ecx, 4                      ; then these lines will not work as intended

    call arrayPlusOne      ; array2 = 9,9,9,9,9,9,9,9 ; ECX = 8

    mov ecx, 10
    call proThree      ; EAX = 9, ECX = 10, EDX = 29

    INVOKE ExitProcess, 0
main ENDP


;---------- Create the 3 procedures here ----------

addThree PROC 
    ; adding value 3 to register eax 
    add eax, 3

    ; return value 
    ret
addthree ENDP 

arrayPlusOne PROC 
       push ebx
       push ecx
    ;mov ebx, OFFSET array1
    ;mov ecx, LENGTHOF array1
    mov al,1

L2: 
    ; adding value of al= 1 to array index 0 
    add [ebx],al
    ;increment the array for the next element
    inc ebx 
    Loop l2

    ; retoring the ecx and ebx 
    pop ecx
    pop ebx
   
    ret 
arrayPlusOne ENDP 

proThree PROC 
  push ecx 
 ;mov ecx, 10
 mov edx , 0

L3: 
    call addThree
    loop l3
    sub eax, 10
    mov edx,eax 

    pop ecx
    ret 
proThree ENDP 
;--------------------------------------------------
END main