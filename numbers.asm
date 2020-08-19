extern printf
extern exit

section	.data
	message db "Starting...", 10
fmt:    db "a=%ld", 10, 0

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
        mov     rsi, rax

        
        mov     rax, 0
        
        call    printf
        
        call    exit    ;needed to flush stdout



_calc:			;Calculating numbers
	mov	r8,16
	mov	r9,0
	mov	r10,0
	
_loop:	
        add	r9,1
	add	r10,1

        mov	rax,r9
	mul	r10
	
	cmp	rax,r8
	jne	_loop

	mov	rax,r9
	ret
