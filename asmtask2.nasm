section .rodata
	input_string: db "1AF2345FF23B0001", 0
	format_dec: db "%s",10,0

section .data
	y: times 16 db 0
section .bss
	buf: RESB 20
	y2return: RESB 20

section .text
	global main
	extern printf
	;extern my_descriptive_number
	align 16

hex2dec:
	push ebp
	mov ebp,esp
	mov eax,[ebp+8]	
	cmp eax,10
	jg if_hex_num
	back:
		mov esp,ebp
		pop ebp
		ret
	if_hex_num: 
		sub eax,55
		jmp back

my_descriptive_number:
	push ebp
	mov esp,ebp
	mov ebx,[ebp+12] 	;input_string parameter	
	mov ecx,0			;ecx=0	
	loop2:	
		pushad	
		push dword [ebx+ecx]	;push current charcater in the input
		call hex2dec
		mov edx,y 	;index to edx
		add edx,[eax]
		add esp,4
		popad		
		inc dword [edx]			;y[i]++
		inc ecx
		cmp ecx,15
		jle loop2
	mov ecx,0 ; i=0
	loop_y2return:
		mov edx, y2return	;edx = y2return[i]
		add edx,[ecx]
		mov eax,y		;eax = y[i]
		add eax,[ecx]
		mov eax, [eax]		;eax = y[i]+'0'
		add eax,'0'
		mov ebx, [eax]
		mov [edx],ebx		;y2return[i] = y[i]+'0'
		inc ecx					;i++
		cmp ecx,15				;i<=15
		jle loop_y2return 
	mov ecx, 0
	mov ebx,[ebp+8] 	;buf parameter
	my_strcpy:					;strcpy(buf, y2return)
		mov edx, ebx		;edx =buf[i]
		add edx,[ecx]
		mov eax, y2return	;eax = y2return[i]
		add eax,[ecx]
		mov esi, [eax]
		mov [edx], esi		;buf[i] = y2return[i]
		inc ecx					;i++
		cmp ecx,15				;i<=15
		jle my_strcpy 

	mov esp,ebp
	pop ebp
	ret

main:
	pushad
	pushfd
	push buf
	push input_string
	call my_descriptive_number
	add esp,8

	push buf
	push format_dec
	call printf
	add esp,8
	
	popfd
	popad
	ret
