/*
 exampleos/c/string.c
 Copyrights (c) 2005 Mohamed Abdelsalam Aslan <maslan@users.berlios.de>
 This library is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public
 License along with this library; if not, write to the Free Software
 Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

#include <string.h>
#include <console.h>

void itoa(int num, unsigned int base, char *buffer)
{
	unsigned int r=0;
	int i=0;
	char tmp[32];
	if(num<0)
		*buffer++='-';
	num=abs(num);
	if(num < base){
		*buffer++=hexdigit(num);
		*buffer='\0';
		return;
	}
	if(num >= base)
		while(num)
		{
			r=num % base;
			num /= base;
			tmp[i++]=hexdigit(r);	
		}
	i--;
	for( ; i>=0 ; i--)
		*buffer++=tmp[i];
	*buffer='\0';
}

void uitoa(unsigned int num, unsigned int base, char *buffer)
{
	unsigned int r=0;
	int i=0;
	char tmp[32];
	if(num < base){
		*buffer++=hexdigit(num);
		*buffer='\0';
		return;
	}
	if(num >= base)
		while(num)
		{
			r=num % base;
			num /= base;
			tmp[i++]=hexdigit(r);	
		}
	i--;
	for( ; i>=0 ; i--)
		*buffer++=tmp[i];
	*buffer='\0';
}


char hexdigit(int n)
{
	char x;
	switch(n)
	{
		case 10:
			x='A';
			break;
		case 11:
			x='B';
			break;
		case 12:
			x='C';
			break;
		case 13:
			x='D';
			break;
		case 14:
			x='E';
			break;
		case 15:
			x='F';
			break;
		default:
			x=n+0x30;
			break;
	}
	return x;
}

void puts(char *s)
{
	while(*s)
		putchar(*s++);
}

int abs(int n)
{
	if(n>=0)
		return n;
	else
		return (n*(-1));
}

void printf(char *fmt, ...)
{
	__builtin_va_list va;
	__builtin_va_start(va, fmt);
	
	char buffer[256];
	char *str;

	while(*fmt){
		switch(*fmt)
		{
			case '%':
				fmt++;
				switch(*fmt)
				{
					case 'd':
						itoa(__builtin_va_arg(va ,int), DEC, buffer);
						puts(buffer);
						break;
					case 'x':
						uitoa(__builtin_va_arg(va ,unsigned int), HEX, buffer);
						puts(buffer);
						break;
					case 's':
						str=(char *)__builtin_va_arg(va, int);
						puts(str);
						break;
				}
				break;
			default:
				putchar(*fmt);
				break;
		}
		fmt++;
	}
	__builtin_va_end(va);
}

