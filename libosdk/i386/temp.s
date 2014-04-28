Z:	.byte	0x0, 0x0


readsec:
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
notready:
	movb	$0xa, %al
	outb	%al, $0x70
	inb	$0x71, %al
	testb	$0x80, %al
	jne	notready
	xorb	%al, %al
	outb	%al, $0x70
	inb	$0x71, %al
	movb	%al, %cl
	movb	$0xb, %al
	outb	%al, $0x70
	inb	$0x71, %al
	andb	$0x4, %al
	shrb	$0x2, %al
	orb	%al, %al
	jz	bcd
bin:
	movb	%cl, %al
	jmp	end
bcd:
	movb	%cl, %bl
	movb	%bl, %bh
	andb	$0xf0, %bl
	shrb	$0x4, %bl
	andb	$0xf, %bh
	xorb	%ah, %ah
	movb	%bh, %al
	movb	$0xa, %bh
	mulb	%bh
	movb	%al, %bh
	addb	%bl, %bh
	movb	%bh, %al
end:
	xorb	%ah, %ah
	popl	%edx
	popl	%ecx
	popl	%ebx
	ret

delay1sec:
	pushl	%eax
	pushl	%ebx
	call	readsec
	movb	%al, Z
	movl	$Z, %ecx
	call	writestr
	movb	%al, %bh
	cmpb	$0x3b, %bh
	je	zero
loop:
	call	readsec
	subb	$0x1, %al
	cmpb	%al, %bh
	je	done
	jmp	loop
zero:
	call	readsec
	orb	%al, %al
	jz	done
	jmp	zero
done:
	movl	$Z, %ecx
	call	writestr
	popl	%ebx
	popl	%eax
	ret

