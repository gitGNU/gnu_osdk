; i386/isr.asm
; Copyrights (c) 2005 Mohamed Abdelsalam Aslan <maslan@users.berlios.de>
;
; This library is free software; you can redistribute it and/or
; modify it under the terms of the GNU Lesser General Public
; License as published by the Free Software Foundation; either
; version 2.1 of the License, or (at your option) any later version.
;
; This library is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
; Lesser General Public License for more details.
;
; You should have received a copy of the GNU Lesser General Public
; License along with this library; if not, write to the Free Software
; Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

bits 32

set_isr:
	push	ebx
	push	ecx

	mov	ecx, 00h
	mov	ebx, isr00h
	call	set_idesc0

	mov	ecx, 01h
	mov	ebx, isr01h
	call	set_idesc0

	mov	ecx, 02h
	mov	ebx, isr02h
	call	set_idesc0

	mov	ecx, 03h
	mov	ebx, isr03h
	call	set_idesc0

	mov	ecx, 04h
	mov	ebx, isr04h
	call	set_idesc0

	mov	ecx, 05h
	mov	ebx, isr05h
	call	set_idesc0

	mov	ecx, 06h
	mov	ebx, isr06h
	call	set_idesc0

	mov	ecx, 07h
	mov	ebx, isr07h
	call	set_idesc0

	mov	ecx, 08h
	mov	ebx, isr08h
	call	set_idesc0

	mov	ecx, 09h
	mov	ebx, isr09h
	call	set_idesc0

	mov	ecx, 0ah
	mov	ebx, isr0ah
	call	set_idesc0

	mov	ecx, 0bh
	mov	ebx, isr0bh
	call	set_idesc0

	mov	ecx, 0ch
	mov	ebx, isr0ch
	call	set_idesc0

	mov	ecx, 0dh
	mov	ebx, isr0dh
	call	set_idesc0

	mov	ecx, 0eh
	mov	ebx, isr0eh
	call	set_idesc0

	mov	ecx, 0fh
	mov	ebx, isr0fh
	call	set_idesc0

	mov	ecx, 10h
	mov	ebx, isr10h
	call	set_idesc0

	mov	ecx, 11h
	mov	ebx, isr11h
	call	set_idesc0

	mov	ecx, 12h
	mov	ebx, isr12h
	call	set_idesc0

	mov	ecx, 13h
	mov	ebx, isr13h
	call	set_idesc0

	mov	ecx, 14h
	mov	ebx, isr14h
	call	set_idesc0

	mov	ecx, 15h
	mov	ebx, isr15h
	call	set_idesc0

	mov	ecx, 16h
	mov	ebx, isr16h
	call	set_idesc0

	mov	ecx, 17h
	mov	ebx, isr17h
	call	set_idesc0

	mov	ecx, 18h
	mov	ebx, isr18h
	call	set_idesc0

	mov	ecx, 19h
	mov	ebx, isr19h
	call	set_idesc0
	
	mov	ecx, 1ah
	mov	ebx, isr1ah
	call	set_idesc0
	
	mov	ecx, 1bh
	mov	ebx, isr1bh
	call	set_idesc0

	mov	ecx, 1ch
	mov	ebx, isr1ch
	call	set_idesc0

	mov	ecx, 1dh
	mov	ebx, isr1dh
	call	set_idesc0

	mov	ecx, 1eh
	mov	ebx, isr1eh
	call	set_idesc0

	mov	ecx, 1fh
	mov	ebx, isr1fh
	call	set_idesc0

	mov	ecx, 20h
	mov	ebx, isr20h
	call	set_idesc0

	mov	ecx, 21h
	mov	ebx, isr21h
	call	set_idesc0

	mov	ecx, 22h
	mov	ebx, isr22h
	call	set_idesc0
	
	mov	ecx, 23h
	mov	ebx, isr23h
	call	set_idesc0

	mov	ecx, 24h
	mov	ebx, isr24h
	call	set_idesc0

	mov	ecx, 25h
	mov	ebx, isr25h
	call	set_idesc0

	mov	ecx, 26h
	mov	ebx, isr26h
	call	set_idesc0

	mov	ecx, 27h
	mov	ebx, isr27h
	call	set_idesc0

	mov	ecx, 28h
	mov	ebx, isr28h
	call	set_idesc0

	mov	ecx, 29h
	mov	ebx, isr29h
	call	set_idesc0

	mov	ecx, 2ah
	mov	ebx, isr2ah
	call	set_idesc0

	mov	ecx, 2bh
	mov	ebx, isr2bh
	call	set_idesc0

	mov	ecx, 2ch
	mov	ebx, isr2ch
	call	set_idesc0

	mov	ecx, 2dh
	mov	ebx, isr2dh
	call	set_idesc0

	mov	ecx, 2eh
	mov	ebx, isr2eh
	call	set_idesc0

	mov	ecx, 2fh
	mov	ebx, isr2fh
	call	set_idesc0

	mov	ecx, 30h
	mov	ebx, isr30h
	call	set_idesc3

	mov	ecx, 31h
	mov	ebx, isr31h
	call	set_idesc3

	mov	ecx, 32h
	mov	ebx, isr32h
	call	set_idesc3

	mov	ecx, 33h
	mov	ebx, isr33h
	call	set_idesc3

	mov	ecx, 34h
	mov	ebx, isr34h
	call	set_idesc3

	mov	ecx, 35h
	mov	ebx, isr35h
	call	set_idesc3

	mov	ecx, 36h
	mov	ebx, isr36h
	call	set_idesc3

	mov	ecx, 37h
	mov	ebx, isr37h
	call	set_idesc3

	mov	ecx, 38h
	mov	ebx, isr38h
	call	set_idesc3

	mov	ecx, 39h
	mov	ebx, isr39h
	call	set_idesc3

	mov	ecx, 3ah
	mov	ebx, isr3ah
	call	set_idesc3

	mov	ecx, 3bh
	mov	ebx, isr3bh
	call	set_idesc3

	mov	ecx, 3ch
	mov	ebx, isr3ch
	call	set_idesc3

	mov	ecx, 3dh
	mov	ebx, isr3dh
	call	set_idesc3

	mov	ecx, 3eh
	mov	ebx, isr3eh
	call	set_idesc3

	mov	ecx, 3fh
	mov	ebx, isr3fh
	call	set_idesc3

	mov	ecx, 40h
	mov	ebx, isr40h
	call	set_idesc3

	mov	ecx, 41h
	mov	ebx, isr41h
	call	set_idesc3

	mov	ecx, 42h
	mov	ebx, isr42h
	call	set_idesc3

	mov	ecx, 43h
	mov	ebx, isr43h
	call	set_idesc3

	mov	ecx, 44h
	mov	ebx, isr44h
	call	set_idesc3

	mov	ecx, 45h
	mov	ebx, isr45h
	call	set_idesc3

	mov	ecx, 46h
	mov	ebx, isr46h
	call	set_idesc3

	mov	ecx, 47h
	mov	ebx, isr47h
	call	set_idesc3

	mov	ecx, 48h
	mov	ebx, isr48h
	call	set_idesc3

	mov	ecx, 49h
	mov	ebx, isr49h
	call	set_idesc3

	mov	ecx, 4ah
	mov	ebx, isr4ah
	call	set_idesc3

	mov	ecx, 4bh
	mov	ebx, isr4bh
	call	set_idesc3

	mov	ecx, 4ch
	mov	ebx, isr4ch
	call	set_idesc3

	mov	ecx, 4dh
	mov	ebx, isr4dh
	call	set_idesc3

	mov	ecx, 4eh
	mov	ebx, isr4eh
	call	set_idesc3

	mov	ecx, 4fh
	mov	ebx, isr4fh
	call	set_idesc3

	mov	ecx, 50h
	mov	ebx, isr50h
	call	set_idesc3

	mov	ecx, 51h
	mov	ebx, isr51h
	call	set_idesc3

	mov	ecx, 52h
	mov	ebx, isr52h
	call	set_idesc3

	mov	ecx, 53h
	mov	ebx, isr53h
	call	set_idesc3

	mov	ecx, 54h
	mov	ebx, isr54h
	call	set_idesc3

	mov	ecx, 55h
	mov	ebx, isr55h
	call	set_idesc3

	mov	ecx, 56h
	mov	ebx, isr56h
	call	set_idesc3

	mov	ecx, 57h
	mov	ebx, isr57h
	call	set_idesc3

	mov	ecx, 58h
	mov	ebx, isr58h
	call	set_idesc3

	mov	ecx, 59h
	mov	ebx, isr59h
	call	set_idesc3

	mov	ecx, 5ah
	mov	ebx, isr5ah
	call	set_idesc3

	mov	ecx, 5bh
	mov	ebx, isr5bh
	call	set_idesc3

	mov	ecx, 5ch
	mov	ebx, isr5ch
	call	set_idesc3

	mov	ecx, 5dh
	mov	ebx, isr5dh
	call	set_idesc3

	mov	ecx, 5eh
	mov	ebx, isr5eh
	call	set_idesc3

	mov	ecx, 5fh
	mov	ebx, isr5fh
	call	set_idesc3

	mov	ecx, 60h
	mov	ebx, isr60h
	call	set_idesc3

	mov	ecx, 61h
	mov	ebx, isr61h
	call	set_idesc3

	mov	ecx, 62h
	mov	ebx, isr62h
	call	set_idesc3

	mov	ecx, 63h
	mov	ebx, isr63h
	call	set_idesc3

	mov	ecx, 64h
	mov	ebx, isr64h
	call	set_idesc3

	mov	ecx, 65h
	mov	ebx, isr65h
	call	set_idesc3

	mov	ecx, 66h
	mov	ebx, isr66h
	call	set_idesc3

	mov	ecx, 67h
	mov	ebx, isr67h
	call	set_idesc3

	mov	ecx, 68h
	mov	ebx, isr68h
	call	set_idesc3

	mov	ecx, 69h
	mov	ebx, isr69h
	call	set_idesc3

	mov	ecx, 6ah
	mov	ebx, isr6ah
	call	set_idesc3

	mov	ecx, 6bh
	mov	ebx, isr6bh
	call	set_idesc3

	mov	ecx, 6ch
	mov	ebx, isr6ch
	call	set_idesc3

	mov	ecx, 6dh
	mov	ebx, isr6dh
	call	set_idesc3

	mov	ecx, 6eh
	mov	ebx, isr6eh
	call	set_idesc3

	mov	ecx, 6fh
	mov	ebx, isr6fh
	call	set_idesc3

	mov	ecx, 70h
	mov	ebx, isr70h
	call	set_idesc3

	mov	ecx, 71h
	mov	ebx, isr71h
	call	set_idesc3

	mov	ecx, 72h
	mov	ebx, isr72h
	call	set_idesc3

	mov	ecx, 73h
	mov	ebx, isr73h
	call	set_idesc3

	mov	ecx, 74h
	mov	ebx, isr74h
	call	set_idesc3

	mov	ecx, 75h
	mov	ebx, isr75h
	call	set_idesc3

	mov	ecx, 76h
	mov	ebx, isr76h
	call	set_idesc3

	mov	ecx, 77h
	mov	ebx, isr77h
	call	set_idesc3

	mov	ecx, 78h
	mov	ebx, isr78h
	call	set_idesc3

	mov	ecx, 79h
	mov	ebx, isr79h
	call	set_idesc3

	mov	ecx, 7ah
	mov	ebx, isr7ah
	call	set_idesc3

	mov	ecx, 7bh
	mov	ebx, isr7bh
	call	set_idesc3

	mov	ecx, 7ch
	mov	ebx, isr7ch
	call	set_idesc3

	mov	ecx, 7dh
	mov	ebx, isr7dh
	call	set_idesc3

	mov	ecx, 7eh
	mov	ebx, isr7eh
	call	set_idesc3

	mov	ecx, 7fh
	mov	ebx, isr7fh
	call	set_idesc3

	mov	ecx, 80h
	mov	ebx, isr80h
	call	set_idesc3

	mov	ecx, 81h
	mov	ebx, isr81h
	call	set_idesc3

	mov	ecx, 82h
	mov	ebx, isr82h
	call	set_idesc3

	mov	ecx, 83h
	mov	ebx, isr83h
	call	set_idesc3

	mov	ecx, 84h
	mov	ebx, isr84h
	call	set_idesc3

	mov	ecx, 85h
	mov	ebx, isr85h
	call	set_idesc3

	mov	ecx, 86h
	mov	ebx, isr86h
	call	set_idesc3

	mov	ecx, 87h
	mov	ebx, isr87h
	call	set_idesc3

	mov	ecx, 88h
	mov	ebx, isr88h
	call	set_idesc3

	mov	ecx, 89h
	mov	ebx, isr89h
	call	set_idesc3

	mov	ecx, 8ah
	mov	ebx, isr8ah
	call	set_idesc3

	mov	ecx, 8bh
	mov	ebx, isr8bh
	call	set_idesc3

	mov	ecx, 8ch
	mov	ebx, isr8ch
	call	set_idesc3

	mov	ecx, 8dh
	mov	ebx, isr8dh
	call	set_idesc3

	mov	ecx, 8eh
	mov	ebx, isr8eh
	call	set_idesc3

	mov	ecx, 8fh
	mov	ebx, isr8fh
	call	set_idesc3

	mov	ecx, 90h
	mov	ebx, isr90h
	call	set_idesc3

	mov	ecx, 91h
	mov	ebx, isr91h
	call	set_idesc3

	mov	ecx, 92h
	mov	ebx, isr92h
	call	set_idesc3

	mov	ecx, 93h
	mov	ebx, isr93h
	call	set_idesc3

	mov	ecx, 94h
	mov	ebx, isr94h
	call	set_idesc3

	mov	ecx, 95h
	mov	ebx, isr95h
	call	set_idesc3

	mov	ecx, 96h
	mov	ebx, isr96h
	call	set_idesc3

	mov	ecx, 97h
	mov	ebx, isr97h
	call	set_idesc3

	mov	ecx, 98h
	mov	ebx, isr98h
	call	set_idesc3

	mov	ecx, 99h
	mov	ebx, isr99h
	call	set_idesc3

	mov	ecx, 9ah
	mov	ebx, isr9ah
	call	set_idesc3

	mov	ecx, 9bh
	mov	ebx, isr9bh
	call	set_idesc3

	mov	ecx, 9ch
	mov	ebx, isr9ch
	call	set_idesc3

	mov	ecx, 9dh
	mov	ebx, isr9dh
	call	set_idesc3

	mov	ecx, 9eh
	mov	ebx, isr9eh
	call	set_idesc3

	mov	ecx, 9fh
	mov	ebx, isr9fh
	call	set_idesc3

	mov	ecx, 0a0h
	mov	ebx, isra0h
	call	set_idesc3

	mov	ecx, 0a1h
	mov	ebx, isra1h
	call	set_idesc3

	mov	ecx, 0a2h
	mov	ebx, isra2h
	call	set_idesc3

	mov	ecx, 0a3h
	mov	ebx, isra3h
	call	set_idesc3

	mov	ecx, 0a4h
	mov	ebx, isra4h
	call	set_idesc3

	mov	ecx, 0a5h
	mov	ebx, isra5h
	call	set_idesc3

	mov	ecx, 0a6h
	mov	ebx, isra6h
	call	set_idesc3

	mov	ecx, 0a7h
	mov	ebx, isra7h
	call	set_idesc3

	mov	ecx, 0a8h
	mov	ebx, isra8h
	call	set_idesc3

	mov	ecx, 0a9h
	mov	ebx, isra9h
	call	set_idesc3

	mov	ecx, 0aah
	mov	ebx, israah
	call	set_idesc3

	mov	ecx, 0abh
	mov	ebx, israbh
	call	set_idesc3

	mov	ecx, 0ach
	mov	ebx, israch
	call	set_idesc3

	mov	ecx, 0adh
	mov	ebx, isradh
	call	set_idesc3

	mov	ecx, 0aeh
	mov	ebx, israeh
	call	set_idesc3

	mov	ecx, 0afh
	mov	ebx, israfh
	call	set_idesc3

	mov	ecx, 0b0h
	mov	ebx, isrb0h
	call	set_idesc3

	mov	ecx, 0b0h
	mov	ebx, isrb0h
	call	set_idesc3

	mov	ecx, 0b1h
	mov	ebx, isrb1h
	call	set_idesc3

	mov	ecx, 0b2h
	mov	ebx, isrb2h
	call	set_idesc3

	mov	ecx, 0b3h
	mov	ebx, isrb3h
	call	set_idesc3

	mov	ecx, 0b4h
	mov	ebx, isrb4h
	call	set_idesc3

	mov	ecx, 0b5h
	mov	ebx, isrb5h
	call	set_idesc3

	mov	ecx, 0b6h
	mov	ebx, isrb6h
	call	set_idesc3

	mov	ecx, 0b7h
	mov	ebx, isrb7h
	call	set_idesc3

	mov	ecx, 0b8h
	mov	ebx, isrb8h
	call	set_idesc3

	mov	ecx, 0b9h
	mov	ebx, isrb9h
	call	set_idesc3

	mov	ecx, 0bah
	mov	ebx, isrbah
	call	set_idesc3

	mov	ecx, 0bbh
	mov	ebx, isrbbh
	call	set_idesc3

	mov	ecx, 0bch
	mov	ebx, isrbch
	call	set_idesc3

	mov	ecx, 0bdh
	mov	ebx, isrbdh
	call	set_idesc3

	mov	ecx, 0beh
	mov	ebx, isrbeh
	call	set_idesc3
	
	mov	ecx, 0bfh
	mov	ebx, isrbfh
	call	set_idesc3

	mov	ecx, 0c0h
	mov	ebx, isrc0h
	call	set_idesc3

	mov	ecx, 0c1h
	mov	ebx, isrc1h
	call	set_idesc3

	mov	ecx, 0c2h
	mov	ebx, isrc2h
	call	set_idesc3

	mov	ecx, 0c3h
	mov	ebx, isrc3h
	call	set_idesc3

	mov	ecx, 0c4h
	mov	ebx, isrc4h
	call	set_idesc3

	mov	ecx, 0c5h
	mov	ebx, isrc5h
	call	set_idesc3

	mov	ecx, 0c6h
	mov	ebx, isrc6h
	call	set_idesc3

	mov	ecx, 0c7h
	mov	ebx, isrc7h
	call	set_idesc3

	mov	ecx, 0c8h
	mov	ebx, isrc8h
	call	set_idesc3

	mov	ecx, 0c9h
	mov	ebx, isrc9h
	call	set_idesc3

	mov	ecx, 0cah
	mov	ebx, isrcah
	call	set_idesc3

	mov	ecx, 0cbh
	mov	ebx, isrcbh
	call	set_idesc3

	mov	ecx, 0cch
	mov	ebx, isrcch
	call	set_idesc3

	mov	ecx, 0cdh
	mov	ebx, isrcdh
	call	set_idesc3

	mov	ecx, 0ceh
	mov	ebx, isrceh
	call	set_idesc3

	mov	ecx, 0cfh
	mov	ebx, isrcfh
	call	set_idesc3

	mov	ecx, 0d0h
	mov	ebx, isrd0h
	call	set_idesc3

	mov	ecx, 0d1h
	mov	ebx, isrd1h
	call	set_idesc3

	mov	ecx, 0d2h
	mov	ebx, isrd2h
	call	set_idesc3

	mov	ecx, 0d3h
	mov	ebx, isrd3h
	call	set_idesc3

	mov	ecx, 0d4h
	mov	ebx, isrd4h
	call	set_idesc3

	mov	ecx, 0d5h
	mov	ebx, isrd5h
	call	set_idesc3

	mov	ecx, 0d6h
	mov	ebx, isrd6h
	call	set_idesc3

	mov	ecx, 0d7h
	mov	ebx, isrd7h
	call	set_idesc3
	
	mov	ecx, 0d8h
	mov	ebx, isrd8h
	call	set_idesc3

	mov	ecx, 0d9h
	mov	ebx, isrd9h
	call	set_idesc3

	mov	ecx, 0dah
	mov	ebx, isrdah
	call	set_idesc3

	mov	ecx, 0dbh
	mov	ebx, isrdbh
	call	set_idesc3

	mov	ecx, 0dch
	mov	ebx, isrdch
	call	set_idesc3

	mov	ecx, 0ddh
	mov	ebx, isrddh
	call	set_idesc3

	mov	ecx, 0deh
	mov	ebx, isrdeh
	call	set_idesc3

	mov	ecx, 0dfh
	mov	ebx, isrdfh
	call	set_idesc3

	mov	ecx, 0e0h
	mov	ebx, isre0h
	call	set_idesc3

	mov	ecx, 0e1h
	mov	ebx, isre1h
	call	set_idesc3

	mov	ecx, 0e2h
	mov	ebx, isre2h
	call	set_idesc3

	mov	ecx, 0e3h
	mov	ebx, isre3h
	call	set_idesc3

	mov	ecx, 0e4h
	mov	ebx, isre4h
	call	set_idesc3

	mov	ecx, 0e5h
	mov	ebx, isre5h
	call	set_idesc3

	mov	ecx, 0e6h
	mov	ebx, isre6h
	call	set_idesc3

	mov	ecx, 0e7h
	mov	ebx, isre7h
	call	set_idesc3

	mov	ecx, 0e8h
	mov	ebx, isre8h
	call	set_idesc3

	mov	ecx, 0e9h
	mov	ebx, isre9h
	call	set_idesc3

	mov	ecx, 0eah
	mov	ebx, isreah
	call	set_idesc3

	mov	ecx, 0ebh
	mov	ebx, isrebh
	call	set_idesc3

	mov	ecx, 0ech
	mov	ebx, isrech
	call	set_idesc3

	mov	ecx, 0edh
	mov	ebx, isredh
	call	set_idesc3
	
	mov	ecx, 0eeh
	mov	ebx, isreeh
	call	set_idesc3

	mov	ecx, 0efh
	mov	ebx, isrefh
	call	set_idesc3

	mov	ecx, 0f0h
	mov	ebx, isrf0h
	call	set_idesc3

	mov	ecx, 0f1h
	mov	ebx, isrf1h
	call	set_idesc3

	mov	ecx, 0f2h
	mov	ebx, isrf2h
	call	set_idesc3

	mov	ecx, 0f3h
	mov	ebx, isrf3h
	call	set_idesc3

	mov	ecx, 0f4h
	mov	ebx, isrf4h
	call	set_idesc3

	mov	ecx, 0f5h
	mov	ebx, isrf5h
	call	set_idesc3

	mov	ecx, 0f6h
	mov	ebx, isrf6h
	call	set_idesc3

	mov	ecx, 0f7h
	mov	ebx, isrf7h
	call	set_idesc3

	mov	ecx, 0f8h
	mov	ebx, isrf8h
	call	set_idesc3

	mov	ecx, 0f9h
	mov	ebx, isrf9h
	call	set_idesc3

	mov	ecx, 0fah
	mov	ebx, isrfah
	call	set_idesc3

	mov	ecx, 0fbh
	mov	ebx, isrfbh
	call	set_idesc3

	mov	ecx, 0fch
	mov	ebx, isrfch
	call	set_idesc3

	mov	ecx, 0fdh
	mov	ebx, isrfdh
	call	set_idesc3

	mov	ecx, 0feh
	mov	ebx, isrfeh
	call	set_idesc3

	mov	ecx, 0ffh
	mov	ebx, isrffh
	call	set_idesc3

	pop	ecx
	pop	ebx
	ret

;
; Hardware Interrupts and processor exceptions
;

isr00h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 00h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr01h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 01h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr02h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 02h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret
		
isr03h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 03h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr04h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 04h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr05h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 05h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr06h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 06h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr07h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 07h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr08h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 08h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr09h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 090h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret
isr0ah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 0ah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr0bh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 0bh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr0ch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 0ch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr0dh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 0dh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr0eh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 0eh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr0fh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0fh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr10h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 10h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr11h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 11h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr12h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 12h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr13h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 13h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr14h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 14h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr15h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 15h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr16h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 16h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr17h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 17h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr18h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 18h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr19h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 19h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr1ah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 1ah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr1bh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 1bh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr1ch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 1ch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr1dh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 1dh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr1eh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 1eh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr1fh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 1fh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

;
; IRQ Handlers
;

isr20h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 20h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr21h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 21h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr22h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 22h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr23h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 23h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr24h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 24h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr25h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 25h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr26h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 26h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr27h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 27h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr28h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 28h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	0a0h, al
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr29h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 29h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	0a0h, al
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr2ah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 2ah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	0a0h, al
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr2bh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 2bh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	0a0h, al
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr2ch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 2ch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	0a0h, al
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr2dh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 2dh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	0a0h, al
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr2eh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 2eh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	0a0h, al
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr2fh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 2fh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	0a0h, al
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr30h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 30h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr31h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 31h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr32h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 32h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr33h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 33h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr34h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 34h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr35h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 35h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr36h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 36h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr37h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 37h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr38h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 38h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr39h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 39h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr3ah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 3ah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr3bh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 3bh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr3ch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 3ch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr3dh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 3dh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr3eh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 3eh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr3fh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 3fh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr40h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 40h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr41h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 41h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr42h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 42h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr43h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 43h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr44h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 44h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr45h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 45h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr46h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 46h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr47h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 47h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr48h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 48h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr49h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 49h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr4ah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 4ah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr4bh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 4bh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr4ch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 4ch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr4dh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 4dh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr4eh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 4eh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr4fh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 4fh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr50h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 50h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr51h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 51h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr52h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 52h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr53h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 53h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr54h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 54h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr55h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 55h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr56h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 56h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr57h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 57h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr58h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 58h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr59h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 59h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr5ah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 5ah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr5bh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 5bh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr5ch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 5ch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr5dh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 5dh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr5eh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 5eh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr5fh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 5fh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr60h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 60h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr61h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 61h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr62h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 62h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr63h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 63h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr64h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 64h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr65h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 65h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr66h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 66h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr67h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 67h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr68h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 68h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr69h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 69h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr6ah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 6ah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr6bh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 6bh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr6ch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 6ch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr6dh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 6dh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr6eh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 6eh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr6fh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 6fh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr70h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 70h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr71h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 71h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr72h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 72h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr73h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 73h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr74h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 74h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr75h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 75h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr76h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 76h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr77h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 77h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr78h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 78h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr79h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 79h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr7ah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 7ah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr7bh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 7bh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr7ch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 7ch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr7dh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 7dh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr7eh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 7eh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr7fh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 7fh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr80h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 80h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr81h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 81h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr82h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 82h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr83h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 83h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr84h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 84h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr85h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 85h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr86h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 86h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr87h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 87h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr88h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 88h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr89h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 89h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr8ah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 8ah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr8bh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 8bh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr8ch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 8ch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr8dh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 8dh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr8eh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 8eh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr8fh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 8fh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr90h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 90h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr91h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 91h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr92h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 92h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr93h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 93h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr94h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 94h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr95h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 95h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr96h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 96h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr97h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 97h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr98h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 98h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr99h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 99h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr9ah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 9ah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr9bh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 9bh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr9ch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 9ch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr9dh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 9dh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr9eh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 9eh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr9fh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 9fh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isra0h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0a0h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isra1h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0a1h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isra2h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0a2h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isra3h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0a3h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isra4h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0a4h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isra5h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0a5h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isra6h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0a6h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isra7h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0a7h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isra8h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0a8h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isra9h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0a9h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

israah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0aah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

israbh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0abh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

israch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0ach
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isradh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0adh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

israeh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0aeh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

israfh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0afh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrb0h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0b0h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrb1h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0b1h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrb2h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0b2h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrb3h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0b3h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrb4h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0b4h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrb5h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0b5h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrb6h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0b6h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrb7h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0b7h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrb8h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0b8h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrb9h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0b9h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrbah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0bah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrbbh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0bbh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrbch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0bch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrbdh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0bdh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrbeh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0beh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrbfh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0bfh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrc0h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0c0h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrc1h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0c1h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrc2h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0c2h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrc3h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0c3h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrc4h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0c4h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrc5h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0c5h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrc6h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0c6h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrc7h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0c7h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrc8h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0c8h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrc9h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0c9h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrcah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0cah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrcbh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0cbh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrcch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0cch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrcdh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0cdh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrceh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0ceh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrcfh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0cfh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrd0h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0d0h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrd1h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0d1h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrd2h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0d2h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrd3h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0d3h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrd4h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0d4h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrd5h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0d5h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrd6h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0d6h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrd7h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0d7h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrd8h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0d8h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrd9h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0d9h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrdah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0dah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrdbh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0dbh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrdch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0dch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrddh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0ddh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrdeh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0deh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrdfh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0dfh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isre0h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0e0h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isre1h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0e1h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isre2h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0e2h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isre3h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0e3h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isre4h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0e4h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isre5h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0e5h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isre6h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0e6h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isre7h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0e7h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isre8h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0e8h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isre9h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0e9h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isreah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0eah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrebh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0ebh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrech:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0ech
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isredh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0edh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isreeh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0eeh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrefh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0efh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrf0h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0f0h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrf1h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0f1h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrf2h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0f2h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrf3h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0f3h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrf4h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0f4h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrf5h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0f5h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrf6h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0f6h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrf7h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0f7h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrf8h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0f8h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrf9h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0f9h
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrfah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0fah
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrfbh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0fbh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrfch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0fch
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrfdh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0fdh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrfeh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0feh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isrffh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0ffh
	call	interrupt
	mov	eax, [task]
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret


