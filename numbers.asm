section	.data
	message db "Starting...", 10

section .text

global _start
_start:
	mov	rax,1
	mov	rdi,1
	mov	rsi, message
	mov	rdx, 12
	syscall

	;call	_calc
	mov	rsi, 1	


	;mov	rsi,rax
	mov	rdi,1
	mov	rax,1
	mov	rdx,1
	syscall

	mov	rax, 60
	mov	rdi, 0
	syscall

_calc:			;Calculating numbers
	mov	r8,16
	mov	r9,1
	mov	r10,1
	
_loop:	mov	rax,r9
	mul	r10
	
	add	r9,1
	add	r10,1

	cmp	rax,r8
	jne	_loop

	mov	rax,r8
	ret
