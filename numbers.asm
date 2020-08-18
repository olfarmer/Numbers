section	.data
	message db "Starting...", 10

section .text

global _start
extern printf

_start:
	mov	rax,1
	mov	rdi,1
	mov	rsi, message
	mov	rdx, 12
	syscall

	call	_calc

        mov     rdi, rax
        mov     al, 0
        
        call    printf
        


	mov	rax, 60
	mov	rdi, 0
	syscall

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
