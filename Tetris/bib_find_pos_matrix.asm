;aici modificam matricea in care retinem 0 daca in pozitia respectiva nu exista un patrat ocupat, sau 1 daca in pozitia respectiva exista un patrat plasat

get_pos_matrix macro x, y, posx, posy
	xor edx, edx
	mov eax, x
	sub eax, 220 ; la 220 incepe x???
	mov ebx, 20
	div ebx
	mov posx, eax
	
	xor edx, edx
	mov eax, y
	sub eax, 60
	mov ebx, 20
	div ebx
	mov posy, eax
endm

find_pos_matrix_1_2 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	add eax, 10
	mov [matrix + eax*4], 1 ; square 2
	add eax, 1
	mov [matrix + eax*4], 1 ; square 3
	add eax, 10
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_2_2 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	sub eax, 10
	mov [matrix + eax*4], 1 ; square 2
	add eax, 1
	mov [matrix + eax*4], 1 ; square 3
	sub eax, 10
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_3_2 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	sub eax, 1
	mov [matrix + eax*4], 1 ; square 2
	sub eax, 1
	mov [matrix + eax*4], 1 ; square 3
	add eax, 11
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_3_3 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	add eax, 10
	mov [matrix + eax*4], 1 ; square 2
	add eax, 1
	mov [matrix + eax*4], 1 ; square 3
	add eax, 9
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_3_4 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	sub eax, 10
	mov [matrix + eax*4], 1 ; square 2
	sub eax, 1
	mov [matrix + eax*4], 1 ; square 3
	sub eax, 9
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_4_2 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	add eax, 1
	mov [matrix + eax*4], 1 ; square 2
	add eax, 9
	mov [matrix + eax*4], 1 ; square 3
	add eax, 10
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_4_3 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	sub eax, 1
	mov [matrix + eax*4], 1 ; square 2
	sub eax, 1
	mov [matrix + eax*4], 1 ; square 3
	add eax, 12
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_4_4 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	sub eax, 1
	mov [matrix + eax*4], 1 ; square 2
	sub eax, 9
	mov [matrix + eax*4], 1 ; square 3
	sub eax, 10
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_5_2 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	sub eax, 1
	mov [matrix + eax*4], 1 ; square 2
	add eax, 11
	mov [matrix + eax*4], 1 ; square 3
	add eax, 10
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_5_3 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	add eax, 1
	mov [matrix + eax*4], 1 ; square 2
	add eax, 1
	mov [matrix + eax*4], 1 ; square 3
	add eax, 8
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_5_4 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	add eax, 1
	mov [matrix + eax*4], 1 ; square 2
	sub eax, 11
	mov [matrix + eax*4], 1 ; square 3
	sub eax, 10
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_6_2 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	add eax, 1
	mov [matrix + eax*4], 1 ; square 2
	add eax, 1
	mov [matrix + eax*4], 1 ; square 3
	add eax, 1
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_7_1 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	add eax, 1
	mov [matrix + eax*4], 1 ; square 2
	add eax, 9
	mov [matrix + eax*4], 1 ; square 3
	add eax, 1
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_1_1 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	add eax, 1
	mov [matrix + eax*4], 1 ; square 2
	sub eax, 10
	mov [matrix + eax*4], 1 ; square 3
	add eax, 1
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_2_1 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	sub eax, 1
	mov [matrix + eax*4], 1 ; square 2
	sub eax, 10
	mov [matrix + eax*4], 1 ; square 3
	sub eax, 1
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_3_1 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	add eax, 1
	mov [matrix + eax*4], 1 ; square 2
	add eax, 1
	mov [matrix + eax*4], 1 ; square 3
	sub eax, 11
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_4_1 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	add eax, 1
	mov [matrix + eax*4], 1 ; square 2
	add eax, 1
	mov [matrix + eax*4], 1 ; square 3
	sub eax, 12
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_5_1 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	sub eax, 1
	mov [matrix + eax*4], 1 ; square 2
	sub eax, 1
	mov [matrix + eax*4], 1 ; square 3
	sub eax, 8
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix_6_1 macro x, y, posx, posy
	push eax
	push ebx
	push edx
	
	get_pos_matrix x, y, posx, posy
	
	mov eax, posy
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, posx ; eax = (10 * posy) + posx
	 ;; shl eax, 2 ; dd
	mov [matrix + eax*4], 1 ; square 1
	add eax, 10
	mov [matrix + eax*4], 1 ; square 2
	add eax, 10
	mov [matrix + eax*4], 1 ; square 3
	add eax, 10
	mov [matrix + eax*4], 1 ; square 4
	
	pop edx
	pop ebx
	pop eax
endm

find_pos_matrix macro index1, index2, x, y, posx, posy
	local struct_6_1, struct_6_2, struct_5_1, struct_5_2, struct_5_3, struct_5_4, struct_4_1, struct_4_2, struct_4_3, struct_4_4, struct_3_1, struct_3_2, struct_3_3, struct_3_4, struct_2_1, struct_2_2, struct_1_1, struct_1_2,et_7, et_not_7, et_1, et_not_1, et_2, et_not_2, et_3, et_not_3, et_4, et_not_4, et_5, et_not_5, et_6, et_not_6
	cmp index1, 7
	jne et_not_7
	
	et_7:
		find_pos_matrix_7_1 x, y, posx, posy
		
	et_not_7:
	
	cmp index1, 1
	jne et_not_1
	
	et_1:
		cmp index2, 1
		jne struct_1_2
		struct_1_1:
			find_pos_matrix_1_1 x, y, posx, posy
			jmp et_not_6
		struct_1_2:
			find_pos_matrix_1_2 x, y, posx, posy
		
	et_not_1:
	
	cmp index1, 2
	jne et_not_2
	
	et_2:
		cmp index2, 1
		jne struct_2_2
		struct_2_1:
			find_pos_matrix_2_1 x, y, posx, posy
			jmp et_not_6
		struct_2_2:
			find_pos_matrix_2_2 x, y, posx, posy
	
	et_not_2:
	cmp index1, 3
	jne et_not_3
	
	et_3:
		cmp index2, 1
		jne struct_3_2
		struct_3_1:
			find_pos_matrix_3_1 x, y, posx, posy
			jmp et_not_6
		struct_3_2:
			cmp index2, 2
			jne struct_3_3
			find_pos_matrix_3_2 x, y, posx, posy
			jmp et_not_6
		struct_3_3:
			cmp index2, 3
			jne struct_3_4
			find_pos_matrix_3_3 x, y, posx, posy
			jmp et_not_6
		struct_3_4:
			find_pos_matrix_3_4 x, y, posx, posy
			jmp et_not_6
		
	et_not_3:
	cmp index1, 4
	jne et_not_4
	
	et_4:
		cmp index2, 1
		jne struct_4_2
		struct_4_1:
			find_pos_matrix_4_1 x, y, posx, posy
			jmp et_not_6
		struct_4_2:
			cmp index2, 2
			jne struct_4_3
			find_pos_matrix_4_2 x, y, posx, posy
			jmp et_not_6
		struct_4_3:
			cmp index2, 3
			jne struct_4_4
			find_pos_matrix_4_3 x, y, posx, posy
			jmp et_not_6
		struct_4_4:
			find_pos_matrix_4_4 x, y, posx, posy
			jmp et_not_6
		
	et_not_4:
	cmp index1, 5
	jne et_not_5
	
	et_5:
		cmp index2, 1
		jne struct_5_2
		struct_5_1:
			find_pos_matrix_5_1 x, y, posx, posy
			jmp et_not_6
		struct_5_2:
			cmp index2, 2
			jne struct_5_3
			find_pos_matrix_5_2 x, y, posx, posy
			jmp et_not_6
		struct_5_3:
			cmp index2, 3
			jne struct_5_4
			find_pos_matrix_5_3 x, y, posx, posy
			jmp et_not_6
		struct_5_4:
			find_pos_matrix_5_4 x, y, posx, posy
			jmp et_not_6
		
	et_not_5:
	cmp index1, 6
	jne et_not_6
	
	et_6:
		cmp index2, 1
		jne struct_6_2
		struct_6_1:
			find_pos_matrix_6_1 x, y, posx, posy
			jmp et_not_6
		struct_6_2:
			find_pos_matrix_6_2 x, y, posx, posy
		
	et_not_6:
endm


