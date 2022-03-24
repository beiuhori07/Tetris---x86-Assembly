;aici avem macrourile cu care controlam coliziunea structurii cu alte structuri deja plasate(nu cu marginile)

get_pos macro ;aici formam indicii pentru cautarea in matricea de acoperire
	xor edx, edx
	mov eax, last_pos_x
	sub eax, 220 ; la 220 incepe x???
	mov ebx, 20
	div ebx
	mov pos_condition_x, eax 
	
	xor edx, edx
	mov eax, last_pos_y
	sub eax, 60
	mov ebx, 20
	div ebx
	mov pos_condition_y, eax
endm

check_matrix_right_6_2 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 4
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_6_2 macro
	push eax
	push ebx
	
	get_pos
	sub_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_6_2 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_y, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	add edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	add edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	add edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_right_5_4 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 2
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 11
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_5_4 macro
	push eax
	push ebx
	
	get_pos
	sub_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_5_4 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_y, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	add edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_right_5_3 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 3
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 8
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_5_3 macro
	push eax
	push ebx
	
	get_pos
	sub_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_5_3 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_y, 2
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 9
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	add edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_right_5_2 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_5_2 macro
	push eax
	push ebx
	
	get_pos
	sub_to_var pos_condition_x, 2
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 11
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_5_2 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_y, 3
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 21
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_right_4_4 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_4_4 macro
	push eax
	push ebx
	
	get_pos
	sub_to_var pos_condition_x, 2
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 9
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_4_4 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_y, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_right_4_3 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_4_3 macro
	push eax
	push ebx
	
	get_pos
	sub_to_var pos_condition_x, 3
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 12
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_4_3 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_y, 2
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 11
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_right_4_2 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 2
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 9
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
endm

check_matrix_left_4_2 macro
	push eax
	push ebx
	
	get_pos
	sub_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10 
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_4_2 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_y, 3
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 19
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_right_3_4 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_3_4 macro
	push eax
	push ebx
	
	get_pos
	sub_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 11
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 9
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
endm

check_matrix_down_3_4 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_y, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 11
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_right_3_3 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 11
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 9
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_3_3 macro
	push eax
	push ebx
	
	get_pos
	sub_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_3_3 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_y, 3
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 9
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_right_3_2 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 9
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_3_2 macro
	push eax
	push ebx
	
	get_pos
	sub_to_var pos_condition_x, 3
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 11
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_3_2 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_y, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	add edi, 9
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 11
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_right_2_2 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 9
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_2_2 macro
	push eax
	push ebx
	
	get_pos
	sub_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 9
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_2_2 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_y, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 9
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_right_1_2 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 11
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_1_2 macro
	push eax
	push ebx
	
	get_pos
	sub_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 11
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_1_2 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_y, 2
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	add edi, 11
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_right_6_1 macro
	push eax
	push ebx
	
	get_pos
	
	add_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_6_1 macro
	push eax
	push ebx
	
	get_pos
	
	sub_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_6_1 macro
	push eax
	push ebx
	
	get_pos
	
	add_to_var pos_condition_y, 4
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_right_5_1 macro
	push eax
	push ebx
	
	get_pos
	
	add_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_5_1 macro
	push eax
	push ebx
	
	get_pos
	
	sub_to_var pos_condition_x, 3
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 8
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_5_1 macro
	push eax
	push ebx
	
	get_pos
	
	add_to_var pos_condition_y, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_left_4_1 macro
	push eax
	push ebx
	
	get_pos
	
	sub_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_right_4_1 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 3
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 12
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
endm

check_matrix_down_4_1 macro
	push eax
	push ebx
	
	get_pos
	
	add_to_var pos_condition_y, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	add edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	add edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
	
endm

check_matrix_right_3_1 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_x, 3
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 11
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_left_3_1 macro
	push eax
	push ebx
	
	get_pos
	
	sub_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 9
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
endm

check_matrix_down_3_1 macro
	push eax
	push ebx
	
	get_pos
	
	add_to_var pos_condition_y, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	add edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	add edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_down_2_1 macro
	push eax
	push ebx
	
	get_pos
	add_to_var pos_condition_y, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 11 ; verifica
	cmp [matrix + edi*4], 1
	jge placed_struct
	
endm

check_matrix_left_2_1 macro
	push eax
	push ebx
	
	get_pos
	
	sub_to_var pos_condition_x, 2
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 11
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_right_2_1 macro
	push eax
	push ebx
	
	get_pos
	
	add_to_var pos_condition_x, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 11
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
endm

check_matrix_right_1_1 macro
	push eax
	push ebx
	
	get_pos
	
	add_to_var pos_condition_x, 2 ; verif pt square 2
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 9
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm

check_matrix_down_1_1 macro
	push eax
	push ebx
	
	get_pos
	
	add_to_var pos_condition_y, 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	add edi, 1
	cmp [matrix + edi*4], 1
	jge placed_struct
	
	sub edi, 9
	cmp [matrix + edi*4], 1
	jge placed_struct
endm

check_matrix_left_1_1 macro
	push eax
	push ebx
	
	get_pos
	
	sub_to_var pos_condition_x, 1  ; verif pt square 1
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	sub edi, 9
	cmp [matrix + edi*4], 1
	jge afisare_litere
endm


check_matrix_right_7_1 macro	
	push eax
	push ebx
	
	get_pos ;; macro
	add_to_var pos_condition_x, 2 ; verificam la 2 patrate distanta dreapta
	
	
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	;shl eax, 2 ; dd
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere

endm

check_matrix_left_7_1 macro	
	push eax
	push ebx
	
	get_pos ;; macro
	sub_to_var pos_condition_x, 1
	
	
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	jge afisare_litere
	
	add edi, 10
	cmp [matrix + edi*4], 1
	jge afisare_litere

endm

check_matrix_down_7_1 macro	
	;; verificam doua blocuri mai jos, la x-1, x si x+1
	push eax
	push ebx
	
	get_pos ;; macro
	add_to_var pos_condition_y, 2
	
	
	mov eax, pos_condition_y
	mov ebx, 10 ; latimea
	mul ebx  ; eax = 10 * posy
	add eax, pos_condition_x ; eax = (10 * posy) + posx
	;shl eax, 2 ; dd
	mov edi, eax
	pop ebx
	pop eax
	cmp [matrix + edi*4], 1
	je placed_struct
	
	add edi, 1
	cmp [matrix + edi*4], 1
	je placed_struct
	
endm

check_matrix_left macro index1, index2
	local struct_6_1, struct_6_2, struct_5_1, struct_5_2, struct_5_3, struct_5_4, struct_4_1, struct_4_2, struct_4_3, struct_4_4, struct_3_1, struct_3_2, struct_3_3, struct_3_4, struct_2_1, struct_2_2, struct_1_1, struct_1_2, et_1, et_not_1,et_7, et_not_7, et_2, et_not_2, et_3, et_not_3, et_4, et_not_4, et_5, et_not_5, et_6, et_not_6
	cmp index1, 7
	jne et_not_7
	
	et_7:
		check_matrix_left_7_1
		
	et_not_7:
	
	cmp index1, 1
	jne et_not_1
	
	et_1:
		cmp index2, 1
		jne struct_1_2
		struct_1_1:
			check_matrix_left_1_1
			jmp et_not_6
		struct_1_2:
			check_matrix_left_1_2
		
	et_not_1:
	cmp index1, 2
	jne et_not_2
	
	et_2:
		cmp index2, 1
		jne struct_2_2
		struct_2_1:
			check_matrix_left_2_1
			jmp et_not_6
		struct_2_2:
			check_matrix_left_2_2
	
	et_not_2:
	cmp index1, 3
	jne et_not_3
	
	et_3:
		cmp index2, 1
		jne struct_3_2
		struct_3_1:
			check_matrix_left_3_1
			jmp et_not_6
		struct_3_2:
			cmp index2, 2
			jne struct_3_3
			check_matrix_left_3_2
			jmp et_not_6
		struct_3_3:
			cmp index2, 3
			jne struct_3_4
			check_matrix_left_3_3
			jmp et_not_6
		struct_3_4:
			check_matrix_left_3_4
			jmp et_not_6
			
	et_not_3:
	cmp index1, 4
	jne et_not_4
	
	et_4:
		cmp index2, 1
		jne struct_4_2
		struct_4_1:
			check_matrix_left_4_1
			jmp et_not_6
		struct_4_2:
			cmp index2, 2
			jne struct_4_3
			check_matrix_left_4_2
			jmp et_not_6
		struct_4_3:
			cmp index2, 3
			jne struct_4_4
			check_matrix_left_4_3
			jmp et_not_6
		struct_4_4:
			check_matrix_left_4_4
			jmp et_not_6
	
	et_not_4:
	cmp index1, 5
	jne et_not_5
	
	et_5:
		cmp index2, 1
		jne struct_5_2
		struct_5_1:
			check_matrix_left_5_1
			jmp et_not_6
		struct_5_2:
			cmp index2, 2
			jne struct_5_3
			check_matrix_left_5_2
			jmp et_not_6
		struct_5_3:
			cmp index2, 3
			jne struct_5_4
			check_matrix_left_5_3
			jmp et_not_6
		struct_5_4:
			check_matrix_left_5_4
			jmp et_not_6
		
	et_not_5:
	cmp index1, 6
	jne et_not_6
	
	et_6:
		cmp index2, 1
		jne struct_6_2
		struct_6_1:
			check_matrix_left_6_1
			jmp et_not_6
		struct_6_2:
			check_matrix_left_6_2
		
	et_not_6:
endm

check_matrix_right macro index1, index2
	local struct_6_1, struct_6_2, struct_5_1, struct_5_2, struct_5_3, struct_5_4, struct_4_1, struct_4_2, struct_4_3, struct_4_4, struct_3_1, struct_3_2, struct_3_3, struct_3_4, struct_2_1, struct_2_2, struct_1_1, struct_1_2, et_7, et_not_7, et_1, et_not_1, et_2, et_not_2, et_3, et_not_3, et_4, et_not_4, et_5, et_not_5, et_6, et_not_6
	cmp index1, 7
	jne et_not_7
	et_7:
		check_matrix_right_7_1
		
	et_not_7:
	cmp index1, 1
	jne et_not_1
	
	et_1:
		cmp index2, 1
		jne struct_1_2
		struct_1_1:
			check_matrix_right_1_1
			jmp et_not_6
		struct_1_2:
			check_matrix_right_1_2
	
	et_not_1:
	cmp index1, 2
	jne et_not_2
	
	et_2:
		cmp index2, 1
		jne struct_2_2
		struct_2_1:
			check_matrix_right_2_1
			jmp et_not_6
		struct_2_2:
			check_matrix_right_2_2
	
	et_not_2:
	cmp index1, 3
	jne et_not_3
	
	et_3:
		cmp index2, 1
		jne struct_3_2
		struct_3_1:
			check_matrix_right_3_1
			jmp et_not_6
		struct_3_2:
			cmp index2, 2
			jne struct_3_3
			check_matrix_right_3_2
			jmp et_not_6
		struct_3_3:
			cmp index2, 3
			jne struct_3_4
			check_matrix_right_3_3
			jmp et_not_6
		struct_3_4:
			check_matrix_right_3_4
			jmp et_not_6
		
	et_not_3:
	cmp index1, 4
	jne et_not_4
	
	et_4:
		cmp index2, 1
		jne struct_4_2
		struct_4_1:
			check_matrix_right_4_1
			jmp et_not_6
		struct_4_2:
			cmp index2, 2
			jne struct_4_3
			check_matrix_right_4_2
			jmp et_not_6
		struct_4_3:
			cmp index2, 3
			jne struct_4_4
			check_matrix_right_4_3
			jmp et_not_6
		struct_4_4:
			check_matrix_right_4_4
			jmp et_not_6
	
	et_not_4:
	cmp index1, 5
	jne et_not_5
	
	et_5:
		cmp index2, 1
		jne struct_5_2
		struct_5_1:
			check_matrix_right_5_1
			jmp et_not_6
		struct_5_2:
			cmp index2, 2
			jne struct_5_3
			check_matrix_right_5_2
			jmp et_not_6
		struct_5_3:
			cmp index2, 3
			jne struct_5_4
			check_matrix_right_5_3
			jmp et_not_6
		struct_5_4:
			check_matrix_right_5_4
			jmp et_not_6
		
	et_not_5:
	cmp index1, 6
	jne et_not_6
	
	et_6:
		cmp index2, 1
		jne struct_6_2
		struct_6_1:
			check_matrix_right_6_1
			jmp et_not_6
		struct_6_2:
			check_matrix_right_6_2
		
	et_not_6:
endm

check_matrix_down macro index1, index2
	local struct_6_1, struct_6_2, struct_5_1, struct_5_2, struct_5_3, struct_5_4, struct_4_1, struct_4_2, struct_4_3, struct_4_4, struct_3_1, struct_3_2, struct_3_3, struct_3_4, struct_2_1, struct_2_2, struct_1_1, struct_1_2, et_1, et_not_1, et_7, et_not_7, et_2, et_not_2, et_3, et_not_3, et_4, et_not_4, et_5, et_not_5, et_6, et_not_6
	cmp index1, 7
	jne et_not_7
	et_7:
		check_matrix_down_7_1
	
	et_not_7:
	
	cmp index1, 1
	jne et_not_1
	
	et_1:
		cmp index2, 1
		jne struct_1_2
		struct_1_1:
			check_matrix_down_1_1
			jmp et_not_6
		struct_1_2:
			check_matrix_down_1_2
	
	et_not_1:
	cmp index1, 2
	jne et_not_2
	
	et_2:
		cmp index2, 1
		jne struct_2_2
		struct_2_1:
			check_matrix_down_2_1
			jmp et_not_6
		struct_2_2:
			check_matrix_down_2_2
		
	et_not_2:
	cmp index1, 3
	jne et_not_3
	
	et_3:
		cmp index2, 1
		jne struct_3_2
		struct_3_1:
			check_matrix_down_3_1
			jmp et_not_6
		struct_3_2:
			cmp index2, 2
			jne struct_3_3
			check_matrix_down_3_2
			jmp et_not_6
		struct_3_3:
			cmp index2, 3
			jne struct_3_4
			check_matrix_down_3_3
			jmp et_not_6
		struct_3_4:
			check_matrix_down_3_4
			jmp et_not_6
		
	et_not_3:
	cmp index1, 4
	jne et_not_4
	
	et_4:
		cmp index2, 1
		jne struct_4_2
		struct_4_1:
			check_matrix_down_4_1
			jmp et_not_6
		struct_4_2:
			cmp index2, 2
			jne struct_4_3
			check_matrix_down_4_2
			jmp et_not_6
		struct_4_3:
			cmp index2, 3
			jne struct_4_4
			check_matrix_down_4_3
			jmp et_not_6
		struct_4_4:
			check_matrix_down_4_4
			jmp et_not_6
	
	et_not_4:
	cmp index1, 5
	jne et_not_5
	
	et_5:
		cmp index2, 1
		jne struct_5_2
		struct_5_1:
			check_matrix_down_5_1
			jmp et_not_6
		struct_5_2:
			cmp index2, 2
			jne struct_5_3
			check_matrix_down_5_2
			jmp et_not_6
		struct_5_3:
			cmp index2, 3
			jne struct_5_4
			check_matrix_down_5_3
			jmp et_not_6
		struct_5_4:
			check_matrix_down_5_4
			jmp et_not_6
		
	et_not_5:
	cmp index1, 6
	jne et_not_6
	
	et_6:
		cmp index2, 1
		jne struct_6_2
		struct_6_1:
			check_matrix_down_6_1
			jmp et_not_6
		struct_6_2:
			check_matrix_down_6_2
	
	et_not_6:
endm