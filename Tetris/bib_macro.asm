;aici avem macrouri pentru desenarea marginilor, cele cu galben si cele cu albastru(la text)
;mai apar si macrouri pentru desenarea patratelor prin loopuri de desenare a liniilor verticale si orizontale
; macrouri pentru adunare si scadere direct in variabile
; macro pentru citire highscore din fisier

make_borders macro
	vertical_line 219, 60, 400 , 0F9D001h  ;marginile 
	vertical_line 218, 60, 400 , 0F9D001h
	vertical_line 217, 60, 400 , 0F9D001h
	
	vertical_line 420, 60, 400 , 0F9D001h
	vertical_line 421, 60, 400 , 0F9D001h
	vertical_line 422, 60, 400 , 0F9D001h
	
	horizontal_line 217, 460 , 206, 0F9D001h	
	horizontal_line 217, 461 , 206, 0F9D001h
	horizontal_line 217, 462 , 206, 0F9D001h
	
	
	horizontal_line 487, 200, 20, 0597E4h
	horizontal_line 487, 201, 20, 0597E4h
	horizontal_line 487, 202, 20, 0597E4h
	
	horizontal_line 543, 200, 20, 0597E4h
	horizontal_line 543, 201, 20, 0597E4h
	horizontal_line 543, 202, 20, 0597E4h
	
	horizontal_line 487, 177, 75, 0597E4h
	horizontal_line 487, 178, 75, 0597E4h
	horizontal_line 487, 179, 75, 0597E4h
	
	vertical_line 487, 177, 25, 0597E4h
	vertical_line 488, 177, 25, 0597E4h
	vertical_line 489, 177, 25, 0597E4h
	
	vertical_line 560, 177, 25, 0597E4h
	vertical_line 561, 177, 25, 0597E4h
	vertical_line 562, 177, 25, 0597E4h
	
	
	vertical_line 509, 197, 26, 0597E4h
	vertical_line 508, 197, 26, 0597E4h
	vertical_line 507, 197, 26, 0597E4h
	
	horizontal_line 510, 220, 30, 0597E4h
	horizontal_line 510, 221, 30, 0597E4h
	horizontal_line 510, 222, 30, 0597E4h
	
	vertical_line 540, 197, 26, 0597E4h
	vertical_line 541, 197, 26, 0597E4h
	vertical_line 542, 197, 26, 0597E4h
	
	;margini highscore
	horizontal_line 510, 320, 30, 0597E4h
	horizontal_line 510, 321, 30, 0597E4h
	horizontal_line 510, 322, 30, 0597E4h
	
	vertical_line 540, 297, 26, 0597E4h
	vertical_line 541, 297, 26, 0597E4h
	vertical_line 542, 297, 26, 0597E4h
	
	vertical_line 509, 297, 26, 0597E4h
	vertical_line 508, 297, 26, 0597E4h
	vertical_line 507, 297, 26, 0597E4h
	
	horizontal_line 477, 300, 30, 0597E4h
	horizontal_line 477, 301, 30, 0597E4h
	horizontal_line 477, 302, 30, 0597E4h
	
	horizontal_line 543, 300, 30, 0597E4h
	horizontal_line 543, 301, 30, 0597E4h
	horizontal_line 543, 302, 30, 0597E4h
	
	horizontal_line 477, 277, 95, 0597E4h
	horizontal_line 477, 278, 95, 0597E4h
	horizontal_line 477, 279, 95, 0597E4h
	
	vertical_line 477, 277, 25, 0597E4h
	vertical_line 478, 277, 25, 0597E4h
	vertical_line 479, 277, 25, 0597E4h
	
	vertical_line 570, 277, 25, 0597E4h
	vertical_line 571, 277, 25, 0597E4h
	vertical_line 572, 277, 25, 0597E4h
	
endm


make_text_macro macro symbol, drawArea, x, y
	push y
	push x
	push drawArea
	push symbol
	call make_text
	add esp, 16
endm

horizontal_line macro x, y, len, color
local loop_line
	mov eax, y
	mov ebx, area_width
	mul ebx
	add eax, x
	shl eax, 2
	add eax, area
	mov ecx, len
loop_line:
	mov dword ptr[eax], color
	add eax, 4
	loop loop_line
endm

vertical_line macro x, y, len, color
local loop_line
	mov eax, y
	mov ebx, area_width
	mul ebx
	add eax, x
	shl eax, 2
	add eax, area
	mov ecx, len
loop_line:
	mov dword ptr[eax], color
	add eax, 4 * area_width
	loop loop_line
endm

make_square macro x, y, color_int, color_ext
local et_for
	
	; exteriorul patratului
	mov edi, x
	mov esi, y
	push edi
	push esi
	vertical_line x, y, size_square , color_ext
	horizontal_line x, y, size_square , color_ext
	add edi, size_square - 1
	mov x, edi
	vertical_line x, y, size_square, color_ext
	add esi, size_square - 1
	mov y, esi
	sub edi, size_square - 1
	mov x, edi
	horizontal_line x, y, size_square , color_ext
	sub esi, size_square -1
	mov y, esi
	
	; interiorul patratului

	inc dword ptr[x]

	inc dword ptr[y]
	 
	mov edi, size_square - 2
	mov esi, 0

 et_for:
	 vertical_line x, y , size_square - 2, color_int
	 inc dword ptr[x]
	 inc esi
	 cmp esi, edi
	 jb et_for
	 ; terminat de colorat interiorul patratului
	
	; refacem datele
	 pop esi
	 pop edi
	 mov x, edi
	 mov y, esi
endm

add_to_var macro x, val
	mov edi, 0
	mov edi, x
	add edi, val
	mov x, edi
endm

sub_to_var macro x, val
	mov edi, 0
	mov edi, x
	sub edi, val
	mov x, edi
endm

citire_highscore macro
	push offset mod_citire
	push offset nume_fisier
	call fopen
	add esp, 8
	
	push eax
	
	push offset highscore
	push offset format_int
	push eax
	call fscanf
	add esp, 12
	
	push highscore
	push offset format_int
	call printf
	add esp, 8
	
	pop eax
	push eax
	call fclose
	add esp, 4
endm
