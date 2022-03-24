;aici avem macrourile de coliziune dintre structuri si margini

check_bottom_border_1_2 macro
	cmp last_pos_y, 398
	jge placed_struct
endm

check_bottom_border_2_2 macro
	cmp last_pos_y, 438
	jge placed_struct
endm

check_bottom_border_3_2 macro
	cmp last_pos_y, 418
	jge placed_struct
endm

check_bottom_border_3_3 macro
	cmp last_pos_y, 398
	jge placed_struct
endm

check_bottom_border_3_4 macro
	cmp last_pos_y, 438
	jge placed_struct
endm

check_bottom_border_4_2 macro
	cmp last_pos_y, 398
	jge placed_struct
endm

check_bottom_border_4_3 macro
	cmp last_pos_y, 418
	jge placed_struct
endm

check_bottom_border_4_4 macro
	cmp last_pos_y, 438
	jge placed_struct
endm

check_bottom_border_5_2 macro
	cmp last_pos_y, 398
	jge placed_struct
endm

check_bottom_border_5_3 macro
	cmp last_pos_y, 418
	jge placed_struct
endm

check_bottom_border_5_4 macro
	cmp last_pos_y, 438
	jge placed_struct
endm

check_bottom_border_6_2 macro
	cmp last_pos_y, 438
	jge placed_struct
endm

check_bottom_border_7_1 macro
	cmp last_pos_y, 418
	jge placed_struct
endm
	
check_bottom_border_1_1 macro
	cmp last_pos_y, 438
	jge placed_struct
endm

check_bottom_border_2_1 macro
	cmp last_pos_y, 438
	jge placed_struct
endm

check_bottom_border_3_1 macro
	cmp last_pos_y, 438
	jge placed_struct
endm

check_bottom_border_4_1 macro
	cmp last_pos_y, 438
	jge placed_struct
endm

check_bottom_border_5_1 macro
	cmp last_pos_y, 438
	jge placed_struct
endm

check_bottom_border_6_1 macro
	cmp last_pos_y, 378
	jge placed_struct
endm

check_left_border_1_2 macro
	cmp last_pos_x, 239
	jbe afisare_litere
endm

check_left_border_2_2 macro
	cmp last_pos_x, 239
	jbe afisare_litere
endm

check_left_border_3_2 macro
	cmp last_pos_x, 279
	jbe afisare_litere
endm

check_left_border_3_3 macro
	cmp last_pos_x, 239
	jbe afisare_litere
endm

check_left_border_3_4 macro
	cmp last_pos_x, 259
	jbe afisare_litere
endm

check_left_border_4_2 macro
	cmp last_pos_x, 239
	jbe afisare_litere
endm

check_left_border_4_3 macro
	cmp last_pos_x, 279
	jbe afisare_litere
endm

check_left_border_4_4 macro
	cmp last_pos_x, 259
	jbe afisare_litere
endm

check_left_border_5_2 macro
	cmp last_pos_x, 259
	jbe afisare_litere
endm

check_left_border_5_3 macro
	cmp last_pos_x, 239
	jbe afisare_litere
endm

check_left_border_5_4 macro
	cmp last_pos_x, 239
	jbe afisare_litere
endm

check_left_border_6_2 macro
	cmp last_pos_x, 239
	jbe afisare_litere
endm

check_left_border_7_1 macro
	cmp last_pos_x, 239 ; verif marginea stanga
	jbe afisare_litere
endm

check_left_border_1_1 macro
	cmp last_pos_x, 239 ; verif marginea stanga
	jbe afisare_litere
endm

check_left_border_2_1 macro
	cmp last_pos_x, 279
	jbe afisare_litere
endm

check_left_border_3_1 macro
	cmp last_pos_x, 239
	jbe afisare_litere
endm

check_left_border_4_1 macro
	cmp last_pos_x, 239
	jbe afisare_litere
endm

check_left_border_5_1 macro
	cmp last_pos_x, 279
	jbe afisare_litere
endm

check_left_border_6_1 macro
	cmp last_pos_x, 239
	jbe afisare_litere
endm

check_right_border_1_2 macro
	cmp last_pos_x, 379
	jge afisare_litere
endm

check_right_border_2_2 macro
	cmp last_pos_x, 379
	jge afisare_litere
endm

check_right_border_3_2 macro
	cmp last_pos_x, 399
	jge afisare_litere
endm

check_right_border_3_3 macro
	cmp last_pos_x, 379
	jge afisare_litere
endm

check_right_border_3_4 macro
	cmp last_pos_x, 399
	jge afisare_litere
endm

check_right_border_4_2 macro
	cmp last_pos_x, 379
	jge afisare_litere
endm

check_right_border_4_3 macro
	cmp last_pos_x, 399
	jge afisare_litere
endm

check_right_border_4_4 macro
	cmp last_pos_x, 399
	jge afisare_litere
endm

check_right_border_5_2 macro
	cmp last_pos_x, 399
	jge afisare_litere
endm

check_right_border_5_3 macro
	cmp last_pos_x, 359
	jge afisare_litere
endm

check_right_border_5_4 macro
	cmp last_pos_x, 379
	jge afisare_litere
endm

check_right_border_6_2 macro
	cmp last_pos_x, 339
	jge afisare_litere
endm

check_right_border_7_1 macro
	cmp last_pos_x, 379 ;verif marginea dreapta 
	jge afisare_litere
endm

check_right_border_1_1 macro
	cmp last_pos_x, 359 ;verif marginea dreapta 
	jge afisare_litere
endm

check_right_border_2_1 macro
	cmp last_pos_x, 399
	jge afisare_litere
endm

check_right_border_3_1 macro
	cmp last_pos_x, 359
	jge afisare_litere
endm

check_right_border_4_1 macro
	cmp last_pos_x, 359
	jge afisare_litere
endm

check_right_border_5_1 macro
	cmp last_pos_x, 399
	jge afisare_litere
endm

check_right_border_6_1 macro
	cmp last_pos_x, 399
	jge afisare_litere
endm

check_left_border macro index1, index2
	local struct_6_1, struct_6_2, struct_5_1, struct_5_2, struct_5_3, struct_5_4, struct_4_1, struct_4_2, struct_4_3, struct_4_4, struct_3_1, struct_3_2, struct_3_3, struct_3_4, struct_2_1, struct_2_2, struct_1_1, struct_1_2, et_1, et_not_1, et_7, et_not_7, et_2, et_not_2, et_3, et_not_3, et_4, et_not_4, et_5, et_not_5, et_6, et_not_6
	cmp index1, 7
	jne et_not_7
	
	et_7:
		check_left_border_7_1
	
	et_not_7:
	cmp index1, 1
	jne et_not_1
	
	et_1:
		cmp index2, 1
		jne struct_1_2
		struct_1_1:
			check_left_border_1_1
			jmp et_not_6
		struct_1_2:
			check_left_border_1_2
	
	et_not_1:
	cmp index1, 2
	jne et_not_2
	
	et_2:
		cmp index2, 1
		jne struct_2_2
		struct_2_1:
			check_left_border_2_1
			jmp et_not_6
		struct_2_2:
			check_left_border_2_2
	
	et_not_2:
	cmp index1, 3
	jne et_not_3
	
	et_3:
		cmp index2, 1
		jne struct_3_2
		struct_3_1:
			check_left_border_3_1
			jmp et_not_6
		struct_3_2:
			cmp index2, 2
			jne struct_3_3
			check_left_border_3_2
			jmp et_not_6
		struct_3_3:
			cmp index2, 3
			jne struct_3_4
			check_left_border_3_3
			jmp et_not_6
		struct_3_4:
			check_left_border_3_4
			jmp et_not_6
			
	
	et_not_3:
	cmp index1, 4
	jne et_not_4
	
	et_4:
		cmp index2, 1
		jne struct_4_2
		struct_4_1:
			check_left_border_4_1
			jmp et_not_6
		struct_4_2:
			cmp index2, 2
			jne struct_4_3
			check_left_border_4_2
			jmp et_not_6
		struct_4_3:
			cmp index2, 3
			jne struct_4_4
			check_left_border_4_3
			jmp et_not_6
		struct_4_4:
			check_left_border_4_4
			jmp et_not_6
	
	et_not_4:
	cmp index1, 5
	jne et_not_5
	
	et_5:
		cmp index2, 1
		jne struct_5_2
		struct_5_1:
			check_left_border_5_1
			jmp et_not_6
		struct_5_2:
			cmp index2, 2
			jne struct_5_3
			check_left_border_5_2
			jmp et_not_6
		struct_5_3:
			cmp index2, 3
			jne struct_5_4
			check_left_border_5_3
			jmp et_not_6
		struct_5_4:
			check_left_border_5_4
			jmp et_not_6
		
	et_not_5:
	cmp index1, 6
	jne et_not_6
	
	et_6:
		cmp index2, 1
		jne struct_6_2
		struct_6_1:
			check_left_border_6_1
			jmp et_not_6
		struct_6_2:
			check_left_border_6_2
		
	et_not_6:
endm

check_right_border macro index1, index2
	local struct_6_1, struct_6_2, struct_5_1, struct_5_2, struct_5_3, struct_5_4, struct_4_1, struct_4_2, struct_4_3, struct_4_4, struct_3_1, struct_3_2, struct_3_3, struct_3_4, struct_2_1, struct_2_2, struct_1_1, struct_1_2, et_1, et_not_1, et_7, et_not_7, et_2, et_not_2, et_3, et_not_3, et_4, et_not_4, et_5, et_not_5, et_6, et_not_6
	cmp index1, 7
	jne et_not_7
	
	et_7:
		check_right_border_7_1
	
	et_not_7:
	cmp index1, 1
	jne et_not_1
	
	et_1:
		cmp index2, 1
		jne struct_1_2
		struct_1_1:
			check_right_border_1_1
			jmp et_not_6
		struct_1_2:
			check_right_border_1_2
	
	et_not_1:
	cmp index1, 2
	jne et_not_2
	
	et_2:
		cmp index2, 1
		jne struct_2_2
		struct_2_1:
			check_right_border_2_1
			jmp et_not_6
		struct_2_2:
			check_right_border_2_2
	
	et_not_2:
	cmp index1, 3
	jne et_not_3
	
	et_3:
		cmp index2, 1
		jne struct_3_2
		struct_3_1:
			check_right_border_3_1
			jmp et_not_6
		struct_3_2:
			cmp index2, 2
			jne struct_3_3
			check_right_border_3_2
			jmp et_not_6
		struct_3_3:
			cmp index2, 3
			jne struct_3_4
			check_right_border_3_3
			jmp et_not_6
		struct_3_4:
			check_right_border_3_4
			jmp et_not_6
		
	et_not_3:
	cmp index1, 4
	jne et_not_4
	
	et_4:
		cmp index2, 1
		jne struct_4_2
		struct_4_1:
			check_right_border_4_1
			jmp et_not_6
		struct_4_2:
			cmp index2, 2
			jne struct_4_3
			check_right_border_4_2
			jmp et_not_6
		struct_4_3:
			cmp index2, 3
			jne struct_4_4
			check_right_border_4_3
			jmp et_not_6
		struct_4_4:
			check_right_border_4_4
			jmp et_not_6
		
	et_not_4:
	cmp index1, 5
	jne et_not_5
	
	et_5:
		cmp index2, 1
		jne struct_5_2
		struct_5_1:
			check_right_border_5_1
			jmp et_not_6
		struct_5_2:
			cmp index2, 2
			jne struct_5_3
			check_right_border_5_2
			jmp et_not_6
		struct_5_3:
			cmp index2, 3
			jne struct_5_4
			check_right_border_5_3
			jmp et_not_6
		struct_5_4:
			check_right_border_5_4
			jmp et_not_6
		
	et_not_5:
	cmp index1, 6
	jne et_not_6
	
	et_6:
		cmp index2, 1
		jne struct_6_2
		struct_6_1:
			check_right_border_6_1
			jmp et_not_6
		struct_6_2:
			check_right_border_6_2
		
	et_not_6:
endm

check_bottom_border macro index1, index2
	local struct_6_1, struct_6_2, struct_5_1, struct_5_2, struct_5_3, struct_5_4, struct_4_1, struct_4_2, struct_4_3, struct_4_4, struct_3_1, struct_3_2, struct_3_3, struct_3_4, struct_2_1, struct_2_2, struct_1_1, struct_1_2, et_1, et_not_1, et_7, et_not_7, et_2, et_not_2, et_3, et_not_3, et_4, et_not_4, et_5, et_not_5, et_6, et_not_6
	cmp index1, 7
	jne et_not_7
	
	et_7:
		check_bottom_border_7_1
	
	et_not_7:
	cmp index1, 1
	jne et_not_1
	
	et_1:
		cmp index2, 1
		jne struct_1_2
		struct_1_1:
			check_bottom_border_1_1
			jmp et_not_6
		struct_1_2:
			check_bottom_border_1_2
	
	et_not_1:
	cmp index1, 2
	jne et_not_2
	
	et_2:
		cmp index2, 1
		jne struct_2_2
		struct_2_1:
			check_bottom_border_2_1
			jmp et_not_6
		struct_2_2:
			check_bottom_border_2_2
	
	et_not_2:
	cmp index1, 3
	jne et_not_3
	
	et_3:
		cmp index2, 1
		jne struct_3_2
		struct_3_1:
			check_bottom_border_3_1
			jmp et_not_6
		struct_3_2:
			cmp index2, 2
			jne struct_3_3
			check_bottom_border_3_2
			jmp et_not_6
		struct_3_3:
			cmp index2, 3
			jne struct_3_4
			check_bottom_border_3_3
			jmp et_not_6
		struct_3_4:
			check_bottom_border_3_4
			jmp et_not_6
		
	et_not_3:
	cmp index1, 4
	jne et_not_4
	
	et_4:
		cmp index2, 1
		jne struct_4_2
		struct_4_1:
			check_bottom_border_4_1
			jmp et_not_6
		struct_4_2:
			cmp index2, 2
			jne struct_4_3
			check_bottom_border_4_2
			jmp et_not_6
		struct_4_3:
			cmp index2, 3
			jne struct_4_4
			check_bottom_border_4_3
			jmp et_not_6
		struct_4_4:
			check_bottom_border_4_4
			jmp et_not_6
	
	et_not_4:
	cmp index1, 5
	jne et_not_5
	
	et_5:
		cmp index2, 1
		jne struct_5_2
		struct_5_1:
			check_bottom_border_5_1
			jmp et_not_6
		struct_5_2:
			cmp index2, 2
			jne struct_5_3
			check_bottom_border_5_2
			jmp et_not_6
		struct_5_3:
			cmp index2, 3
			jne struct_5_4
			check_bottom_border_5_3
			jmp et_not_6
		struct_5_4:
			check_bottom_border_5_4
			jmp et_not_6
		
	et_not_5:
	cmp index1, 6
	jne et_not_6
	
	et_6:
		cmp index2, 1
		jne struct_6_2
		struct_6_1:
			check_bottom_border_6_1
			jmp et_not_6
		struct_6_2:
			check_bottom_border_6_2
		
	et_not_6:
endm