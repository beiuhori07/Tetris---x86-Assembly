;aici avem macrouri pentru formarea structurilor in functie de indicii index1 si index2
; si de culorile color_int(in interiorul patratului) si color_ext(din exteriorul patratului)

make_structure_1_1 macro x, y, color_int, color_ext
	 make_square x, y, color_int, color_ext ; square 1
	 add_to_var x, size_square   ; ar trebui  + 1  ????
	 make_square x, y, color_int, color_ext ; square 2
	 sub_to_var y, size_square 
	 make_square x, y, color_int, color_ext ; square 3
	 add_to_var x, size_square
	 make_square x, y, color_int, color_ext ; square 4
	 
	 sub_to_var x, size_square
	 sub_to_var x, size_square
	 add_to_var y, size_square ; revenim la x si y initial
	 
endm

make_structure_1_2 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 2
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 3
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 4
	sub_to_var y, size_square
	sub_to_var y, size_square
	sub_to_var x, size_square
endm
	 
make_structure_2_1 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	sub_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 2
	sub_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 3
	sub_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 4
	add_to_var x, size_square
	add_to_var x, size_square
	add_to_var y, size_square
endm

make_structure_2_2 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	sub_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 2
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 3
	sub_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 4
	add_to_var y, size_square
	add_to_var y, size_square
	sub_to_var x, size_square
endm

make_structure_3_1 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 2
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 3
	sub_to_var x, size_square
	sub_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 4
	
	sub_to_var x, size_square
	add_to_var y, size_square
endm

make_structure_3_2 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	sub_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 2
	sub_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 3
	add_to_var x, size_square
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 4
	add_to_var x, size_square
	sub_to_var y, size_square
endm

make_structure_3_3 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 2
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 3
	sub_to_var y, size_square
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 4
	sub_to_var y, size_square
	sub_to_var x, size_square
	
endm

make_structure_3_4 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	sub_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 2
	sub_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 3
	add_to_var y, size_square
	sub_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 4
	add_to_var y, size_square
	add_to_var x, size_square
endm  

make_structure_4_1 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	sub_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 4
	add_to_var y, size_square
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 2
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 3
	sub_to_var x, size_square
	sub_to_var x, size_square
endm

make_structure_4_2 macro  x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 4
	sub_to_var x, size_square
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 2
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 3
	sub_to_var y, size_square
	sub_to_var y, size_square
	
endm

make_structure_4_3 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 4
	sub_to_var y, size_square
	sub_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 2
	sub_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 3
	add_to_var x, size_square
	add_to_var x, size_square
	
endm

make_structure_4_4 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	sub_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 4
	add_to_var x, size_square
	sub_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 2
	sub_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 3
	add_to_var y, size_square
	add_to_var y, size_square
endm

make_structure_5_1 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	sub_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 4
	add_to_var y, size_square
	sub_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 2
	sub_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 3
	add_to_var x, size_square
	add_to_var x, size_square
	
endm

make_structure_5_2 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	sub_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 4
	add_to_var x, size_square
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 2
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 3
	sub_to_var y, size_square
	sub_to_var y, size_square
	
endm

make_structure_5_3 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 4
	sub_to_var y, size_square
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 2
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 3
	sub_to_var x, size_square
	sub_to_var x, size_square
endm

make_structure_5_4 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 4
	sub_to_var x, size_square
	sub_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 2
	sub_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 3
	add_to_var y, size_square
	add_to_var y, size_square
endm

make_structure_6_1 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 2
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 3
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 4
	sub_to_var y, size_square
	sub_to_var y, size_square
	sub_to_var y, size_square
endm

make_structure_6_2 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 2
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 3
	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 4
	sub_to_var x, size_square
	sub_to_var x, size_square
	sub_to_var x, size_square
endm


make_structure_7_1 macro x, y, color_int, color_ext
	make_square x, y, color_int, color_ext ; square 1
 	add_to_var x, size_square
	make_square x, y, color_int, color_ext ; square 2
	add_to_var y, size_square
	make_square x, y, color_int, color_ext ; square 4
	sub_to_var x, size_square 
	make_square x, y, color_int, color_ext ; square 3
	sub_to_var y, size_square ; sa fie refacute x si y
endm

make_structure macro index1, index2, x, y, color_int, color_ext
	local struct_6_1, struct_6_2, struct_5_1, struct_5_2, struct_5_3, struct_5_4, struct_4_1, struct_4_2, struct_4_3, struct_4_4, struct_3_1, struct_3_2, struct_3_3, struct_3_4, struct_2_1, struct_2_2, struct_1_1, struct_1_2, et_7, et_not_7, et_1, et_not_1, et_2, et_not_2, et_3, et_not_3, et_4, et_not_4,et_5, et_not_5, et_6, et_not_6
	cmp index1, 7 ; fa o cautare binara manual :)))
	jne et_not_7
	
	et_7:
		make_structure_7_1 x, y, color_int, color_ext
	
	et_not_7:
	
	cmp index1, 1
	jne et_not_1
	
	et_1:
		cmp index2, 1
		jne struct_1_2
		struct_1_1:
			make_structure_1_1 x, y, color_int, color_ext
			jmp et_not_6
		struct_1_2:
			make_structure_1_2 x, y, color_int, color_ext
		
	et_not_1:
	
	cmp index1, 2
	jne et_not_2
	
	et_2:
		cmp index2, 1
		jne struct_2_2
		struct_2_1:
			make_structure_2_1 x, y, color_int, color_ext
			jmp et_not_6
		struct_2_2:
			make_structure_2_2 x, y, color_int, color_ext
		
	et_not_2:
	
	cmp index1, 3
	jne et_not_3
	
	et_3:
		cmp index2, 1
		jne struct_3_2
		struct_3_1:
			make_structure_3_1 x, y, color_int, color_ext
			jmp et_not_6
		struct_3_2:
			cmp index2, 2
			jne struct_3_3
			make_structure_3_2 x, y, color_int, color_ext
			jmp et_not_6
		struct_3_3:
			cmp index2, 3
			jne struct_3_4
			make_structure_3_3 x, y, color_int, color_ext
			jmp et_not_6
		struct_3_4:
			make_structure_3_4 x, y, color_int, color_ext
			jmp et_not_6
	
	et_not_3:
	cmp index1, 4
	jne et_not_4
	
	et_4:
		cmp index2, 1
		jne struct_4_2
		struct_4_1:
			make_structure_4_1 x, y, color_int, color_ext
			jmp et_not_6
		struct_4_2:
			cmp index2, 2
			jne struct_4_3
			make_structure_4_2 x, y, color_int, color_ext
			jmp et_not_6
		struct_4_3:
			cmp index2, 3
			jne struct_4_4
			make_structure_4_3 x, y, color_int, color_ext
			jmp et_not_6
		struct_4_4:
			make_structure_4_4 x, y, color_int, color_ext
			jmp et_not_6
		
	et_not_4:
	cmp index1, 5
	jne et_not_5
	
	et_5:
		cmp index2, 1
		jne struct_5_2
		struct_5_1:
			make_structure_5_1 x, y, color_int, color_ext
			jmp et_not_6
		struct_5_2:
			cmp index2, 2
			jne struct_5_3
			make_structure_5_2 x, y, color_int, color_ext
			jmp et_not_6
		struct_5_3:
			cmp index2, 3
			jne struct_5_4
			make_structure_5_3 x, y, color_int, color_ext
			jmp et_not_6
		struct_5_4:
			make_structure_5_4 x, y, color_int, color_ext
			jmp et_not_6
	
	et_not_5:
	cmp index1, 6
	jne et_not_6
	
	et_6:
		cmp index2, 1
		jne struct_6_2
		struct_6_1:
			make_structure_6_1 x, y, color_int, color_ext
			jmp et_not_6
		struct_6_2:
			make_structure_6_2 x, y, color_int, color_ext
		
	et_not_6:
endm