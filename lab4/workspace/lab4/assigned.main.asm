; ================================================ 
;
; IAS, lab4
; Fri, 28.11.2014
;
; Author: ---- fill-in using format: xlogin00 ----
;
; ================================================

%include 'libs\utils.asm'
%include 'libs\checker.asm'

[section .data] 	; data segment definition

; Number sequence
%ifdef TEST
	seq: 		db 25, -5, 15, 20, 25, 30, 25, 20, 15, 10, 5, 0, -5, -10, -15
	k:			db 6
	n:   		db 15
	nFib:		db 20
	results:	dd 0, -2093, -28, 45611
%else
	;          THIS sequence is valid for normal run
	;           |
	;           v
	seq: 		db 3, 5, 10, 15, 18, 21, 33, 11, 45
	k:			db 4
	n:   		db 9
	nFib:		db 10
	results:	dd 0, 24, -4, 32674
%endif

sHello:		db 	"Hello world!", 0

[section .text use32 class=CODE] 	; basis segment definition

_prologue                			; macro -- program initialisation

; --------------------------------------------------------------------------------------------
; Assignment:
; - tasks 1..4 in the source code below
; - (!) do not edit/remove lines with comment ;--- at their end
; - use only registers EAX, EBX, ECX, EDX
; - use ESI register only for string printing  
; --------------------------------------------------------------------------------------------

task_1:
; Use macros and functions for console printing prepared for you
; in the library libIAS_ld.asm (look at libs/libIAS_ld.asm). 
; Subroutines are called using call instruction like: 
;
; 	call subroutine_name
;
; Normally you need to prepare some arguments for subroutines
; prior to executing them. Eg.:
;
; 	mov EAX, 1234
;
; (1 point)
;

; - print out the hello world message using WriteString subroutine
	mov ESI, sHello
	call WriteString

; - print out the EOL (end of line) character using WriteNewLine subroutine   
	
	

; - print out the following text: 
;   "The Answer to the Ultimate Question of Life, The Universe, and Everything is ... "
	
	

; - print out the number 42 using WriteInt32 subroutine
; (number can be print also using _iwriteln x macro where x is the source register. 
;  E.g. _iwriteln EAX)
	
	
	
; - print out the EOL   
		

; --------------------------------------------------------------------------------------------

task_2:
; Using call/ret construct a subroutine to calculate product 
; of three signed 32bit integers stored in EAX, ECX, EDX 
; and store result in EDX register. Ignore overflow issues.
; This subroutine should start at label 'mul3'
; 
; Example1: EAX = -1
;			ECX = 10
;			EDX =  5
;           ...
;           result: EDX = -50
;
; At the 't2_check' label perform test of 'mul3' subroutine 
; using first 3 members of the 'seq' sequence lowered by 2
;
; Example1: seq: db 1, 5, -3
; 				   -1, 3, -5  (after lowering by 2) 
;           ...
;           result: EDX = 15
;
; (0.5 point)
;
t2_check:						;--- 
 	; -- your code here ---






	call mul3					;---
	_check 2					;---
	jmp task_3					;--- jump over to 'task_3' to avoid 
								;    running into the mul3 function 
mul3:							;--- 
	; -- your code here ---






	ret							; place return from subroutine here

; --------------------------------------------------------------------------------------------

task_3:
; Construct subroutine prep3 which will prepare 3 successive 
; elements at k-th position from a given sequence of bytes (bd). 
; Elements are lowered by 2 and go to registers EAX, ECX, EDX. Basic
; offset to the start of the sequence is passed in the EBX 
; register. Parameter k is passed in the ECX register. 
; Sequence is always an array of bytes. EBX register content
; must not be altered inside the subroutine. 
; 
; Example:	seq:	db 1,2,30,40,50,6
;			k:		db 2
;			...
;			result: EAX = 28, ECX = 38, EDX = 48 
; 
; At the 't3_check' label perform the test of prep3 function.
; Place argument preparation code just after the label.  
;
; (0.5 point)
;

t3_check:						;---
    ; -- your code here ---
    
    
    
    
	
	call prep3 					;---
	sub EBX, seq				;---
	sub EDX, EAX				;---
	sub EDX, EBX				;---
	sub EDX, ECX				;---
	_check 3					;---
	jmp task_4					;--- jump over to 'task_4' to avoid 
								;    running into the prep3 function 
prep3:							;--- 
    ; -- your code here ---
    ; hint: make use of tha stack to keep EBX unaltered ..

	
	
	
	
	ret							; place return from subroutine here
	
; --------------------------------------------------------------------------------------------
  
task_4:
; Utilising previously created subroutines prep3 and mul3 calculate   
; the sum of multiplicants obtained from mul3 function applied in 
; moving window fashion over given data sequence lowered by 2. 
;
; Example follows:
;
;       	seq:	db 1,2,3,4,5,6
;			n:   	db 6
; 
; 1. pass:	(1-2) * (2-2) * (3-2) = 0
; 2. pass:	(2-2) * (3-2) * (4-2) = 0
; 3. pass:	(3-2) * (4-2) * (5-2) = 6
; 4. pass:	(4-2) * (5-2) * (6-2) = 24
;
; 			SUM = 0 + 0 + 6 + 24  = 30
;								   ----
; 
; For the given sequence seq in run mode:
; 1.pass = 24 
; 2.pass = 312
; 3.pass = 1664
; 4.pass = 3952
; 5.pass = 9424
; 6.pass = 5301
; 7.pass = 11997
;
; SUM = 32674
;
; Hint: you will have to use the stack to store the intermadiate 
; SUM and to store loop counter (e.g. ECX) 
;
; (1 point)

	; -- your code here ---
	
	
	
	
	_check 4					;---
	
; --------------------------------------------------------------------------------------------

_epilogue                		; macro -- program exit




