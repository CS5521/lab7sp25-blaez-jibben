
_tickettest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  printf(1, "parent pid: %d; tickets should be 10\n", getpid());
   9:	e8 5b 04 00 00       	call   469 <getpid>
   e:	89 44 24 08          	mov    %eax,0x8(%esp)
  12:	c7 44 24 04 48 09 00 	movl   $0x948,0x4(%esp)
  19:	00 
  1a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  21:	e8 53 05 00 00       	call   579 <printf>
  ps();
  26:	e8 9d 03 00 00       	call   3c8 <ps>
  int pid = fork();
  2b:	e8 b1 03 00 00       	call   3e1 <fork>
  30:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  if (pid == 0)
  34:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  39:	75 27                	jne    62 <main+0x62>
  {
     printf(1, "first child pid: %d; tickets should be 10\n", getpid());
  3b:	e8 29 04 00 00       	call   469 <getpid>
  40:	89 44 24 08          	mov    %eax,0x8(%esp)
  44:	c7 44 24 04 70 09 00 	movl   $0x970,0x4(%esp)
  4b:	00 
  4c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  53:	e8 21 05 00 00       	call   579 <printf>
     ps();
  58:	e8 6b 03 00 00       	call   3c8 <ps>
     exit();
  5d:	e8 87 03 00 00       	call   3e9 <exit>
  }
  wait();
  62:	e8 8a 03 00 00       	call   3f1 <wait>
  printf(1, "parent pid: %d; setting tickets to 20\n", getpid());
  67:	e8 fd 03 00 00       	call   469 <getpid>
  6c:	89 44 24 08          	mov    %eax,0x8(%esp)
  70:	c7 44 24 04 9c 09 00 	movl   $0x99c,0x4(%esp)
  77:	00 
  78:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7f:	e8 f5 04 00 00       	call   579 <printf>
  if(settickets(20) < 0) printf(1, "big error, set tickets -1");
  84:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
  8b:	e8 01 04 00 00       	call   491 <settickets>
  90:	85 c0                	test   %eax,%eax
  92:	79 14                	jns    a8 <main+0xa8>
  94:	c7 44 24 04 c3 09 00 	movl   $0x9c3,0x4(%esp)
  9b:	00 
  9c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a3:	e8 d1 04 00 00       	call   579 <printf>
  ps();
  a8:	e8 1b 03 00 00       	call   3c8 <ps>
  pid = fork();
  ad:	e8 2f 03 00 00       	call   3e1 <fork>
  b2:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  if (pid == 0)
  b6:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  bb:	0f 85 9d 00 00 00    	jne    15e <main+0x15e>
  {
     printf(1, "second child pid: %d; tickets should be 20\n", getpid());
  c1:	e8 a3 03 00 00       	call   469 <getpid>
  c6:	89 44 24 08          	mov    %eax,0x8(%esp)
  ca:	c7 44 24 04 e0 09 00 	movl   $0x9e0,0x4(%esp)
  d1:	00 
  d2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d9:	e8 9b 04 00 00       	call   579 <printf>
     ps();
  de:	e8 e5 02 00 00       	call   3c8 <ps>
     if(settickets(30) < 0) printf(1, "big error, set tickets -1");
  e3:	c7 04 24 1e 00 00 00 	movl   $0x1e,(%esp)
  ea:	e8 a2 03 00 00       	call   491 <settickets>
  ef:	85 c0                	test   %eax,%eax
  f1:	79 14                	jns    107 <main+0x107>
  f3:	c7 44 24 04 c3 09 00 	movl   $0x9c3,0x4(%esp)
  fa:	00 
  fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 102:	e8 72 04 00 00       	call   579 <printf>
     printf(1, "second child pid: %d; tickets should now be 30\n");
 107:	c7 44 24 04 0c 0a 00 	movl   $0xa0c,0x4(%esp)
 10e:	00 
 10f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 116:	e8 5e 04 00 00       	call   579 <printf>
     ps();
 11b:	e8 a8 02 00 00       	call   3c8 <ps>
     pid = fork();
 120:	e8 bc 02 00 00       	call   3e1 <fork>
 125:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     if (pid == 0)
 129:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
 12e:	75 24                	jne    154 <main+0x154>
     {
        printf(1, "child of second child pid: %d; tickets should be 30\n", getpid());
 130:	e8 34 03 00 00       	call   469 <getpid>
 135:	89 44 24 08          	mov    %eax,0x8(%esp)
 139:	c7 44 24 04 3c 0a 00 	movl   $0xa3c,0x4(%esp)
 140:	00 
 141:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 148:	e8 2c 04 00 00       	call   579 <printf>
        ps();
 14d:	e8 76 02 00 00       	call   3c8 <ps>
 152:	eb 0a                	jmp    15e <main+0x15e>
     } else
     {
        wait();
 154:	e8 98 02 00 00       	call   3f1 <wait>
        exit();
 159:	e8 8b 02 00 00       	call   3e9 <exit>
     }
  }
  wait();
 15e:	e8 8e 02 00 00       	call   3f1 <wait>
  exit();
 163:	e8 81 02 00 00       	call   3e9 <exit>

00000168 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 168:	55                   	push   %ebp
 169:	89 e5                	mov    %esp,%ebp
 16b:	57                   	push   %edi
 16c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 16d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 170:	8b 55 10             	mov    0x10(%ebp),%edx
 173:	8b 45 0c             	mov    0xc(%ebp),%eax
 176:	89 cb                	mov    %ecx,%ebx
 178:	89 df                	mov    %ebx,%edi
 17a:	89 d1                	mov    %edx,%ecx
 17c:	fc                   	cld    
 17d:	f3 aa                	rep stos %al,%es:(%edi)
 17f:	89 ca                	mov    %ecx,%edx
 181:	89 fb                	mov    %edi,%ebx
 183:	89 5d 08             	mov    %ebx,0x8(%ebp)
 186:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 189:	5b                   	pop    %ebx
 18a:	5f                   	pop    %edi
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret    

0000018d <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 18d:	55                   	push   %ebp
 18e:	89 e5                	mov    %esp,%ebp
 190:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 199:	90                   	nop
 19a:	8b 45 08             	mov    0x8(%ebp),%eax
 19d:	8d 50 01             	lea    0x1(%eax),%edx
 1a0:	89 55 08             	mov    %edx,0x8(%ebp)
 1a3:	8b 55 0c             	mov    0xc(%ebp),%edx
 1a6:	8d 4a 01             	lea    0x1(%edx),%ecx
 1a9:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1ac:	0f b6 12             	movzbl (%edx),%edx
 1af:	88 10                	mov    %dl,(%eax)
 1b1:	0f b6 00             	movzbl (%eax),%eax
 1b4:	84 c0                	test   %al,%al
 1b6:	75 e2                	jne    19a <strcpy+0xd>
    ;
  return os;
 1b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1bb:	c9                   	leave  
 1bc:	c3                   	ret    

000001bd <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1bd:	55                   	push   %ebp
 1be:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1c0:	eb 08                	jmp    1ca <strcmp+0xd>
    p++, q++;
 1c2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1c6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 1ca:	8b 45 08             	mov    0x8(%ebp),%eax
 1cd:	0f b6 00             	movzbl (%eax),%eax
 1d0:	84 c0                	test   %al,%al
 1d2:	74 10                	je     1e4 <strcmp+0x27>
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	0f b6 10             	movzbl (%eax),%edx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	0f b6 00             	movzbl (%eax),%eax
 1e0:	38 c2                	cmp    %al,%dl
 1e2:	74 de                	je     1c2 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	0f b6 00             	movzbl (%eax),%eax
 1ea:	0f b6 d0             	movzbl %al,%edx
 1ed:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f0:	0f b6 00             	movzbl (%eax),%eax
 1f3:	0f b6 c0             	movzbl %al,%eax
 1f6:	29 c2                	sub    %eax,%edx
 1f8:	89 d0                	mov    %edx,%eax
}
 1fa:	5d                   	pop    %ebp
 1fb:	c3                   	ret    

000001fc <strlen>:

uint
strlen(const char *s)
{
 1fc:	55                   	push   %ebp
 1fd:	89 e5                	mov    %esp,%ebp
 1ff:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 202:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 209:	eb 04                	jmp    20f <strlen+0x13>
 20b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 20f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 212:	8b 45 08             	mov    0x8(%ebp),%eax
 215:	01 d0                	add    %edx,%eax
 217:	0f b6 00             	movzbl (%eax),%eax
 21a:	84 c0                	test   %al,%al
 21c:	75 ed                	jne    20b <strlen+0xf>
    ;
  return n;
 21e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 221:	c9                   	leave  
 222:	c3                   	ret    

00000223 <memset>:

void*
memset(void *dst, int c, uint n)
{
 223:	55                   	push   %ebp
 224:	89 e5                	mov    %esp,%ebp
 226:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 229:	8b 45 10             	mov    0x10(%ebp),%eax
 22c:	89 44 24 08          	mov    %eax,0x8(%esp)
 230:	8b 45 0c             	mov    0xc(%ebp),%eax
 233:	89 44 24 04          	mov    %eax,0x4(%esp)
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	89 04 24             	mov    %eax,(%esp)
 23d:	e8 26 ff ff ff       	call   168 <stosb>
  return dst;
 242:	8b 45 08             	mov    0x8(%ebp),%eax
}
 245:	c9                   	leave  
 246:	c3                   	ret    

00000247 <strchr>:

char*
strchr(const char *s, char c)
{
 247:	55                   	push   %ebp
 248:	89 e5                	mov    %esp,%ebp
 24a:	83 ec 04             	sub    $0x4,%esp
 24d:	8b 45 0c             	mov    0xc(%ebp),%eax
 250:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 253:	eb 14                	jmp    269 <strchr+0x22>
    if(*s == c)
 255:	8b 45 08             	mov    0x8(%ebp),%eax
 258:	0f b6 00             	movzbl (%eax),%eax
 25b:	3a 45 fc             	cmp    -0x4(%ebp),%al
 25e:	75 05                	jne    265 <strchr+0x1e>
      return (char*)s;
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	eb 13                	jmp    278 <strchr+0x31>
  for(; *s; s++)
 265:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 269:	8b 45 08             	mov    0x8(%ebp),%eax
 26c:	0f b6 00             	movzbl (%eax),%eax
 26f:	84 c0                	test   %al,%al
 271:	75 e2                	jne    255 <strchr+0xe>
  return 0;
 273:	b8 00 00 00 00       	mov    $0x0,%eax
}
 278:	c9                   	leave  
 279:	c3                   	ret    

0000027a <gets>:

char*
gets(char *buf, int max)
{
 27a:	55                   	push   %ebp
 27b:	89 e5                	mov    %esp,%ebp
 27d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 280:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 287:	eb 4c                	jmp    2d5 <gets+0x5b>
    cc = read(0, &c, 1);
 289:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 290:	00 
 291:	8d 45 ef             	lea    -0x11(%ebp),%eax
 294:	89 44 24 04          	mov    %eax,0x4(%esp)
 298:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 29f:	e8 5d 01 00 00       	call   401 <read>
 2a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2a7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2ab:	7f 02                	jg     2af <gets+0x35>
      break;
 2ad:	eb 31                	jmp    2e0 <gets+0x66>
    buf[i++] = c;
 2af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2b2:	8d 50 01             	lea    0x1(%eax),%edx
 2b5:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2b8:	89 c2                	mov    %eax,%edx
 2ba:	8b 45 08             	mov    0x8(%ebp),%eax
 2bd:	01 c2                	add    %eax,%edx
 2bf:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2c3:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 2c5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2c9:	3c 0a                	cmp    $0xa,%al
 2cb:	74 13                	je     2e0 <gets+0x66>
 2cd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2d1:	3c 0d                	cmp    $0xd,%al
 2d3:	74 0b                	je     2e0 <gets+0x66>
  for(i=0; i+1 < max; ){
 2d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d8:	83 c0 01             	add    $0x1,%eax
 2db:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2de:	7c a9                	jl     289 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 2e0:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	01 d0                	add    %edx,%eax
 2e8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2eb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ee:	c9                   	leave  
 2ef:	c3                   	ret    

000002f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2fd:	00 
 2fe:	8b 45 08             	mov    0x8(%ebp),%eax
 301:	89 04 24             	mov    %eax,(%esp)
 304:	e8 20 01 00 00       	call   429 <open>
 309:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 30c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 310:	79 07                	jns    319 <stat+0x29>
    return -1;
 312:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 317:	eb 23                	jmp    33c <stat+0x4c>
  r = fstat(fd, st);
 319:	8b 45 0c             	mov    0xc(%ebp),%eax
 31c:	89 44 24 04          	mov    %eax,0x4(%esp)
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	89 04 24             	mov    %eax,(%esp)
 326:	e8 16 01 00 00       	call   441 <fstat>
 32b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 32e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 331:	89 04 24             	mov    %eax,(%esp)
 334:	e8 d8 00 00 00       	call   411 <close>
  return r;
 339:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 33c:	c9                   	leave  
 33d:	c3                   	ret    

0000033e <atoi>:

int
atoi(const char *s)
{
 33e:	55                   	push   %ebp
 33f:	89 e5                	mov    %esp,%ebp
 341:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 344:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 34b:	eb 25                	jmp    372 <atoi+0x34>
    n = n*10 + *s++ - '0';
 34d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 350:	89 d0                	mov    %edx,%eax
 352:	c1 e0 02             	shl    $0x2,%eax
 355:	01 d0                	add    %edx,%eax
 357:	01 c0                	add    %eax,%eax
 359:	89 c1                	mov    %eax,%ecx
 35b:	8b 45 08             	mov    0x8(%ebp),%eax
 35e:	8d 50 01             	lea    0x1(%eax),%edx
 361:	89 55 08             	mov    %edx,0x8(%ebp)
 364:	0f b6 00             	movzbl (%eax),%eax
 367:	0f be c0             	movsbl %al,%eax
 36a:	01 c8                	add    %ecx,%eax
 36c:	83 e8 30             	sub    $0x30,%eax
 36f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 372:	8b 45 08             	mov    0x8(%ebp),%eax
 375:	0f b6 00             	movzbl (%eax),%eax
 378:	3c 2f                	cmp    $0x2f,%al
 37a:	7e 0a                	jle    386 <atoi+0x48>
 37c:	8b 45 08             	mov    0x8(%ebp),%eax
 37f:	0f b6 00             	movzbl (%eax),%eax
 382:	3c 39                	cmp    $0x39,%al
 384:	7e c7                	jle    34d <atoi+0xf>
  return n;
 386:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 389:	c9                   	leave  
 38a:	c3                   	ret    

0000038b <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 38b:	55                   	push   %ebp
 38c:	89 e5                	mov    %esp,%ebp
 38e:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 391:	8b 45 08             	mov    0x8(%ebp),%eax
 394:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 397:	8b 45 0c             	mov    0xc(%ebp),%eax
 39a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 39d:	eb 17                	jmp    3b6 <memmove+0x2b>
    *dst++ = *src++;
 39f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3a2:	8d 50 01             	lea    0x1(%eax),%edx
 3a5:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3a8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3ab:	8d 4a 01             	lea    0x1(%edx),%ecx
 3ae:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3b1:	0f b6 12             	movzbl (%edx),%edx
 3b4:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 3b6:	8b 45 10             	mov    0x10(%ebp),%eax
 3b9:	8d 50 ff             	lea    -0x1(%eax),%edx
 3bc:	89 55 10             	mov    %edx,0x10(%ebp)
 3bf:	85 c0                	test   %eax,%eax
 3c1:	7f dc                	jg     39f <memmove+0x14>
  return vdst;
 3c3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3c6:	c9                   	leave  
 3c7:	c3                   	ret    

000003c8 <ps>:


// ** wrapper funcion for print sat table **//
void ps() {
 3c8:	55                   	push   %ebp
 3c9:	89 e5                	mov    %esp,%ebp
 3cb:	81 ec 18 09 00 00    	sub    $0x918,%esp
  pstatTable p;
  getpinfo(&p);
 3d1:	8d 85 f8 f6 ff ff    	lea    -0x908(%ebp),%eax
 3d7:	89 04 24             	mov    %eax,(%esp)
 3da:	e8 aa 00 00 00       	call   489 <getpinfo>
 3df:	c9                   	leave  
 3e0:	c3                   	ret    

000003e1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3e1:	b8 01 00 00 00       	mov    $0x1,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <exit>:
SYSCALL(exit)
 3e9:	b8 02 00 00 00       	mov    $0x2,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <wait>:
SYSCALL(wait)
 3f1:	b8 03 00 00 00       	mov    $0x3,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <pipe>:
SYSCALL(pipe)
 3f9:	b8 04 00 00 00       	mov    $0x4,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <read>:
SYSCALL(read)
 401:	b8 05 00 00 00       	mov    $0x5,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <write>:
SYSCALL(write)
 409:	b8 10 00 00 00       	mov    $0x10,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <close>:
SYSCALL(close)
 411:	b8 15 00 00 00       	mov    $0x15,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <kill>:
SYSCALL(kill)
 419:	b8 06 00 00 00       	mov    $0x6,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <exec>:
SYSCALL(exec)
 421:	b8 07 00 00 00       	mov    $0x7,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <open>:
SYSCALL(open)
 429:	b8 0f 00 00 00       	mov    $0xf,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <mknod>:
SYSCALL(mknod)
 431:	b8 11 00 00 00       	mov    $0x11,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <unlink>:
SYSCALL(unlink)
 439:	b8 12 00 00 00       	mov    $0x12,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <fstat>:
SYSCALL(fstat)
 441:	b8 08 00 00 00       	mov    $0x8,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <link>:
SYSCALL(link)
 449:	b8 13 00 00 00       	mov    $0x13,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <mkdir>:
SYSCALL(mkdir)
 451:	b8 14 00 00 00       	mov    $0x14,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <chdir>:
SYSCALL(chdir)
 459:	b8 09 00 00 00       	mov    $0x9,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <dup>:
SYSCALL(dup)
 461:	b8 0a 00 00 00       	mov    $0xa,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <getpid>:
SYSCALL(getpid)
 469:	b8 0b 00 00 00       	mov    $0xb,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <sbrk>:
SYSCALL(sbrk)
 471:	b8 0c 00 00 00       	mov    $0xc,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <sleep>:
SYSCALL(sleep)
 479:	b8 0d 00 00 00       	mov    $0xd,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <uptime>:
SYSCALL(uptime)
 481:	b8 0e 00 00 00       	mov    $0xe,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <getpinfo>:
SYSCALL(getpinfo)
 489:	b8 16 00 00 00       	mov    $0x16,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <settickets>:
SYSCALL(settickets)
 491:	b8 17 00 00 00       	mov    $0x17,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	83 ec 18             	sub    $0x18,%esp
 49f:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a2:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4a5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4ac:	00 
 4ad:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b4:	8b 45 08             	mov    0x8(%ebp),%eax
 4b7:	89 04 24             	mov    %eax,(%esp)
 4ba:	e8 4a ff ff ff       	call   409 <write>
}
 4bf:	c9                   	leave  
 4c0:	c3                   	ret    

000004c1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4c1:	55                   	push   %ebp
 4c2:	89 e5                	mov    %esp,%ebp
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4c9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4d0:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4d4:	74 17                	je     4ed <printint+0x2c>
 4d6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4da:	79 11                	jns    4ed <printint+0x2c>
    neg = 1;
 4dc:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e6:	f7 d8                	neg    %eax
 4e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4eb:	eb 06                	jmp    4f3 <printint+0x32>
  } else {
    x = xx;
 4ed:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4f3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4fa:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4fd:	8d 41 01             	lea    0x1(%ecx),%eax
 500:	89 45 f4             	mov    %eax,-0xc(%ebp)
 503:	8b 5d 10             	mov    0x10(%ebp),%ebx
 506:	8b 45 ec             	mov    -0x14(%ebp),%eax
 509:	ba 00 00 00 00       	mov    $0x0,%edx
 50e:	f7 f3                	div    %ebx
 510:	89 d0                	mov    %edx,%eax
 512:	0f b6 80 dc 0c 00 00 	movzbl 0xcdc(%eax),%eax
 519:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 51d:	8b 75 10             	mov    0x10(%ebp),%esi
 520:	8b 45 ec             	mov    -0x14(%ebp),%eax
 523:	ba 00 00 00 00       	mov    $0x0,%edx
 528:	f7 f6                	div    %esi
 52a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 52d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 531:	75 c7                	jne    4fa <printint+0x39>
  if(neg)
 533:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 537:	74 10                	je     549 <printint+0x88>
    buf[i++] = '-';
 539:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53c:	8d 50 01             	lea    0x1(%eax),%edx
 53f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 542:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 547:	eb 1f                	jmp    568 <printint+0xa7>
 549:	eb 1d                	jmp    568 <printint+0xa7>
    putc(fd, buf[i]);
 54b:	8d 55 dc             	lea    -0x24(%ebp),%edx
 54e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 551:	01 d0                	add    %edx,%eax
 553:	0f b6 00             	movzbl (%eax),%eax
 556:	0f be c0             	movsbl %al,%eax
 559:	89 44 24 04          	mov    %eax,0x4(%esp)
 55d:	8b 45 08             	mov    0x8(%ebp),%eax
 560:	89 04 24             	mov    %eax,(%esp)
 563:	e8 31 ff ff ff       	call   499 <putc>
  while(--i >= 0)
 568:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 56c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 570:	79 d9                	jns    54b <printint+0x8a>
}
 572:	83 c4 30             	add    $0x30,%esp
 575:	5b                   	pop    %ebx
 576:	5e                   	pop    %esi
 577:	5d                   	pop    %ebp
 578:	c3                   	ret    

00000579 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 579:	55                   	push   %ebp
 57a:	89 e5                	mov    %esp,%ebp
 57c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 57f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 586:	8d 45 0c             	lea    0xc(%ebp),%eax
 589:	83 c0 04             	add    $0x4,%eax
 58c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 58f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 596:	e9 7c 01 00 00       	jmp    717 <printf+0x19e>
    c = fmt[i] & 0xff;
 59b:	8b 55 0c             	mov    0xc(%ebp),%edx
 59e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5a1:	01 d0                	add    %edx,%eax
 5a3:	0f b6 00             	movzbl (%eax),%eax
 5a6:	0f be c0             	movsbl %al,%eax
 5a9:	25 ff 00 00 00       	and    $0xff,%eax
 5ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5b1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b5:	75 2c                	jne    5e3 <printf+0x6a>
      if(c == '%'){
 5b7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5bb:	75 0c                	jne    5c9 <printf+0x50>
        state = '%';
 5bd:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5c4:	e9 4a 01 00 00       	jmp    713 <printf+0x19a>
      } else {
        putc(fd, c);
 5c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5cc:	0f be c0             	movsbl %al,%eax
 5cf:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d3:	8b 45 08             	mov    0x8(%ebp),%eax
 5d6:	89 04 24             	mov    %eax,(%esp)
 5d9:	e8 bb fe ff ff       	call   499 <putc>
 5de:	e9 30 01 00 00       	jmp    713 <printf+0x19a>
      }
    } else if(state == '%'){
 5e3:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5e7:	0f 85 26 01 00 00    	jne    713 <printf+0x19a>
      if(c == 'd'){
 5ed:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5f1:	75 2d                	jne    620 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f6:	8b 00                	mov    (%eax),%eax
 5f8:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5ff:	00 
 600:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 607:	00 
 608:	89 44 24 04          	mov    %eax,0x4(%esp)
 60c:	8b 45 08             	mov    0x8(%ebp),%eax
 60f:	89 04 24             	mov    %eax,(%esp)
 612:	e8 aa fe ff ff       	call   4c1 <printint>
        ap++;
 617:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 61b:	e9 ec 00 00 00       	jmp    70c <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 620:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 624:	74 06                	je     62c <printf+0xb3>
 626:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 62a:	75 2d                	jne    659 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 62c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 62f:	8b 00                	mov    (%eax),%eax
 631:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 638:	00 
 639:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 640:	00 
 641:	89 44 24 04          	mov    %eax,0x4(%esp)
 645:	8b 45 08             	mov    0x8(%ebp),%eax
 648:	89 04 24             	mov    %eax,(%esp)
 64b:	e8 71 fe ff ff       	call   4c1 <printint>
        ap++;
 650:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 654:	e9 b3 00 00 00       	jmp    70c <printf+0x193>
      } else if(c == 's'){
 659:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 65d:	75 45                	jne    6a4 <printf+0x12b>
        s = (char*)*ap;
 65f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 662:	8b 00                	mov    (%eax),%eax
 664:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 667:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 66b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 66f:	75 09                	jne    67a <printf+0x101>
          s = "(null)";
 671:	c7 45 f4 71 0a 00 00 	movl   $0xa71,-0xc(%ebp)
        while(*s != 0){
 678:	eb 1e                	jmp    698 <printf+0x11f>
 67a:	eb 1c                	jmp    698 <printf+0x11f>
          putc(fd, *s);
 67c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 67f:	0f b6 00             	movzbl (%eax),%eax
 682:	0f be c0             	movsbl %al,%eax
 685:	89 44 24 04          	mov    %eax,0x4(%esp)
 689:	8b 45 08             	mov    0x8(%ebp),%eax
 68c:	89 04 24             	mov    %eax,(%esp)
 68f:	e8 05 fe ff ff       	call   499 <putc>
          s++;
 694:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 698:	8b 45 f4             	mov    -0xc(%ebp),%eax
 69b:	0f b6 00             	movzbl (%eax),%eax
 69e:	84 c0                	test   %al,%al
 6a0:	75 da                	jne    67c <printf+0x103>
 6a2:	eb 68                	jmp    70c <printf+0x193>
        }
      } else if(c == 'c'){
 6a4:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6a8:	75 1d                	jne    6c7 <printf+0x14e>
        putc(fd, *ap);
 6aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ad:	8b 00                	mov    (%eax),%eax
 6af:	0f be c0             	movsbl %al,%eax
 6b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b6:	8b 45 08             	mov    0x8(%ebp),%eax
 6b9:	89 04 24             	mov    %eax,(%esp)
 6bc:	e8 d8 fd ff ff       	call   499 <putc>
        ap++;
 6c1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c5:	eb 45                	jmp    70c <printf+0x193>
      } else if(c == '%'){
 6c7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6cb:	75 17                	jne    6e4 <printf+0x16b>
        putc(fd, c);
 6cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d0:	0f be c0             	movsbl %al,%eax
 6d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d7:	8b 45 08             	mov    0x8(%ebp),%eax
 6da:	89 04 24             	mov    %eax,(%esp)
 6dd:	e8 b7 fd ff ff       	call   499 <putc>
 6e2:	eb 28                	jmp    70c <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6e4:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6eb:	00 
 6ec:	8b 45 08             	mov    0x8(%ebp),%eax
 6ef:	89 04 24             	mov    %eax,(%esp)
 6f2:	e8 a2 fd ff ff       	call   499 <putc>
        putc(fd, c);
 6f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6fa:	0f be c0             	movsbl %al,%eax
 6fd:	89 44 24 04          	mov    %eax,0x4(%esp)
 701:	8b 45 08             	mov    0x8(%ebp),%eax
 704:	89 04 24             	mov    %eax,(%esp)
 707:	e8 8d fd ff ff       	call   499 <putc>
      }
      state = 0;
 70c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 713:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 717:	8b 55 0c             	mov    0xc(%ebp),%edx
 71a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71d:	01 d0                	add    %edx,%eax
 71f:	0f b6 00             	movzbl (%eax),%eax
 722:	84 c0                	test   %al,%al
 724:	0f 85 71 fe ff ff    	jne    59b <printf+0x22>
    }
  }
}
 72a:	c9                   	leave  
 72b:	c3                   	ret    

0000072c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72c:	55                   	push   %ebp
 72d:	89 e5                	mov    %esp,%ebp
 72f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 732:	8b 45 08             	mov    0x8(%ebp),%eax
 735:	83 e8 08             	sub    $0x8,%eax
 738:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73b:	a1 f8 0c 00 00       	mov    0xcf8,%eax
 740:	89 45 fc             	mov    %eax,-0x4(%ebp)
 743:	eb 24                	jmp    769 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 745:	8b 45 fc             	mov    -0x4(%ebp),%eax
 748:	8b 00                	mov    (%eax),%eax
 74a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 74d:	77 12                	ja     761 <free+0x35>
 74f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 752:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 755:	77 24                	ja     77b <free+0x4f>
 757:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75a:	8b 00                	mov    (%eax),%eax
 75c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 75f:	77 1a                	ja     77b <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	8b 45 fc             	mov    -0x4(%ebp),%eax
 764:	8b 00                	mov    (%eax),%eax
 766:	89 45 fc             	mov    %eax,-0x4(%ebp)
 769:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 76f:	76 d4                	jbe    745 <free+0x19>
 771:	8b 45 fc             	mov    -0x4(%ebp),%eax
 774:	8b 00                	mov    (%eax),%eax
 776:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 779:	76 ca                	jbe    745 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 77b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77e:	8b 40 04             	mov    0x4(%eax),%eax
 781:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 788:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78b:	01 c2                	add    %eax,%edx
 78d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 790:	8b 00                	mov    (%eax),%eax
 792:	39 c2                	cmp    %eax,%edx
 794:	75 24                	jne    7ba <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 796:	8b 45 f8             	mov    -0x8(%ebp),%eax
 799:	8b 50 04             	mov    0x4(%eax),%edx
 79c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79f:	8b 00                	mov    (%eax),%eax
 7a1:	8b 40 04             	mov    0x4(%eax),%eax
 7a4:	01 c2                	add    %eax,%edx
 7a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7af:	8b 00                	mov    (%eax),%eax
 7b1:	8b 10                	mov    (%eax),%edx
 7b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b6:	89 10                	mov    %edx,(%eax)
 7b8:	eb 0a                	jmp    7c4 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bd:	8b 10                	mov    (%eax),%edx
 7bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c7:	8b 40 04             	mov    0x4(%eax),%eax
 7ca:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d4:	01 d0                	add    %edx,%eax
 7d6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7d9:	75 20                	jne    7fb <free+0xcf>
    p->s.size += bp->s.size;
 7db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7de:	8b 50 04             	mov    0x4(%eax),%edx
 7e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e4:	8b 40 04             	mov    0x4(%eax),%eax
 7e7:	01 c2                	add    %eax,%edx
 7e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ec:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f2:	8b 10                	mov    (%eax),%edx
 7f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f7:	89 10                	mov    %edx,(%eax)
 7f9:	eb 08                	jmp    803 <free+0xd7>
  } else
    p->s.ptr = bp;
 7fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fe:	8b 55 f8             	mov    -0x8(%ebp),%edx
 801:	89 10                	mov    %edx,(%eax)
  freep = p;
 803:	8b 45 fc             	mov    -0x4(%ebp),%eax
 806:	a3 f8 0c 00 00       	mov    %eax,0xcf8
}
 80b:	c9                   	leave  
 80c:	c3                   	ret    

0000080d <morecore>:

static Header*
morecore(uint nu)
{
 80d:	55                   	push   %ebp
 80e:	89 e5                	mov    %esp,%ebp
 810:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 813:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 81a:	77 07                	ja     823 <morecore+0x16>
    nu = 4096;
 81c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 823:	8b 45 08             	mov    0x8(%ebp),%eax
 826:	c1 e0 03             	shl    $0x3,%eax
 829:	89 04 24             	mov    %eax,(%esp)
 82c:	e8 40 fc ff ff       	call   471 <sbrk>
 831:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 834:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 838:	75 07                	jne    841 <morecore+0x34>
    return 0;
 83a:	b8 00 00 00 00       	mov    $0x0,%eax
 83f:	eb 22                	jmp    863 <morecore+0x56>
  hp = (Header*)p;
 841:	8b 45 f4             	mov    -0xc(%ebp),%eax
 844:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 847:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84a:	8b 55 08             	mov    0x8(%ebp),%edx
 84d:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 850:	8b 45 f0             	mov    -0x10(%ebp),%eax
 853:	83 c0 08             	add    $0x8,%eax
 856:	89 04 24             	mov    %eax,(%esp)
 859:	e8 ce fe ff ff       	call   72c <free>
  return freep;
 85e:	a1 f8 0c 00 00       	mov    0xcf8,%eax
}
 863:	c9                   	leave  
 864:	c3                   	ret    

00000865 <malloc>:

void*
malloc(uint nbytes)
{
 865:	55                   	push   %ebp
 866:	89 e5                	mov    %esp,%ebp
 868:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 86b:	8b 45 08             	mov    0x8(%ebp),%eax
 86e:	83 c0 07             	add    $0x7,%eax
 871:	c1 e8 03             	shr    $0x3,%eax
 874:	83 c0 01             	add    $0x1,%eax
 877:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 87a:	a1 f8 0c 00 00       	mov    0xcf8,%eax
 87f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 882:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 886:	75 23                	jne    8ab <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 888:	c7 45 f0 f0 0c 00 00 	movl   $0xcf0,-0x10(%ebp)
 88f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 892:	a3 f8 0c 00 00       	mov    %eax,0xcf8
 897:	a1 f8 0c 00 00       	mov    0xcf8,%eax
 89c:	a3 f0 0c 00 00       	mov    %eax,0xcf0
    base.s.size = 0;
 8a1:	c7 05 f4 0c 00 00 00 	movl   $0x0,0xcf4
 8a8:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ae:	8b 00                	mov    (%eax),%eax
 8b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b6:	8b 40 04             	mov    0x4(%eax),%eax
 8b9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8bc:	72 4d                	jb     90b <malloc+0xa6>
      if(p->s.size == nunits)
 8be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c1:	8b 40 04             	mov    0x4(%eax),%eax
 8c4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c7:	75 0c                	jne    8d5 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cc:	8b 10                	mov    (%eax),%edx
 8ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d1:	89 10                	mov    %edx,(%eax)
 8d3:	eb 26                	jmp    8fb <malloc+0x96>
      else {
        p->s.size -= nunits;
 8d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d8:	8b 40 04             	mov    0x4(%eax),%eax
 8db:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8de:	89 c2                	mov    %eax,%edx
 8e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e9:	8b 40 04             	mov    0x4(%eax),%eax
 8ec:	c1 e0 03             	shl    $0x3,%eax
 8ef:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f5:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8f8:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fe:	a3 f8 0c 00 00       	mov    %eax,0xcf8
      return (void*)(p + 1);
 903:	8b 45 f4             	mov    -0xc(%ebp),%eax
 906:	83 c0 08             	add    $0x8,%eax
 909:	eb 38                	jmp    943 <malloc+0xde>
    }
    if(p == freep)
 90b:	a1 f8 0c 00 00       	mov    0xcf8,%eax
 910:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 913:	75 1b                	jne    930 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 915:	8b 45 ec             	mov    -0x14(%ebp),%eax
 918:	89 04 24             	mov    %eax,(%esp)
 91b:	e8 ed fe ff ff       	call   80d <morecore>
 920:	89 45 f4             	mov    %eax,-0xc(%ebp)
 923:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 927:	75 07                	jne    930 <malloc+0xcb>
        return 0;
 929:	b8 00 00 00 00       	mov    $0x0,%eax
 92e:	eb 13                	jmp    943 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 930:	8b 45 f4             	mov    -0xc(%ebp),%eax
 933:	89 45 f0             	mov    %eax,-0x10(%ebp)
 936:	8b 45 f4             	mov    -0xc(%ebp),%eax
 939:	8b 00                	mov    (%eax),%eax
 93b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 93e:	e9 70 ff ff ff       	jmp    8b3 <malloc+0x4e>
}
 943:	c9                   	leave  
 944:	c3                   	ret    
