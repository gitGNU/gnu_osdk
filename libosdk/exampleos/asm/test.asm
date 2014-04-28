global	main
global	interrupt
	
main:
	int	81h
	mov	esi, 0b8000h
	mov	[esi], byte 'H'
	mov	[esi+1], byte 07h
	mov	[esi+2], byte 'i'
	mov	[esi+3], byte 07h
	ret

interrupt:
	ret

	