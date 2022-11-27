INCLUDE Irvine32.inc

Find_replace proto,
target: ptr byte,
delimiter : byte

; .386
;.model flat, stdcall
;.stack 4096
; ExitProcess proto, dwExitCode:dword

.data

array1 BYTE "She sells seashells down by the seashore.", 0
oldletter byte 's'
newletter byte 't' 

.code
main PROC

mov ecx, LENGTHOF array1
l5:
INVOKE Find_replace, ADDR array1, oldletter
loop l5




; invoke ExitProcess, 0
exit
main ENDP

Find_replace proc uses esi,
target: ptr byte,
delimiter: byte
mov esi, target
L1 :
mov al, [esi]
cmp al, 0
je L2
mov bl, delimiter
cmp al, bl
jne L3
mov byte ptr[esi], 't' ; newletter 
inc esi
mov eax, esi
mov ebx, 1
jmp L2
L3:
inc esi
jmp L1
L2 :
ret
Find_replace endp

END main