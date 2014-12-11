; ================================================ 
;
; IAS, lab7
; Fri, 5.12.2014
;
; Author: ---- fill-in using format: xlogin00 ----
;
; ================================================

%include 'libs\utils.asm'
%include 'libs\checker.asm'

[section .data] 	; data segment definition

; Number sequence
%ifdef TEST
	A: 			db 	1, -2, 	\
				   	-3, 4
	B:			db 	1, 2, 3, 4, 	\
		   			5, 6, 7, 8
	h:			db 	2		; height of A matrix
	w:			db	4		; width of B matrix
	n:			db	2		; width of A matrix, height of B matrix 
	
	; A * B = 	-9	-10	-11	-12
	;			 17	 18	 19	 20
	
	
	substr:		db "kujem", 0
	str:		db "riekanka: kujem, kujem podkovicku, konikovi na nozicku. kujem, kujem vesele, zo zeleza ocele", 0
	
	results:	dd 4, 106, 32
 
%else
	;          THESE are data valid for normal run
	;           |
	;           v
	A: 			db 	1, 2, 	\
				   	3, 4
	B:			db 	1, 0, 	\
		   			0, 1
	h:			db 	2		; height of A matrix
	w:			db	4		; width of B matrix
	n:			db	2		; width of A matrix, height of B matrix 

	; A * B = 		1	0
	;			3	0


	substr:		db "ko", 0
	str1:		db "kos kokosu", 0
	str2:		db "asko", 0
	str3:		db "lopata", 0
	
	results:	dd 3, 10, 4

%endif

[section .bss] 	; bss (uninitialised data) segment definition
	buffer:     resb    64
	nSubstr:    resb    1
	C: 		   	resb    256

[section .text use32 class=CODE] 	; basis segment definition

_prologue                			; macro -- program initialisation

; --------------------------------------------------------------------------------------------
; Assignment:
; - tasks 1..2 in the source code below
; - (!) do not edit/remove lines with comment ;--- at their end
; 
; --------------------------------------------------------------------------------------------

task_1:							;---
; vytvorte program na najdenie vsetkych podretazcov 'substr'
; v retazci 'str'. Pozicie podretazcov ulozte do buffra 'buffer'
;
; Priklad
;	substr = "ma"
;	str = "mama ma emu"
;
;	nSubstr = 3
; 	buffer = 0, 2, 5
;
; pouzite subrutiny zapiste za navestie t1_routines
;
; (1.5 bodu)

 	; -- your code here ---
	
	mov ESI, str1			; ESI is source string, EDI is string we are matching  
	mov EDI, substr
	
	call findstr 
	
	_iwriteln ECX
	_iwriteln EBX
	_iwriteln EDX
	
	_check 1
	

t1_check:						;---
	movzx EDX, byte [nSubstr]	;---
	_check 1					;---

; spocitajte sumu vsetkych hodnot v buffri 'buffer' a vysledok 
; ulozte do EDX. Pre priklad uvedeny vyssie plati; (suma) EDX = 7
 	
 	; -- your code here ---
 	
 	
 	
 	
	_check 2					;---
	jmp task_2					;---

t1_routines:					;---

	; -- your code here ---
findstr:
	xor EBX, EBX
	xor ECX, ECX
	xor EAX, EAX
	xor EDX, EDX
findstr_next:	
	mov AL, [ESI + ECX]
	cmp AL, 0
	jne not_at_the_end_of_source_yet		
	
	mov AL, [EDI + EBX]			; check if we have the end of the matching string
	cmp AL, 0
	jne at_the_end_of_source_not_end_of_dst
								; we are at the end of both - we have a match
	jmp match
											
at_the_end_of_source_not_end_of_dst: 	
	mov EDX, -1					; end of the source string / no match found
	ret
not_at_the_end_of_source_yet:	
	mov AL, [EDI + EBX]
	cmp AL, 0					; check if we have the end of the matching string
	jne not_at_the_end_of_dst_yet
								; end of dst - we have a match !
	jmp match
								
not_at_the_end_of_dst_yet:
	mov DL, [ESI + ECX]			; ESI is the source string, EDI is the string we are matching
	mov AL, [EDI + EBX]
	
	cmp DL, AL  
	jne not_eq					; we have matched one char, lets move on
	
	inc EBX						
	inc ECX						
	jmp findstr_next			
not_eq:							; we do not have a match, lets rewind dst string
	mov EBX, 0						
	inc ECX						
	jmp findstr_next
	
match:
	mov EDX, ECX				; CX is storing offset to last matched char on the source 
								; EBX is storing the lenght of matching str 
	sub EDX, EBX
	ret		

; --------------------------------------------------------------------------------------------

task_2:
; vytvorte algoritmus pre vypocet nasobenia matic A * B = C. 
; - vyska matice A je v premennej 'h'
; - sirka matice B je v premennej 'w'
; - vyska matice B a sirka A je v premennej 'n' 
;
; Pre nazornu ukazku nasobenia matic je mozne pouzit kalkulator:
; http://matrix.reshish.com/multiplication.php
; 
; Vyslednu maticu C ukladajte do neinicializovanej oblasti s navestim 'C'
;
;
; pouzite subrutiny zapiste za navestie t2_routines
;
; (1.5 bodu)
;



t2_check:						;---
; spocitajte sumu vsetkych hodnot v matici C a vysledok 
; ulozte do EDX. 
;
; Pre riadny beh programu kde sa matica C rovna: 1 0 
; 											     3 0
; 
; je (suma) EDX = 4
; 
 	
 	; -- your code here ---
 	
 	
 	
 	
	_check 3					;---
	jmp epilogue				;---

t2_routines:					;---

	; -- your code here ---





; --------------------------------------------------------------------------------------------
epilogue:

_epilogue                			; macro -- program exit