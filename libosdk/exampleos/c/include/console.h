/*
 exampleos/c/include/console.h
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

#ifndef _CONSOLE_H
#define _CONSOLE_H

#define VIDEO	0xb8000
#define COLUMNS	80
#define LINES	25
#define COLOR 9

typedef struct pos_t
{
	unsigned int x;
 	unsigned int y;
}pos_t;

extern pos_t pos;
extern char kbdus[128];

void clearscr(void);
void putchar(char);

#endif
