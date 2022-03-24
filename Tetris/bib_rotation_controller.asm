; in aceasta biblioteca de macrouri apar macrourile legate de controlul rotatiilor pentru fiecare piesa

rotate_1 macro index2
	local et_1, et_2
	cmp index2, 1
	jne et_2
	et_1:
	add_to_var index2, 1
	jmp afisare_litere
	et_2:
	sub_to_var index2, 1
endm

rotate_2 macro index2
	local et_1, et_2
	cmp index2, 1
	jne et_2
	et_1:
	add_to_var index2, 1
	jmp afisare_litere
	et_2:
	sub_to_var index2, 1
endm

rotate_3 macro index2
	local et_1, et_2, et_3, et_4
	cmp index2, 1
	jne et_2
	add_to_var index2, 1
	jmp afisare_litere
	
	et_2:
	cmp index2, 2
	jne et_3
	add_to_var index2, 1
	jmp afisare_litere
	
	et_3:
	cmp index2, 3
	jne et_4
	add_to_var index2, 1
	jmp afisare_litere
	
	et_4:
	sub_to_var index2, 3
endm

rotate_4 macro index2
	local et_1, et_2, et_3, et_4
	cmp index2, 1
	jne et_2
	add_to_var index2, 1
	jmp afisare_litere
	
	et_2:
	cmp index2, 2
	jne et_3
	add_to_var index2, 1
	jmp afisare_litere
	
	et_3:
	cmp index2, 3
	jne et_4
	add_to_var index2, 1
	jmp afisare_litere
	
	et_4:
	sub_to_var index2, 3
endm

rotate_5 macro index2
	local et_1, et_2, et_3, et_4
	cmp index2, 1
	jne et_2
	add_to_var index2, 1
	jmp afisare_litere
	
	et_2:
	cmp index2, 2
	jne et_3
	add_to_var index2, 1
	jmp afisare_litere
	
	et_3:
	cmp index2, 3
	jne et_4
	add_to_var index2, 1
	jmp afisare_litere
	
	et_4:
	sub_to_var index2, 3
endm

rotate_6 macro index2
	local et_1, et_2
	cmp index2, 1
	jne et_2
	et_1:
	add_to_var index2, 1
	jmp afisare_litere
	et_2:
	sub_to_var index2, 1
endm

rotate macro index1, index2
	local  et_1, et_not_1, et_2, et_not_2, et_3, et_not_3, et_4, et_not_4, et_5, et_not_5, et_6, et_not_6
	cmp index1, 1
	jne et_not_1
	
	et_1:
		rotate_1 index2
		
	et_not_1:
	
	 cmp index1, 2
	 jne et_not_2
	
	 et_2:
		rotate_2 index2
	
	 et_not_2:
	 cmp index1, 3
	 jne et_not_3
	
	 et_3:
		rotate_3 index2
		
	 et_not_3:
	 cmp index1, 4
	 jne et_not_4
	
	 et_4:
		rotate_4 index2
	 et_not_4:
	 cmp index1, 5
	 jne et_not_5
	
	 et_5:
		 rotate_5 index2
		
	 et_not_5:
	 cmp index1, 6
	 jne et_not_6
	
	 et_6:
		 rotate_6 index2
			
	 et_not_6:
endm