
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 ef 08 00 00 	movl   $0x8ef,(%esp)
  18:	e8 b3 03 00 00       	call   3d0 <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 ef 08 00 00 	movl   $0x8ef,(%esp)
  38:	e8 9b 03 00 00       	call   3d8 <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 ef 08 00 00 	movl   $0x8ef,(%esp)
  4c:	e8 7f 03 00 00       	call   3d0 <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 ab 03 00 00       	call   408 <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 9f 03 00 00       	call   408 <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  69:	c7 44 24 04 f7 08 00 	movl   $0x8f7,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 a3 04 00 00       	call   520 <printf>
    pid = fork();
  7d:	e8 06 03 00 00       	call   388 <fork>
  82:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
  86:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  8b:	79 19                	jns    a6 <main+0xa6>
      printf(1, "init: fork failed\n");
  8d:	c7 44 24 04 0a 09 00 	movl   $0x90a,0x4(%esp)
  94:	00 
  95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9c:	e8 7f 04 00 00       	call   520 <printf>
      exit();
  a1:	e8 ea 02 00 00       	call   390 <exit>
    }
    if(pid == 0){
  a6:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  ab:	75 2d                	jne    da <main+0xda>
      exec("sh", argv);
  ad:	c7 44 24 04 a8 0b 00 	movl   $0xba8,0x4(%esp)
  b4:	00 
  b5:	c7 04 24 ec 08 00 00 	movl   $0x8ec,(%esp)
  bc:	e8 07 03 00 00       	call   3c8 <exec>
      printf(1, "init: exec sh failed\n");
  c1:	c7 44 24 04 1d 09 00 	movl   $0x91d,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 4b 04 00 00       	call   520 <printf>
      exit();
  d5:	e8 b6 02 00 00       	call   390 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  da:	eb 14                	jmp    f0 <main+0xf0>
      printf(1, "zombie!\n");
  dc:	c7 44 24 04 33 09 00 	movl   $0x933,0x4(%esp)
  e3:	00 
  e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  eb:	e8 30 04 00 00       	call   520 <printf>
    while((wpid=wait()) >= 0 && wpid != pid)
  f0:	e8 a3 02 00 00       	call   398 <wait>
  f5:	89 44 24 18          	mov    %eax,0x18(%esp)
  f9:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  fe:	78 0a                	js     10a <main+0x10a>
 100:	8b 44 24 18          	mov    0x18(%esp),%eax
 104:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 108:	75 d2                	jne    dc <main+0xdc>
  }
 10a:	e9 5a ff ff ff       	jmp    69 <main+0x69>

0000010f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	57                   	push   %edi
 113:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 114:	8b 4d 08             	mov    0x8(%ebp),%ecx
 117:	8b 55 10             	mov    0x10(%ebp),%edx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 cb                	mov    %ecx,%ebx
 11f:	89 df                	mov    %ebx,%edi
 121:	89 d1                	mov    %edx,%ecx
 123:	fc                   	cld    
 124:	f3 aa                	rep stos %al,%es:(%edi)
 126:	89 ca                	mov    %ecx,%edx
 128:	89 fb                	mov    %edi,%ebx
 12a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 130:	5b                   	pop    %ebx
 131:	5f                   	pop    %edi
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    

00000134 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13a:	8b 45 08             	mov    0x8(%ebp),%eax
 13d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 140:	90                   	nop
 141:	8b 45 08             	mov    0x8(%ebp),%eax
 144:	8d 50 01             	lea    0x1(%eax),%edx
 147:	89 55 08             	mov    %edx,0x8(%ebp)
 14a:	8b 55 0c             	mov    0xc(%ebp),%edx
 14d:	8d 4a 01             	lea    0x1(%edx),%ecx
 150:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 153:	0f b6 12             	movzbl (%edx),%edx
 156:	88 10                	mov    %dl,(%eax)
 158:	0f b6 00             	movzbl (%eax),%eax
 15b:	84 c0                	test   %al,%al
 15d:	75 e2                	jne    141 <strcpy+0xd>
    ;
  return os;
 15f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 162:	c9                   	leave  
 163:	c3                   	ret    

00000164 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 167:	eb 08                	jmp    171 <strcmp+0xd>
    p++, q++;
 169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	0f b6 00             	movzbl (%eax),%eax
 177:	84 c0                	test   %al,%al
 179:	74 10                	je     18b <strcmp+0x27>
 17b:	8b 45 08             	mov    0x8(%ebp),%eax
 17e:	0f b6 10             	movzbl (%eax),%edx
 181:	8b 45 0c             	mov    0xc(%ebp),%eax
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	38 c2                	cmp    %al,%dl
 189:	74 de                	je     169 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	0f b6 00             	movzbl (%eax),%eax
 191:	0f b6 d0             	movzbl %al,%edx
 194:	8b 45 0c             	mov    0xc(%ebp),%eax
 197:	0f b6 00             	movzbl (%eax),%eax
 19a:	0f b6 c0             	movzbl %al,%eax
 19d:	29 c2                	sub    %eax,%edx
 19f:	89 d0                	mov    %edx,%eax
}
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    

000001a3 <strlen>:

uint
strlen(const char *s)
{
 1a3:	55                   	push   %ebp
 1a4:	89 e5                	mov    %esp,%ebp
 1a6:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1a9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b0:	eb 04                	jmp    1b6 <strlen+0x13>
 1b2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1b6:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	01 d0                	add    %edx,%eax
 1be:	0f b6 00             	movzbl (%eax),%eax
 1c1:	84 c0                	test   %al,%al
 1c3:	75 ed                	jne    1b2 <strlen+0xf>
    ;
  return n;
 1c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1c8:	c9                   	leave  
 1c9:	c3                   	ret    

000001ca <memset>:

void*
memset(void *dst, int c, uint n)
{
 1ca:	55                   	push   %ebp
 1cb:	89 e5                	mov    %esp,%ebp
 1cd:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1d0:	8b 45 10             	mov    0x10(%ebp),%eax
 1d3:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1da:	89 44 24 04          	mov    %eax,0x4(%esp)
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	89 04 24             	mov    %eax,(%esp)
 1e4:	e8 26 ff ff ff       	call   10f <stosb>
  return dst;
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ec:	c9                   	leave  
 1ed:	c3                   	ret    

000001ee <strchr>:

char*
strchr(const char *s, char c)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	83 ec 04             	sub    $0x4,%esp
 1f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1fa:	eb 14                	jmp    210 <strchr+0x22>
    if(*s == c)
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	0f b6 00             	movzbl (%eax),%eax
 202:	3a 45 fc             	cmp    -0x4(%ebp),%al
 205:	75 05                	jne    20c <strchr+0x1e>
      return (char*)s;
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	eb 13                	jmp    21f <strchr+0x31>
  for(; *s; s++)
 20c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	0f b6 00             	movzbl (%eax),%eax
 216:	84 c0                	test   %al,%al
 218:	75 e2                	jne    1fc <strchr+0xe>
  return 0;
 21a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 21f:	c9                   	leave  
 220:	c3                   	ret    

00000221 <gets>:

char*
gets(char *buf, int max)
{
 221:	55                   	push   %ebp
 222:	89 e5                	mov    %esp,%ebp
 224:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 227:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 22e:	eb 4c                	jmp    27c <gets+0x5b>
    cc = read(0, &c, 1);
 230:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 237:	00 
 238:	8d 45 ef             	lea    -0x11(%ebp),%eax
 23b:	89 44 24 04          	mov    %eax,0x4(%esp)
 23f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 246:	e8 5d 01 00 00       	call   3a8 <read>
 24b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 24e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 252:	7f 02                	jg     256 <gets+0x35>
      break;
 254:	eb 31                	jmp    287 <gets+0x66>
    buf[i++] = c;
 256:	8b 45 f4             	mov    -0xc(%ebp),%eax
 259:	8d 50 01             	lea    0x1(%eax),%edx
 25c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 25f:	89 c2                	mov    %eax,%edx
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	01 c2                	add    %eax,%edx
 266:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 26a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 26c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 270:	3c 0a                	cmp    $0xa,%al
 272:	74 13                	je     287 <gets+0x66>
 274:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 278:	3c 0d                	cmp    $0xd,%al
 27a:	74 0b                	je     287 <gets+0x66>
  for(i=0; i+1 < max; ){
 27c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 27f:	83 c0 01             	add    $0x1,%eax
 282:	3b 45 0c             	cmp    0xc(%ebp),%eax
 285:	7c a9                	jl     230 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 287:	8b 55 f4             	mov    -0xc(%ebp),%edx
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	01 d0                	add    %edx,%eax
 28f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 292:	8b 45 08             	mov    0x8(%ebp),%eax
}
 295:	c9                   	leave  
 296:	c3                   	ret    

00000297 <stat>:

int
stat(const char *n, struct stat *st)
{
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a4:	00 
 2a5:	8b 45 08             	mov    0x8(%ebp),%eax
 2a8:	89 04 24             	mov    %eax,(%esp)
 2ab:	e8 20 01 00 00       	call   3d0 <open>
 2b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2b7:	79 07                	jns    2c0 <stat+0x29>
    return -1;
 2b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2be:	eb 23                	jmp    2e3 <stat+0x4c>
  r = fstat(fd, st);
 2c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ca:	89 04 24             	mov    %eax,(%esp)
 2cd:	e8 16 01 00 00       	call   3e8 <fstat>
 2d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d8:	89 04 24             	mov    %eax,(%esp)
 2db:	e8 d8 00 00 00       	call   3b8 <close>
  return r;
 2e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    

000002e5 <atoi>:

int
atoi(const char *s)
{
 2e5:	55                   	push   %ebp
 2e6:	89 e5                	mov    %esp,%ebp
 2e8:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f2:	eb 25                	jmp    319 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2f4:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2f7:	89 d0                	mov    %edx,%eax
 2f9:	c1 e0 02             	shl    $0x2,%eax
 2fc:	01 d0                	add    %edx,%eax
 2fe:	01 c0                	add    %eax,%eax
 300:	89 c1                	mov    %eax,%ecx
 302:	8b 45 08             	mov    0x8(%ebp),%eax
 305:	8d 50 01             	lea    0x1(%eax),%edx
 308:	89 55 08             	mov    %edx,0x8(%ebp)
 30b:	0f b6 00             	movzbl (%eax),%eax
 30e:	0f be c0             	movsbl %al,%eax
 311:	01 c8                	add    %ecx,%eax
 313:	83 e8 30             	sub    $0x30,%eax
 316:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 319:	8b 45 08             	mov    0x8(%ebp),%eax
 31c:	0f b6 00             	movzbl (%eax),%eax
 31f:	3c 2f                	cmp    $0x2f,%al
 321:	7e 0a                	jle    32d <atoi+0x48>
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	0f b6 00             	movzbl (%eax),%eax
 329:	3c 39                	cmp    $0x39,%al
 32b:	7e c7                	jle    2f4 <atoi+0xf>
  return n;
 32d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 330:	c9                   	leave  
 331:	c3                   	ret    

00000332 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 33e:	8b 45 0c             	mov    0xc(%ebp),%eax
 341:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 344:	eb 17                	jmp    35d <memmove+0x2b>
    *dst++ = *src++;
 346:	8b 45 fc             	mov    -0x4(%ebp),%eax
 349:	8d 50 01             	lea    0x1(%eax),%edx
 34c:	89 55 fc             	mov    %edx,-0x4(%ebp)
 34f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 352:	8d 4a 01             	lea    0x1(%edx),%ecx
 355:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 358:	0f b6 12             	movzbl (%edx),%edx
 35b:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 35d:	8b 45 10             	mov    0x10(%ebp),%eax
 360:	8d 50 ff             	lea    -0x1(%eax),%edx
 363:	89 55 10             	mov    %edx,0x10(%ebp)
 366:	85 c0                	test   %eax,%eax
 368:	7f dc                	jg     346 <memmove+0x14>
  return vdst;
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36d:	c9                   	leave  
 36e:	c3                   	ret    

0000036f <ps>:


// ** wrapper funcion for print sat table **//
void ps() {
 36f:	55                   	push   %ebp
 370:	89 e5                	mov    %esp,%ebp
 372:	81 ec 18 09 00 00    	sub    $0x918,%esp
  pstatTable p;
  getpinfo(&p);
 378:	8d 85 f8 f6 ff ff    	lea    -0x908(%ebp),%eax
 37e:	89 04 24             	mov    %eax,(%esp)
 381:	e8 aa 00 00 00       	call   430 <getpinfo>
 386:	c9                   	leave  
 387:	c3                   	ret    

00000388 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 388:	b8 01 00 00 00       	mov    $0x1,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <exit>:
SYSCALL(exit)
 390:	b8 02 00 00 00       	mov    $0x2,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <wait>:
SYSCALL(wait)
 398:	b8 03 00 00 00       	mov    $0x3,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <pipe>:
SYSCALL(pipe)
 3a0:	b8 04 00 00 00       	mov    $0x4,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <read>:
SYSCALL(read)
 3a8:	b8 05 00 00 00       	mov    $0x5,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <write>:
SYSCALL(write)
 3b0:	b8 10 00 00 00       	mov    $0x10,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <close>:
SYSCALL(close)
 3b8:	b8 15 00 00 00       	mov    $0x15,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <kill>:
SYSCALL(kill)
 3c0:	b8 06 00 00 00       	mov    $0x6,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <exec>:
SYSCALL(exec)
 3c8:	b8 07 00 00 00       	mov    $0x7,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <open>:
SYSCALL(open)
 3d0:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <mknod>:
SYSCALL(mknod)
 3d8:	b8 11 00 00 00       	mov    $0x11,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <unlink>:
SYSCALL(unlink)
 3e0:	b8 12 00 00 00       	mov    $0x12,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <fstat>:
SYSCALL(fstat)
 3e8:	b8 08 00 00 00       	mov    $0x8,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <link>:
SYSCALL(link)
 3f0:	b8 13 00 00 00       	mov    $0x13,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <mkdir>:
SYSCALL(mkdir)
 3f8:	b8 14 00 00 00       	mov    $0x14,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <chdir>:
SYSCALL(chdir)
 400:	b8 09 00 00 00       	mov    $0x9,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <dup>:
SYSCALL(dup)
 408:	b8 0a 00 00 00       	mov    $0xa,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <getpid>:
SYSCALL(getpid)
 410:	b8 0b 00 00 00       	mov    $0xb,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <sbrk>:
SYSCALL(sbrk)
 418:	b8 0c 00 00 00       	mov    $0xc,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <sleep>:
SYSCALL(sleep)
 420:	b8 0d 00 00 00       	mov    $0xd,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <uptime>:
SYSCALL(uptime)
 428:	b8 0e 00 00 00       	mov    $0xe,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <getpinfo>:
SYSCALL(getpinfo)
 430:	b8 16 00 00 00       	mov    $0x16,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <settickets>:
SYSCALL(settickets)
 438:	b8 17 00 00 00       	mov    $0x17,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	83 ec 18             	sub    $0x18,%esp
 446:	8b 45 0c             	mov    0xc(%ebp),%eax
 449:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 44c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 453:	00 
 454:	8d 45 f4             	lea    -0xc(%ebp),%eax
 457:	89 44 24 04          	mov    %eax,0x4(%esp)
 45b:	8b 45 08             	mov    0x8(%ebp),%eax
 45e:	89 04 24             	mov    %eax,(%esp)
 461:	e8 4a ff ff ff       	call   3b0 <write>
}
 466:	c9                   	leave  
 467:	c3                   	ret    

00000468 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 468:	55                   	push   %ebp
 469:	89 e5                	mov    %esp,%ebp
 46b:	56                   	push   %esi
 46c:	53                   	push   %ebx
 46d:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 470:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 477:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 47b:	74 17                	je     494 <printint+0x2c>
 47d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 481:	79 11                	jns    494 <printint+0x2c>
    neg = 1;
 483:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 48a:	8b 45 0c             	mov    0xc(%ebp),%eax
 48d:	f7 d8                	neg    %eax
 48f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 492:	eb 06                	jmp    49a <printint+0x32>
  } else {
    x = xx;
 494:	8b 45 0c             	mov    0xc(%ebp),%eax
 497:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 49a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4a1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4a4:	8d 41 01             	lea    0x1(%ecx),%eax
 4a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4aa:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4b0:	ba 00 00 00 00       	mov    $0x0,%edx
 4b5:	f7 f3                	div    %ebx
 4b7:	89 d0                	mov    %edx,%eax
 4b9:	0f b6 80 b0 0b 00 00 	movzbl 0xbb0(%eax),%eax
 4c0:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4c4:	8b 75 10             	mov    0x10(%ebp),%esi
 4c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4ca:	ba 00 00 00 00       	mov    $0x0,%edx
 4cf:	f7 f6                	div    %esi
 4d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4d4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4d8:	75 c7                	jne    4a1 <printint+0x39>
  if(neg)
 4da:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4de:	74 10                	je     4f0 <printint+0x88>
    buf[i++] = '-';
 4e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e3:	8d 50 01             	lea    0x1(%eax),%edx
 4e6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4e9:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4ee:	eb 1f                	jmp    50f <printint+0xa7>
 4f0:	eb 1d                	jmp    50f <printint+0xa7>
    putc(fd, buf[i]);
 4f2:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f8:	01 d0                	add    %edx,%eax
 4fa:	0f b6 00             	movzbl (%eax),%eax
 4fd:	0f be c0             	movsbl %al,%eax
 500:	89 44 24 04          	mov    %eax,0x4(%esp)
 504:	8b 45 08             	mov    0x8(%ebp),%eax
 507:	89 04 24             	mov    %eax,(%esp)
 50a:	e8 31 ff ff ff       	call   440 <putc>
  while(--i >= 0)
 50f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 513:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 517:	79 d9                	jns    4f2 <printint+0x8a>
}
 519:	83 c4 30             	add    $0x30,%esp
 51c:	5b                   	pop    %ebx
 51d:	5e                   	pop    %esi
 51e:	5d                   	pop    %ebp
 51f:	c3                   	ret    

00000520 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 526:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 52d:	8d 45 0c             	lea    0xc(%ebp),%eax
 530:	83 c0 04             	add    $0x4,%eax
 533:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 536:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 53d:	e9 7c 01 00 00       	jmp    6be <printf+0x19e>
    c = fmt[i] & 0xff;
 542:	8b 55 0c             	mov    0xc(%ebp),%edx
 545:	8b 45 f0             	mov    -0x10(%ebp),%eax
 548:	01 d0                	add    %edx,%eax
 54a:	0f b6 00             	movzbl (%eax),%eax
 54d:	0f be c0             	movsbl %al,%eax
 550:	25 ff 00 00 00       	and    $0xff,%eax
 555:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 558:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 55c:	75 2c                	jne    58a <printf+0x6a>
      if(c == '%'){
 55e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 562:	75 0c                	jne    570 <printf+0x50>
        state = '%';
 564:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 56b:	e9 4a 01 00 00       	jmp    6ba <printf+0x19a>
      } else {
        putc(fd, c);
 570:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 573:	0f be c0             	movsbl %al,%eax
 576:	89 44 24 04          	mov    %eax,0x4(%esp)
 57a:	8b 45 08             	mov    0x8(%ebp),%eax
 57d:	89 04 24             	mov    %eax,(%esp)
 580:	e8 bb fe ff ff       	call   440 <putc>
 585:	e9 30 01 00 00       	jmp    6ba <printf+0x19a>
      }
    } else if(state == '%'){
 58a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 58e:	0f 85 26 01 00 00    	jne    6ba <printf+0x19a>
      if(c == 'd'){
 594:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 598:	75 2d                	jne    5c7 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 59a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 59d:	8b 00                	mov    (%eax),%eax
 59f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5a6:	00 
 5a7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5ae:	00 
 5af:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	89 04 24             	mov    %eax,(%esp)
 5b9:	e8 aa fe ff ff       	call   468 <printint>
        ap++;
 5be:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c2:	e9 ec 00 00 00       	jmp    6b3 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5c7:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5cb:	74 06                	je     5d3 <printf+0xb3>
 5cd:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5d1:	75 2d                	jne    600 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d6:	8b 00                	mov    (%eax),%eax
 5d8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5df:	00 
 5e0:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5e7:	00 
 5e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ec:	8b 45 08             	mov    0x8(%ebp),%eax
 5ef:	89 04 24             	mov    %eax,(%esp)
 5f2:	e8 71 fe ff ff       	call   468 <printint>
        ap++;
 5f7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5fb:	e9 b3 00 00 00       	jmp    6b3 <printf+0x193>
      } else if(c == 's'){
 600:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 604:	75 45                	jne    64b <printf+0x12b>
        s = (char*)*ap;
 606:	8b 45 e8             	mov    -0x18(%ebp),%eax
 609:	8b 00                	mov    (%eax),%eax
 60b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 60e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 612:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 616:	75 09                	jne    621 <printf+0x101>
          s = "(null)";
 618:	c7 45 f4 3c 09 00 00 	movl   $0x93c,-0xc(%ebp)
        while(*s != 0){
 61f:	eb 1e                	jmp    63f <printf+0x11f>
 621:	eb 1c                	jmp    63f <printf+0x11f>
          putc(fd, *s);
 623:	8b 45 f4             	mov    -0xc(%ebp),%eax
 626:	0f b6 00             	movzbl (%eax),%eax
 629:	0f be c0             	movsbl %al,%eax
 62c:	89 44 24 04          	mov    %eax,0x4(%esp)
 630:	8b 45 08             	mov    0x8(%ebp),%eax
 633:	89 04 24             	mov    %eax,(%esp)
 636:	e8 05 fe ff ff       	call   440 <putc>
          s++;
 63b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 63f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 642:	0f b6 00             	movzbl (%eax),%eax
 645:	84 c0                	test   %al,%al
 647:	75 da                	jne    623 <printf+0x103>
 649:	eb 68                	jmp    6b3 <printf+0x193>
        }
      } else if(c == 'c'){
 64b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 64f:	75 1d                	jne    66e <printf+0x14e>
        putc(fd, *ap);
 651:	8b 45 e8             	mov    -0x18(%ebp),%eax
 654:	8b 00                	mov    (%eax),%eax
 656:	0f be c0             	movsbl %al,%eax
 659:	89 44 24 04          	mov    %eax,0x4(%esp)
 65d:	8b 45 08             	mov    0x8(%ebp),%eax
 660:	89 04 24             	mov    %eax,(%esp)
 663:	e8 d8 fd ff ff       	call   440 <putc>
        ap++;
 668:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 66c:	eb 45                	jmp    6b3 <printf+0x193>
      } else if(c == '%'){
 66e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 672:	75 17                	jne    68b <printf+0x16b>
        putc(fd, c);
 674:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 677:	0f be c0             	movsbl %al,%eax
 67a:	89 44 24 04          	mov    %eax,0x4(%esp)
 67e:	8b 45 08             	mov    0x8(%ebp),%eax
 681:	89 04 24             	mov    %eax,(%esp)
 684:	e8 b7 fd ff ff       	call   440 <putc>
 689:	eb 28                	jmp    6b3 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 68b:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 692:	00 
 693:	8b 45 08             	mov    0x8(%ebp),%eax
 696:	89 04 24             	mov    %eax,(%esp)
 699:	e8 a2 fd ff ff       	call   440 <putc>
        putc(fd, c);
 69e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6a1:	0f be c0             	movsbl %al,%eax
 6a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a8:	8b 45 08             	mov    0x8(%ebp),%eax
 6ab:	89 04 24             	mov    %eax,(%esp)
 6ae:	e8 8d fd ff ff       	call   440 <putc>
      }
      state = 0;
 6b3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6ba:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6be:	8b 55 0c             	mov    0xc(%ebp),%edx
 6c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6c4:	01 d0                	add    %edx,%eax
 6c6:	0f b6 00             	movzbl (%eax),%eax
 6c9:	84 c0                	test   %al,%al
 6cb:	0f 85 71 fe ff ff    	jne    542 <printf+0x22>
    }
  }
}
 6d1:	c9                   	leave  
 6d2:	c3                   	ret    

000006d3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d3:	55                   	push   %ebp
 6d4:	89 e5                	mov    %esp,%ebp
 6d6:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
 6dc:	83 e8 08             	sub    $0x8,%eax
 6df:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e2:	a1 cc 0b 00 00       	mov    0xbcc,%eax
 6e7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6ea:	eb 24                	jmp    710 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ef:	8b 00                	mov    (%eax),%eax
 6f1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f4:	77 12                	ja     708 <free+0x35>
 6f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6fc:	77 24                	ja     722 <free+0x4f>
 6fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 701:	8b 00                	mov    (%eax),%eax
 703:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 706:	77 1a                	ja     722 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 708:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70b:	8b 00                	mov    (%eax),%eax
 70d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 710:	8b 45 f8             	mov    -0x8(%ebp),%eax
 713:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 716:	76 d4                	jbe    6ec <free+0x19>
 718:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71b:	8b 00                	mov    (%eax),%eax
 71d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 720:	76 ca                	jbe    6ec <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 722:	8b 45 f8             	mov    -0x8(%ebp),%eax
 725:	8b 40 04             	mov    0x4(%eax),%eax
 728:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 72f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 732:	01 c2                	add    %eax,%edx
 734:	8b 45 fc             	mov    -0x4(%ebp),%eax
 737:	8b 00                	mov    (%eax),%eax
 739:	39 c2                	cmp    %eax,%edx
 73b:	75 24                	jne    761 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 73d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 740:	8b 50 04             	mov    0x4(%eax),%edx
 743:	8b 45 fc             	mov    -0x4(%ebp),%eax
 746:	8b 00                	mov    (%eax),%eax
 748:	8b 40 04             	mov    0x4(%eax),%eax
 74b:	01 c2                	add    %eax,%edx
 74d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 750:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 753:	8b 45 fc             	mov    -0x4(%ebp),%eax
 756:	8b 00                	mov    (%eax),%eax
 758:	8b 10                	mov    (%eax),%edx
 75a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75d:	89 10                	mov    %edx,(%eax)
 75f:	eb 0a                	jmp    76b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 761:	8b 45 fc             	mov    -0x4(%ebp),%eax
 764:	8b 10                	mov    (%eax),%edx
 766:	8b 45 f8             	mov    -0x8(%ebp),%eax
 769:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 76b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76e:	8b 40 04             	mov    0x4(%eax),%eax
 771:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 778:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77b:	01 d0                	add    %edx,%eax
 77d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 780:	75 20                	jne    7a2 <free+0xcf>
    p->s.size += bp->s.size;
 782:	8b 45 fc             	mov    -0x4(%ebp),%eax
 785:	8b 50 04             	mov    0x4(%eax),%edx
 788:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78b:	8b 40 04             	mov    0x4(%eax),%eax
 78e:	01 c2                	add    %eax,%edx
 790:	8b 45 fc             	mov    -0x4(%ebp),%eax
 793:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 796:	8b 45 f8             	mov    -0x8(%ebp),%eax
 799:	8b 10                	mov    (%eax),%edx
 79b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79e:	89 10                	mov    %edx,(%eax)
 7a0:	eb 08                	jmp    7aa <free+0xd7>
  } else
    p->s.ptr = bp;
 7a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7a8:	89 10                	mov    %edx,(%eax)
  freep = p;
 7aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ad:	a3 cc 0b 00 00       	mov    %eax,0xbcc
}
 7b2:	c9                   	leave  
 7b3:	c3                   	ret    

000007b4 <morecore>:

static Header*
morecore(uint nu)
{
 7b4:	55                   	push   %ebp
 7b5:	89 e5                	mov    %esp,%ebp
 7b7:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7ba:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7c1:	77 07                	ja     7ca <morecore+0x16>
    nu = 4096;
 7c3:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7ca:	8b 45 08             	mov    0x8(%ebp),%eax
 7cd:	c1 e0 03             	shl    $0x3,%eax
 7d0:	89 04 24             	mov    %eax,(%esp)
 7d3:	e8 40 fc ff ff       	call   418 <sbrk>
 7d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7db:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7df:	75 07                	jne    7e8 <morecore+0x34>
    return 0;
 7e1:	b8 00 00 00 00       	mov    $0x0,%eax
 7e6:	eb 22                	jmp    80a <morecore+0x56>
  hp = (Header*)p;
 7e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f1:	8b 55 08             	mov    0x8(%ebp),%edx
 7f4:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fa:	83 c0 08             	add    $0x8,%eax
 7fd:	89 04 24             	mov    %eax,(%esp)
 800:	e8 ce fe ff ff       	call   6d3 <free>
  return freep;
 805:	a1 cc 0b 00 00       	mov    0xbcc,%eax
}
 80a:	c9                   	leave  
 80b:	c3                   	ret    

0000080c <malloc>:

void*
malloc(uint nbytes)
{
 80c:	55                   	push   %ebp
 80d:	89 e5                	mov    %esp,%ebp
 80f:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 812:	8b 45 08             	mov    0x8(%ebp),%eax
 815:	83 c0 07             	add    $0x7,%eax
 818:	c1 e8 03             	shr    $0x3,%eax
 81b:	83 c0 01             	add    $0x1,%eax
 81e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 821:	a1 cc 0b 00 00       	mov    0xbcc,%eax
 826:	89 45 f0             	mov    %eax,-0x10(%ebp)
 829:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 82d:	75 23                	jne    852 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 82f:	c7 45 f0 c4 0b 00 00 	movl   $0xbc4,-0x10(%ebp)
 836:	8b 45 f0             	mov    -0x10(%ebp),%eax
 839:	a3 cc 0b 00 00       	mov    %eax,0xbcc
 83e:	a1 cc 0b 00 00       	mov    0xbcc,%eax
 843:	a3 c4 0b 00 00       	mov    %eax,0xbc4
    base.s.size = 0;
 848:	c7 05 c8 0b 00 00 00 	movl   $0x0,0xbc8
 84f:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 852:	8b 45 f0             	mov    -0x10(%ebp),%eax
 855:	8b 00                	mov    (%eax),%eax
 857:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 85a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85d:	8b 40 04             	mov    0x4(%eax),%eax
 860:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 863:	72 4d                	jb     8b2 <malloc+0xa6>
      if(p->s.size == nunits)
 865:	8b 45 f4             	mov    -0xc(%ebp),%eax
 868:	8b 40 04             	mov    0x4(%eax),%eax
 86b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 86e:	75 0c                	jne    87c <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 870:	8b 45 f4             	mov    -0xc(%ebp),%eax
 873:	8b 10                	mov    (%eax),%edx
 875:	8b 45 f0             	mov    -0x10(%ebp),%eax
 878:	89 10                	mov    %edx,(%eax)
 87a:	eb 26                	jmp    8a2 <malloc+0x96>
      else {
        p->s.size -= nunits;
 87c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87f:	8b 40 04             	mov    0x4(%eax),%eax
 882:	2b 45 ec             	sub    -0x14(%ebp),%eax
 885:	89 c2                	mov    %eax,%edx
 887:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 88d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 890:	8b 40 04             	mov    0x4(%eax),%eax
 893:	c1 e0 03             	shl    $0x3,%eax
 896:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 899:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89c:	8b 55 ec             	mov    -0x14(%ebp),%edx
 89f:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a5:	a3 cc 0b 00 00       	mov    %eax,0xbcc
      return (void*)(p + 1);
 8aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ad:	83 c0 08             	add    $0x8,%eax
 8b0:	eb 38                	jmp    8ea <malloc+0xde>
    }
    if(p == freep)
 8b2:	a1 cc 0b 00 00       	mov    0xbcc,%eax
 8b7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8ba:	75 1b                	jne    8d7 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8bf:	89 04 24             	mov    %eax,(%esp)
 8c2:	e8 ed fe ff ff       	call   7b4 <morecore>
 8c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8ca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8ce:	75 07                	jne    8d7 <malloc+0xcb>
        return 0;
 8d0:	b8 00 00 00 00       	mov    $0x0,%eax
 8d5:	eb 13                	jmp    8ea <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8da:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e0:	8b 00                	mov    (%eax),%eax
 8e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8e5:	e9 70 ff ff ff       	jmp    85a <malloc+0x4e>
}
 8ea:	c9                   	leave  
 8eb:	c3                   	ret    
