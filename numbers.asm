extern printf
extern exit

section	.data
	message db "Starting...", 10
fmt:    db "a=%ld, b=%ld", 10, 0

section .text

global _start


_start:
	mov	rax,1
	mov	rdi,1
	mov	rsi, message
	mov	rdx, 12
	syscall

	call	_calc

        mov     rdi, fmt
        mov     rsi, r9
        mov     rdx, r10
        
        mov     rax, 0
        
        call    printf
        
        call    exit    ;needed to flush stdout



_calc:			;Calculating numbers
        push    rbx
	mov	r8,1635854315
	mov	r9,0
	mov	r10,0
	
_loop:	
        add	r9,1
        
        cmp     r9,r8   ;loop condition
        je      _endloop
        
        mov     r10,0   ;innerLoop cleanup
        
_innerLoop:
        add	r10,1
        cmp     r10,r8  ;innerLoop condition
        je      _loop
        
	

        mov	rax,r9
	mul	r10
	
	cmp	rax,r8
	jne	_innerLoop

_endloop:
        pop     rbx
        mov	rax,r9
	ret
