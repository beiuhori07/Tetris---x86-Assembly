.586
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern malloc: proc
extern memset: proc
extern printf: proc
extern fopen: proc
extern fclose: proc
extern fprintf: proc
extern fscanf: proc

;									README
;-------------------------------------------------------------------------------------------------------
;- am incercat ca in fisierul principal sa fie cat de usor posibil sa se inteleaga ideea de functionare
;- pentru asta am scris multe macrouri cu nume sugestive si cu jumpuri incluse

;- coliziunea cu alte piese are loc prin retinerea intr-o matrice a valorilor 0 si 1
;	- daca valoarea e 0, atunci in acea pozitie nu este plasat un patratel(apartinand de o structura)
;	- daca valoarea e 1, atunci in acea pozitie este plasat un patratel(apartinand de o structura)

;- fiecare structura are doi indici - index1 si index2
;	 - in index1 avem forma initiala a structurii
;	 - cu index2 alegem rotatiile piesei initial aparute 
;- am inclus un fisier din paint in care am desenat fiecare piesa si rotatiile ei
;
;- in fiecare biblioteca de macrouri exista enorm de mult cod repetat, pentru ca fiecare structura 
;    e un caz special, si era mai dificil sa automatizez, iar timpul e destul de limitat
;
;- doua buguri de care is constient, dar nu am mai avut timp sa le rezolv
;			1. daca apasam space chiar in momentul in care s-ar plasa o piesa, aceasta apare invizibila, functioneaza ca si cum ar fi acolo, dar e invizibila
;			2. daca rotim piesele mai lungi,langa marginile desenate cu galben, acestea pot trece peste ele si chiar sa dea crash programul
;---------------------------------------------------------------------------------------------------------

include bib_macro.asm
include bib_make_structures.asm
include bib_check_matrix.asm
include bib_check_borders.asm
include bib_find_pos_matrix.asm
include bib_rotation_controller.asm

includelib canvas.lib
extern BeginDrawing: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
window_title DB "Tetris",0
area_width EQU 640
area_height EQU 480
area DD 0

format_int db "%d", 13, 10 ,0

counter DD 0 ; numara evenimentele de tip timer
counter_fall dd 0 ; semnalul pentru cadere a blocurilor
counter_sec dd 0
counter_game_over dd 0

x dd 0
y dd 0
index1 dd 7   ;; index pentru a determina ce fel de structura e activa intr-un moment
index2 dd 1
posx dd 0
posy dd 0
pos_y_line_condition dd 0
pos_condition_x dd 0
pos_condition_y dd 0
init_pos_x dd 300
init_pos_y dd 100
last_pos_x dd 300
last_pos_y dd 60
ok dd 0 ;  ok >= 1 ==> game over
ok_line dd 0
ok_line_condition dd 0
size_square equ 20
highscore dd 0
mod_citire db "r", 0
mod_scriere db "w", 0
nume_fisier db "fisier_highscore.txt", 0

matrix dd 20 dup(10 dup(0)) ; matrice in care retinem 0 daca nu e plasat ceva in acel bloc sau 1 daca e plasat ceva in acel bloc

arg1 EQU 8
arg2 EQU 12
arg3 EQU 16
arg4 EQU 20

symbol_width EQU 10
symbol_height EQU 20
include digits.inc
include letters.inc

.code
; procedura make_text afiseaza o litera sau o cifra la coordonatele date
; arg1 - simbolul de afisat (litera sau cifra)
; arg2 - pointer la vectorul de pixeli
; arg3 - pos_x
; arg4 - pos_y
make_text proc
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp+arg1] ; citim simbolul de afisat
	cmp eax, 'A'
	jl make_digit
	cmp eax, 'Z'
	jg make_digit
	sub eax, 'A'
	lea esi, letters
	jmp draw_text
make_digit:
	cmp eax, '0'
	jl make_space
	cmp eax, '9'
	jg make_space
	sub eax, '0'
	lea esi, digits
	jmp draw_text
make_space:	
	mov eax, 26 ; de la 0 pana la 25 sunt litere, 26 e space
	lea esi, letters
	
draw_text:
	mov ebx, symbol_width
	mul ebx
	mov ebx, symbol_height
	mul ebx
	add esi, eax
	mov ecx, symbol_height
bucla_simbol_linii:
	mov edi, [ebp+arg2] ; pointer la matricea de pixeli
	mov eax, [ebp+arg4] ; pointer la coord y
	add eax, symbol_height
	sub eax, ecx
	mov ebx, area_width
	mul ebx
	add eax, [ebp+arg3] ; pointer la coord x
	shl eax, 2 ; inmultim cu 4, avem un DWORD per pixel
	add edi, eax
	push ecx
	mov ecx, symbol_width
bucla_simbol_coloane:
	cmp byte ptr [esi], 0
	je simbol_pixel_alb
	mov dword ptr [edi], 0
	jmp simbol_pixel_next
simbol_pixel_alb:
	mov dword ptr [edi], 0FFFFFFh
simbol_pixel_next:
	inc esi
	add edi, 4
	loop bucla_simbol_coloane
	pop ecx
	loop bucla_simbol_linii
	popa
	mov esp, ebp
	pop ebp
	ret
make_text endp

; functia de desenare - se apeleaza la fiecare click
; sau la fiecare interval de 200ms in care nu s-a dat click
; arg1 - evt (0 - initializare, 1 - click, 2 - s-a scurs intervalul fara click, 3 - s-a apasat o tasta)
; arg2 - x (in cazul apasarii unei taste, x contine codul ascii al tastei care a fost apasata)
; arg3 - y
draw proc
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp+arg1]
	cmp eax, 1
	jz evt_click
	cmp eax, 2
	jz evt_timer ; nu s-a efectuat click pe nimic
	;mai jos e codul care intializeaza fereastra cu pixeli albi
	cmp eax, 3
	jz evt_key
	mov eax, area_width
	mov ebx, area_height
	mul ebx
	shl eax, 2
	push eax
	push 0
	push area
	call memset
	add esp, 12
	
	citire_highscore
	
	make_borders
	
	jmp afisare_litere



evt_key:  ;miscare stanga dreapta cu a si d, iar rotirea pieselor cu space
	mov esi, [ebp + arg2]
	cmp esi, 68
	jne not_d
	
	et_d:
	check_right_border index1, index2 ; se verifica coliziunea cu marginea din dreapta
	
	check_matrix_right index1, index2 ; se verifica coliziunea cu alta structura care ar impiedica miscarea la dreapta. Daca este impiedicata, se sare peste instr urmatoare si se merge la afisare_litere 
	
	;miscare in dreapta -> se reface structura din nou dar cu culoarea fundalului, ca sa para ca s-a sters, iar apoi se face din nou structura la pozitia necesara
	make_structure index1, index2, last_pos_x, last_pos_y , 0, 0
	add_to_var last_pos_x, 20
	make_structure index1, index2, last_pos_x, last_pos_y, 0597E4h, 0FFFFFFh
	
	jmp afisare_litere
	
	not_d:
	cmp esi, 65
	jne not_a
	et_a:
	check_left_border index1, index2 ; aceeasi idee ca la miscare spre dreapta, doar ca acum spre stanga
	
	check_matrix_left index1, index2 ;coliziune cu alta structura
	
	make_structure index1, index2, last_pos_x, last_pos_y , 0, 0
	sub_to_var last_pos_x, 20
	make_structure index1, index2, last_pos_x, last_pos_y, 0597E4h, 0FFFFFFh
	
	jmp afisare_litere
	not_a:
	
	cmp esi, 32
	jne not_space
	et_space:
	
	; cu space rotim piesa 
	make_structure index1, index2, last_pos_x, last_pos_y , 0, 0 ;stergerea struct
	rotate index1, index2 ; aici modificam index2 pentru a forma structura corespunzatoare rotirii
	make_structure index1, index2, last_pos_x , last_pos_y, 0597E4h, 0FFFFFFh ; refacem structura cu noul index2
	jmp afisare_litere
	
	not_space:
	jmp afisare_litere
	
	
evt_click:
	
	jmp afisare_litere
	
evt_timer:
	inc counter
	
	cmp counter, 5
	jne not_1_second_yet
	
	cmp ok, 1 ;in ok retinem conditia daca jocul s-a terminat sau nu
	jge et_game_over_check
	
	inc counter_sec  ;la 5 evt_timer incrementam (o secunda), deci in counter_sec retinem numarul de secunde
	mov counter, 0
	
	not_1_second_yet:
	
	et_game_over_check:
	cmp ok, 1
	jb et_counter_fall
	inc counter_game_over
	cmp counter_game_over, 25 ; daca jocul s-a terminat, asteptam 5 secunde, iar apoi aplicatia se inchide singura
	jge game_over
	
	et_counter_fall:
	inc counter_fall
	cmp counter_fall, 1  ;aici alegem viteza de cadere a pieselor, cu cat valoarea de comparare e mai mare, cu atat are loc caderea pieselor mai incet
	jne afisare_litere
	sub_to_var counter_fall, counter_fall ; refacem: counter_fall = 0
	
	check_bottom_border index1, index2 ; se verifica coliziunea cu marginea de jos
	
	cmp posy, 0
	je et_fall
	
	check_matrix_down index1, index2  ; macro cu jump inclus
	 
	et_fall:
	check_bottom_border index1, index2
	
	check_matrix_down index1, index2 ; fara macroul asta e bug ==> fall fortat(de la miscare stanga dreapta impiedicata) care poate trece prin alte structuri sau margini
	make_structure index1, index2, last_pos_x, last_pos_y , 0, 0 ;stergerea struct (il facem din nou dar cu culoarea fundalului)
	
	add_to_var last_pos_y, 20
	
	make_structure index1, index2, last_pos_x , last_pos_y, 0597E4h, 0FFFFFFh ; refacem structura la pozitia dorita(mai jos)
	
	jmp afisare_litere
	
placed_struct:
	find_pos_matrix index1, index2, last_pos_x, last_pos_y , posx, posy ;odata plasata structura, se adauga in matrice valoarea 1 in pozitiile ocupate de patratelele structurii 
	
	cmp last_pos_y, 120 ;daca piesa plasata atinge inaltimea respectiva, se termina jocul 
	jge game_still_on
	add_to_var ok, 1
	
	;verific nou highscore din fisier
	mov edx, counter_sec ; aici avem scorul actual
	cmp edx, highscore
	jb not_new_highscore
	
	new_highscore:	;daca avem nou highscore, actualizam fisierul
	
	push offset mod_scriere
	push offset nume_fisier
	call fopen
	add esp, 8
	
	push eax
	
	push counter_sec
	push offset format_int
	push eax
	call fprintf
	add esp, 12
	
	pop eax
	push eax
	call fclose
	add esp, 4
	
	not_new_highscore:
	
	make_text_macro 'G', area, 480, 380
	make_text_macro 'A', area, 490, 380
	make_text_macro 'M', area, 500, 380
	make_text_macro 'E', area, 510, 380
	make_text_macro ' ', area, 520, 380
	make_text_macro 'O', area, 530, 380
	make_text_macro 'V', area, 540, 380
	make_text_macro 'E', area, 550, 380
	make_text_macro 'R', area, 560, 380
	
	
	game_still_on:
	push edx  ; calculam indicii structurii, random
	push eax
	
	xor edx, edx
	xor eax, eax
	
	rdtsc
	xor edx, edx
	mov ecx, 7
	div ecx
	add edx, 1
	
	mov index1, edx
	mov index2, 1
	
	
	pop eax
	pop edx
	
	cmp ok, 1 ; daca jocul s-a incheiat, sa nu se mai faca alte structuri noi, pana cand se inchide aplicatia singura
	jge et_dont_create_new_struct
	make_structure index1, index2, init_pos_x, init_pos_y, 0597E4h, 0FFFFFFh
	
	push eax
	mov eax, init_pos_x
	mov last_pos_x, eax
	mov eax, init_pos_y
	mov last_pos_y, eax
	pop eax
	
	et_dont_create_new_struct:

	
afisare_litere:
	;;;;;;;;;;;;;;;;afisam valoarea counter-ului curent (sute, zeci si unitati)
	mov ebx, 10
	mov eax, counter_sec
	;cifra unitatilor
	mov edx, 0
	div ebx
	add edx, '0'
	make_text_macro edx, area, 530, 200
	;cifra zecilor
	mov edx, 0
	div ebx
	add edx, '0'
	make_text_macro edx, area, 520, 200
	;cifra sutelor
	mov edx, 0
	div ebx
	add edx, '0'
	make_text_macro edx, area, 510, 200
	
	;scriem un mesaj
	make_text_macro 'S', area, 490, 180
	make_text_macro 'E', area, 500, 180
	make_text_macro 'C', area, 510, 180
	make_text_macro 'U', area, 520, 180
	make_text_macro 'N', area, 530, 180
	make_text_macro 'D', area, 540, 180
	make_text_macro 'E', area, 550, 180
	
	mov ebx, 10
	mov eax, highscore
	mov edx, 0
	div ebx
	add edx, '0'
	make_text_macro edx, area, 530, 300
	;cifra zecilor
	mov edx, 0
	div ebx
	add edx, '0'
	make_text_macro edx, area, 520, 300
	;cifra sutelor
	mov edx, 0
	div ebx
	add edx, '0'
	make_text_macro edx, area, 510, 300
	
	make_text_macro 'H', area, 480, 280
	make_text_macro 'I', area, 490, 280
	make_text_macro 'G', area, 500, 280
	make_text_macro 'H', area, 510, 280
	make_text_macro 'S', area, 520, 280
	make_text_macro 'C', area, 530, 280
	make_text_macro 'O', area, 540, 280
	make_text_macro 'R', area, 550, 280
	make_text_macro 'E', area, 560, 280
	

final_draw:
	popa
	mov esp, ebp
	pop ebp
	ret
draw endp

start:
	;alocam memorie pentru zona de desenat
	mov eax, area_width
	mov ebx, area_height
	mul ebx
	shl eax, 2
	push eax
	call malloc
	add esp, 4
	mov area, eax
	;apelam functia de desenare a ferestrei
	; typedef void (*DrawFunc)(int evt, int x, int y);
	; void __cdecl BeginDrawing(const char *title, int width, int height, unsigned int *area, DrawFunc draw);
	push offset draw
	push area
	push area_height
	push area_width
	push offset window_title
	call BeginDrawing
	add esp, 20
	
	game_over:
	;terminarea programului
	push 0
	call exit
end start
