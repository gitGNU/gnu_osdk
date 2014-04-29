/*
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

#ifndef _TASKS_H
#define _TASKS_H

#define NONE -1
#define TASK1 1
#define TASK2 2
#define TASK3 3

extern int task;
extern unsigned char task1_stack[2000];
extern unsigned char task2_stack[2000];
extern unsigned char task3_stack[2000];

extern task_t task1;
extern task_t task2;
extern task_t task3;

extern unsigned int process[3];
extern unsigned int procname[3];


void print_task(task_t *);

void task1_main(void);
void task2_main(void);
void task3_main(void);

#endif
