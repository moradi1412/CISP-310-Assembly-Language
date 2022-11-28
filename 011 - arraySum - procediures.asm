; Program template (Template.asm)

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    ; declare variables here
    array DWORD 10h,20h,30h,40h,50h,60h 
    sum DWORD ? 


.code
main PROC
    ; write your code here
     mov esi, OFFSET array 
     mov ecx, LENGTHOF array
     mov eax, 0
     call ArraySum
     mov sum,eax 

     
    INVOKE ExitProcess,0
main ENDP





;-----------------------------------------------------
; ArraySum
;
; Calculates the sum of an array of 32-bit integers.
; Receives: ESI = the array offset
;           ECX = number of elements in the array
; Returns:  EAX = sum of the array elements
;-----------------------------------------------------
ArraySum PROC
    push  esi                    ; save ESI, ECX
    push  ecx
    mov   eax,0                  ; set the sum to zero

L1: add   eax,[esi]              ; add each integer to sum
    add   esi,TYPE DWORD         ; point to next integer
    loop  L1                     ; repeat for array size

    pop   ecx                    ; restore ECX, ESI
    pop   esi
    ret                          ; sum is in EAX
ArraySum ENDP
END main