void interrupt(int, int);
void kputchar(char);
void kprint(int);
void osdk_out(unsigned short, unsigned char);
unsigned char osdk_in(unsigned short);
void osdk_timerhz(unsigned short);
unsigned char osdk_getch(void);
void osdk_putchar(char, char, unsigned int);

#define VIDEO	0xb8000
#define COLUMNS	80
#define LINES	25
#define COLOR	7
unsigned char *video = (unsigned char *) VIDEO;
struct pos_t
{
	unsigned int x;
 	unsigned int y;
};
struct pos_t pos;

char kbdus[128] ={
    0,  27, '1', '2', '3', '4', '5', '6', '7', '8',	/* 9 */
  '9', '0', '-', '=', '\b',	/* Backspace */
  '\t',			/* Tab */
  'q', 'w', 'e', 'r',	/* 19 */
  't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\n',	/* Enter key */
    0,			/* 29   - Control */
  'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';',	/* 39 */
 '\'', '`',   0,		/* Left shift */
 '\\', 'z', 'x', 'c', 'v', 'b', 'n',			/* 49 */
  'm', ',', '.', '/',   0,				/* Right shift */
  '*',
    0,	/* Alt */
  ' ',	/* Space bar */
    0,	/* Caps lock */
    0,	/* 59 - F1 key ... > */
    0,   0,   0,   0,   0,   0,   0,   0,
    0,	/* < ... F10 */
    0,	/* 69 - Num lock*/
    0,	/* Scroll Lock */
    0,	/* Home key */
    0,	/* Up Arrow */
    0,	/* Page Up */
  '-',
    0,	/* Left Arrow */
    0,
    0,	/* Right Arrow */
  '+',
    0,	/* 79 - End key*/
    0,	/* Down Arrow */
    0,	/* Page Down */
    0,	/* Insert Key */
    0,	/* Delete Key */
    0,   0,   0,
    0,	/* F11 Key */
    0,	/* F12 Key */
    0,	/* All other keys are undefined */
};	

int timer=0;
int x=0;
int y=0;

main()
{
  kputchar('E');
  kputchar('x');
  kputchar('a');
  kputchar('m');
  kputchar('p');
  kputchar('l');
  kputchar('e');
  kputchar('O');
  kputchar('S');
  osdk_timerhz(50);
  for(;;);
 }

void interrupt(int num, int err)
{
  int key;
  if(num==0x20)
    {
      timer++;
      if(timer % 50 == 0)
	{
	  osdk_putchar('1',0x7,y*80+x*2);
	  x++;
	  osdk_putchar('s',0x7,y*80+x*2);
	  x++;
	}
    }
  if(num==0x21)
    {
      key=osdk_getch();
      kputchar(kbdus[key]);
     }
}

void kputchar(char c)
{
  	if(pos.x==(COLUMNS-1)){
		pos.x=0;
		pos.y++;
	}
	if(pos.y==(LINES-1)){
		pos.x=0;
		pos.y=0;
	}
	unsigned int offset = (pos.y * COLUMNS * 2 + pos.x * 2);
     	*video=c;video++;
	*video=COLOR;video++;
	pos.x++;
}

void kprint(int c)
{
  kputchar((c/0x10)+0x30);
  kputchar((c%0x10)+0x30);
}
