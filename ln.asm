
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
   9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   d:	74 19                	je     28 <main+0x28>
    printf(2, "Usage: ln old new\n");
   f:	c7 44 24 04 56 08 00 	movl   $0x856,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 67 04 00 00       	call   48a <printf>
    exit();
  23:	e8 d2 02 00 00       	call   2fa <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 08             	add    $0x8,%eax
  2e:	8b 10                	mov    (%eax),%edx
  30:	8b 45 0c             	mov    0xc(%ebp),%eax
  33:	83 c0 04             	add    $0x4,%eax
  36:	8b 00                	mov    (%eax),%eax
  38:	89 54 24 04          	mov    %edx,0x4(%esp)
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 16 03 00 00       	call   35a <link>
  44:	85 c0                	test   %eax,%eax
  46:	79 2c                	jns    74 <main+0x74>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  48:	8b 45 0c             	mov    0xc(%ebp),%eax
  4b:	83 c0 08             	add    $0x8,%eax
  4e:	8b 10                	mov    (%eax),%edx
  50:	8b 45 0c             	mov    0xc(%ebp),%eax
  53:	83 c0 04             	add    $0x4,%eax
  56:	8b 00                	mov    (%eax),%eax
  58:	89 54 24 0c          	mov    %edx,0xc(%esp)
  5c:	89 44 24 08          	mov    %eax,0x8(%esp)
  60:	c7 44 24 04 69 08 00 	movl   $0x869,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 16 04 00 00       	call   48a <printf>
  exit();
  74:	e8 81 02 00 00       	call   2fa <exit>

00000079 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  79:	55                   	push   %ebp
  7a:	89 e5                	mov    %esp,%ebp
  7c:	57                   	push   %edi
  7d:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  7e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  81:	8b 55 10             	mov    0x10(%ebp),%edx
  84:	8b 45 0c             	mov    0xc(%ebp),%eax
  87:	89 cb                	mov    %ecx,%ebx
  89:	89 df                	mov    %ebx,%edi
  8b:	89 d1                	mov    %edx,%ecx
  8d:	fc                   	cld    
  8e:	f3 aa                	rep stos %al,%es:(%edi)
  90:	89 ca                	mov    %ecx,%edx
  92:	89 fb                	mov    %edi,%ebx
  94:	89 5d 08             	mov    %ebx,0x8(%ebp)
  97:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  9a:	5b                   	pop    %ebx
  9b:	5f                   	pop    %edi
  9c:	5d                   	pop    %ebp
  9d:	c3                   	ret    

0000009e <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  9e:	55                   	push   %ebp
  9f:	89 e5                	mov    %esp,%ebp
  a1:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  aa:	90                   	nop
  ab:	8b 45 08             	mov    0x8(%ebp),%eax
  ae:	8d 50 01             	lea    0x1(%eax),%edx
  b1:	89 55 08             	mov    %edx,0x8(%ebp)
  b4:	8b 55 0c             	mov    0xc(%ebp),%edx
  b7:	8d 4a 01             	lea    0x1(%edx),%ecx
  ba:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  bd:	0f b6 12             	movzbl (%edx),%edx
  c0:	88 10                	mov    %dl,(%eax)
  c2:	0f b6 00             	movzbl (%eax),%eax
  c5:	84 c0                	test   %al,%al
  c7:	75 e2                	jne    ab <strcpy+0xd>
    ;
  return os;
  c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  cc:	c9                   	leave  
  cd:	c3                   	ret    

000000ce <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  d1:	eb 08                	jmp    db <strcmp+0xd>
    p++, q++;
  d3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  db:	8b 45 08             	mov    0x8(%ebp),%eax
  de:	0f b6 00             	movzbl (%eax),%eax
  e1:	84 c0                	test   %al,%al
  e3:	74 10                	je     f5 <strcmp+0x27>
  e5:	8b 45 08             	mov    0x8(%ebp),%eax
  e8:	0f b6 10             	movzbl (%eax),%edx
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	0f b6 00             	movzbl (%eax),%eax
  f1:	38 c2                	cmp    %al,%dl
  f3:	74 de                	je     d3 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  f5:	8b 45 08             	mov    0x8(%ebp),%eax
  f8:	0f b6 00             	movzbl (%eax),%eax
  fb:	0f b6 d0             	movzbl %al,%edx
  fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 101:	0f b6 00             	movzbl (%eax),%eax
 104:	0f b6 c0             	movzbl %al,%eax
 107:	29 c2                	sub    %eax,%edx
 109:	89 d0                	mov    %edx,%eax
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    

0000010d <strlen>:

uint
strlen(const char *s)
{
 10d:	55                   	push   %ebp
 10e:	89 e5                	mov    %esp,%ebp
 110:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 113:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 11a:	eb 04                	jmp    120 <strlen+0x13>
 11c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 120:	8b 55 fc             	mov    -0x4(%ebp),%edx
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	01 d0                	add    %edx,%eax
 128:	0f b6 00             	movzbl (%eax),%eax
 12b:	84 c0                	test   %al,%al
 12d:	75 ed                	jne    11c <strlen+0xf>
    ;
  return n;
 12f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 132:	c9                   	leave  
 133:	c3                   	ret    

00000134 <memset>:

void*
memset(void *dst, int c, uint n)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 13a:	8b 45 10             	mov    0x10(%ebp),%eax
 13d:	89 44 24 08          	mov    %eax,0x8(%esp)
 141:	8b 45 0c             	mov    0xc(%ebp),%eax
 144:	89 44 24 04          	mov    %eax,0x4(%esp)
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	89 04 24             	mov    %eax,(%esp)
 14e:	e8 26 ff ff ff       	call   79 <stosb>
  return dst;
 153:	8b 45 08             	mov    0x8(%ebp),%eax
}
 156:	c9                   	leave  
 157:	c3                   	ret    

00000158 <strchr>:

char*
strchr(const char *s, char c)
{
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	83 ec 04             	sub    $0x4,%esp
 15e:	8b 45 0c             	mov    0xc(%ebp),%eax
 161:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 164:	eb 14                	jmp    17a <strchr+0x22>
    if(*s == c)
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	0f b6 00             	movzbl (%eax),%eax
 16c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 16f:	75 05                	jne    176 <strchr+0x1e>
      return (char*)s;
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	eb 13                	jmp    189 <strchr+0x31>
  for(; *s; s++)
 176:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 17a:	8b 45 08             	mov    0x8(%ebp),%eax
 17d:	0f b6 00             	movzbl (%eax),%eax
 180:	84 c0                	test   %al,%al
 182:	75 e2                	jne    166 <strchr+0xe>
  return 0;
 184:	b8 00 00 00 00       	mov    $0x0,%eax
}
 189:	c9                   	leave  
 18a:	c3                   	ret    

0000018b <gets>:

char*
gets(char *buf, int max)
{
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 191:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 198:	eb 4c                	jmp    1e6 <gets+0x5b>
    cc = read(0, &c, 1);
 19a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1a1:	00 
 1a2:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 1a9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b0:	e8 5d 01 00 00       	call   312 <read>
 1b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1bc:	7f 02                	jg     1c0 <gets+0x35>
      break;
 1be:	eb 31                	jmp    1f1 <gets+0x66>
    buf[i++] = c;
 1c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c3:	8d 50 01             	lea    0x1(%eax),%edx
 1c6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1c9:	89 c2                	mov    %eax,%edx
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ce:	01 c2                	add    %eax,%edx
 1d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d4:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1d6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1da:	3c 0a                	cmp    $0xa,%al
 1dc:	74 13                	je     1f1 <gets+0x66>
 1de:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e2:	3c 0d                	cmp    $0xd,%al
 1e4:	74 0b                	je     1f1 <gets+0x66>
  for(i=0; i+1 < max; ){
 1e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e9:	83 c0 01             	add    $0x1,%eax
 1ec:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1ef:	7c a9                	jl     19a <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	01 d0                	add    %edx,%eax
 1f9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ff:	c9                   	leave  
 200:	c3                   	ret    

00000201 <stat>:

int
stat(const char *n, struct stat *st)
{
 201:	55                   	push   %ebp
 202:	89 e5                	mov    %esp,%ebp
 204:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 207:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 20e:	00 
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	89 04 24             	mov    %eax,(%esp)
 215:	e8 20 01 00 00       	call   33a <open>
 21a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 21d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 221:	79 07                	jns    22a <stat+0x29>
    return -1;
 223:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 228:	eb 23                	jmp    24d <stat+0x4c>
  r = fstat(fd, st);
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	89 44 24 04          	mov    %eax,0x4(%esp)
 231:	8b 45 f4             	mov    -0xc(%ebp),%eax
 234:	89 04 24             	mov    %eax,(%esp)
 237:	e8 16 01 00 00       	call   352 <fstat>
 23c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 23f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 242:	89 04 24             	mov    %eax,(%esp)
 245:	e8 d8 00 00 00       	call   322 <close>
  return r;
 24a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 24d:	c9                   	leave  
 24e:	c3                   	ret    

0000024f <atoi>:

int
atoi(const char *s)
{
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
 252:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 255:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 25c:	eb 25                	jmp    283 <atoi+0x34>
    n = n*10 + *s++ - '0';
 25e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 261:	89 d0                	mov    %edx,%eax
 263:	c1 e0 02             	shl    $0x2,%eax
 266:	01 d0                	add    %edx,%eax
 268:	01 c0                	add    %eax,%eax
 26a:	89 c1                	mov    %eax,%ecx
 26c:	8b 45 08             	mov    0x8(%ebp),%eax
 26f:	8d 50 01             	lea    0x1(%eax),%edx
 272:	89 55 08             	mov    %edx,0x8(%ebp)
 275:	0f b6 00             	movzbl (%eax),%eax
 278:	0f be c0             	movsbl %al,%eax
 27b:	01 c8                	add    %ecx,%eax
 27d:	83 e8 30             	sub    $0x30,%eax
 280:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	0f b6 00             	movzbl (%eax),%eax
 289:	3c 2f                	cmp    $0x2f,%al
 28b:	7e 0a                	jle    297 <atoi+0x48>
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	0f b6 00             	movzbl (%eax),%eax
 293:	3c 39                	cmp    $0x39,%al
 295:	7e c7                	jle    25e <atoi+0xf>
  return n;
 297:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 29a:	c9                   	leave  
 29b:	c3                   	ret    

0000029c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 29c:	55                   	push   %ebp
 29d:	89 e5                	mov    %esp,%ebp
 29f:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 2a2:	8b 45 08             	mov    0x8(%ebp),%eax
 2a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2ae:	eb 17                	jmp    2c7 <memmove+0x2b>
    *dst++ = *src++;
 2b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2b3:	8d 50 01             	lea    0x1(%eax),%edx
 2b6:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2b9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2bc:	8d 4a 01             	lea    0x1(%edx),%ecx
 2bf:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2c2:	0f b6 12             	movzbl (%edx),%edx
 2c5:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2c7:	8b 45 10             	mov    0x10(%ebp),%eax
 2ca:	8d 50 ff             	lea    -0x1(%eax),%edx
 2cd:	89 55 10             	mov    %edx,0x10(%ebp)
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7f dc                	jg     2b0 <memmove+0x14>
  return vdst;
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <ps>:


// ** wrapper funcion for print sat table **//
void ps() {
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	81 ec 18 09 00 00    	sub    $0x918,%esp
  pstatTable p;
  getpinfo(&p);
 2e2:	8d 85 f8 f6 ff ff    	lea    -0x908(%ebp),%eax
 2e8:	89 04 24             	mov    %eax,(%esp)
 2eb:	e8 aa 00 00 00       	call   39a <getpinfo>
 2f0:	c9                   	leave  
 2f1:	c3                   	ret    

000002f2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2f2:	b8 01 00 00 00       	mov    $0x1,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <exit>:
SYSCALL(exit)
 2fa:	b8 02 00 00 00       	mov    $0x2,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <wait>:
SYSCALL(wait)
 302:	b8 03 00 00 00       	mov    $0x3,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <pipe>:
SYSCALL(pipe)
 30a:	b8 04 00 00 00       	mov    $0x4,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <read>:
SYSCALL(read)
 312:	b8 05 00 00 00       	mov    $0x5,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <write>:
SYSCALL(write)
 31a:	b8 10 00 00 00       	mov    $0x10,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <close>:
SYSCALL(close)
 322:	b8 15 00 00 00       	mov    $0x15,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <kill>:
SYSCALL(kill)
 32a:	b8 06 00 00 00       	mov    $0x6,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <exec>:
SYSCALL(exec)
 332:	b8 07 00 00 00       	mov    $0x7,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <open>:
SYSCALL(open)
 33a:	b8 0f 00 00 00       	mov    $0xf,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <mknod>:
SYSCALL(mknod)
 342:	b8 11 00 00 00       	mov    $0x11,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <unlink>:
SYSCALL(unlink)
 34a:	b8 12 00 00 00       	mov    $0x12,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <fstat>:
SYSCALL(fstat)
 352:	b8 08 00 00 00       	mov    $0x8,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <link>:
SYSCALL(link)
 35a:	b8 13 00 00 00       	mov    $0x13,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <mkdir>:
SYSCALL(mkdir)
 362:	b8 14 00 00 00       	mov    $0x14,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <chdir>:
SYSCALL(chdir)
 36a:	b8 09 00 00 00       	mov    $0x9,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <dup>:
SYSCALL(dup)
 372:	b8 0a 00 00 00       	mov    $0xa,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <getpid>:
SYSCALL(getpid)
 37a:	b8 0b 00 00 00       	mov    $0xb,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <sbrk>:
SYSCALL(sbrk)
 382:	b8 0c 00 00 00       	mov    $0xc,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <sleep>:
SYSCALL(sleep)
 38a:	b8 0d 00 00 00       	mov    $0xd,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <uptime>:
SYSCALL(uptime)
 392:	b8 0e 00 00 00       	mov    $0xe,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <getpinfo>:
SYSCALL(getpinfo)
 39a:	b8 16 00 00 00       	mov    $0x16,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <settickets>:
SYSCALL(settickets)
 3a2:	b8 17 00 00 00       	mov    $0x17,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3aa:	55                   	push   %ebp
 3ab:	89 e5                	mov    %esp,%ebp
 3ad:	83 ec 18             	sub    $0x18,%esp
 3b0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b3:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3b6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3bd:	00 
 3be:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 3c5:	8b 45 08             	mov    0x8(%ebp),%eax
 3c8:	89 04 24             	mov    %eax,(%esp)
 3cb:	e8 4a ff ff ff       	call   31a <write>
}
 3d0:	c9                   	leave  
 3d1:	c3                   	ret    

000003d2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3d2:	55                   	push   %ebp
 3d3:	89 e5                	mov    %esp,%ebp
 3d5:	56                   	push   %esi
 3d6:	53                   	push   %ebx
 3d7:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3da:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3e1:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3e5:	74 17                	je     3fe <printint+0x2c>
 3e7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3eb:	79 11                	jns    3fe <printint+0x2c>
    neg = 1;
 3ed:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f7:	f7 d8                	neg    %eax
 3f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3fc:	eb 06                	jmp    404 <printint+0x32>
  } else {
    x = xx;
 3fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 401:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 404:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 40b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 40e:	8d 41 01             	lea    0x1(%ecx),%eax
 411:	89 45 f4             	mov    %eax,-0xc(%ebp)
 414:	8b 5d 10             	mov    0x10(%ebp),%ebx
 417:	8b 45 ec             	mov    -0x14(%ebp),%eax
 41a:	ba 00 00 00 00       	mov    $0x0,%edx
 41f:	f7 f3                	div    %ebx
 421:	89 d0                	mov    %edx,%eax
 423:	0f b6 80 e8 0a 00 00 	movzbl 0xae8(%eax),%eax
 42a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 42e:	8b 75 10             	mov    0x10(%ebp),%esi
 431:	8b 45 ec             	mov    -0x14(%ebp),%eax
 434:	ba 00 00 00 00       	mov    $0x0,%edx
 439:	f7 f6                	div    %esi
 43b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 43e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 442:	75 c7                	jne    40b <printint+0x39>
  if(neg)
 444:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 448:	74 10                	je     45a <printint+0x88>
    buf[i++] = '-';
 44a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 44d:	8d 50 01             	lea    0x1(%eax),%edx
 450:	89 55 f4             	mov    %edx,-0xc(%ebp)
 453:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 458:	eb 1f                	jmp    479 <printint+0xa7>
 45a:	eb 1d                	jmp    479 <printint+0xa7>
    putc(fd, buf[i]);
 45c:	8d 55 dc             	lea    -0x24(%ebp),%edx
 45f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 462:	01 d0                	add    %edx,%eax
 464:	0f b6 00             	movzbl (%eax),%eax
 467:	0f be c0             	movsbl %al,%eax
 46a:	89 44 24 04          	mov    %eax,0x4(%esp)
 46e:	8b 45 08             	mov    0x8(%ebp),%eax
 471:	89 04 24             	mov    %eax,(%esp)
 474:	e8 31 ff ff ff       	call   3aa <putc>
  while(--i >= 0)
 479:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 47d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 481:	79 d9                	jns    45c <printint+0x8a>
}
 483:	83 c4 30             	add    $0x30,%esp
 486:	5b                   	pop    %ebx
 487:	5e                   	pop    %esi
 488:	5d                   	pop    %ebp
 489:	c3                   	ret    

0000048a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 48a:	55                   	push   %ebp
 48b:	89 e5                	mov    %esp,%ebp
 48d:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 490:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 497:	8d 45 0c             	lea    0xc(%ebp),%eax
 49a:	83 c0 04             	add    $0x4,%eax
 49d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4a0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4a7:	e9 7c 01 00 00       	jmp    628 <printf+0x19e>
    c = fmt[i] & 0xff;
 4ac:	8b 55 0c             	mov    0xc(%ebp),%edx
 4af:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4b2:	01 d0                	add    %edx,%eax
 4b4:	0f b6 00             	movzbl (%eax),%eax
 4b7:	0f be c0             	movsbl %al,%eax
 4ba:	25 ff 00 00 00       	and    $0xff,%eax
 4bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4c2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4c6:	75 2c                	jne    4f4 <printf+0x6a>
      if(c == '%'){
 4c8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4cc:	75 0c                	jne    4da <printf+0x50>
        state = '%';
 4ce:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4d5:	e9 4a 01 00 00       	jmp    624 <printf+0x19a>
      } else {
        putc(fd, c);
 4da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4dd:	0f be c0             	movsbl %al,%eax
 4e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e4:	8b 45 08             	mov    0x8(%ebp),%eax
 4e7:	89 04 24             	mov    %eax,(%esp)
 4ea:	e8 bb fe ff ff       	call   3aa <putc>
 4ef:	e9 30 01 00 00       	jmp    624 <printf+0x19a>
      }
    } else if(state == '%'){
 4f4:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4f8:	0f 85 26 01 00 00    	jne    624 <printf+0x19a>
      if(c == 'd'){
 4fe:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 502:	75 2d                	jne    531 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 504:	8b 45 e8             	mov    -0x18(%ebp),%eax
 507:	8b 00                	mov    (%eax),%eax
 509:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 510:	00 
 511:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 518:	00 
 519:	89 44 24 04          	mov    %eax,0x4(%esp)
 51d:	8b 45 08             	mov    0x8(%ebp),%eax
 520:	89 04 24             	mov    %eax,(%esp)
 523:	e8 aa fe ff ff       	call   3d2 <printint>
        ap++;
 528:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 52c:	e9 ec 00 00 00       	jmp    61d <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 531:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 535:	74 06                	je     53d <printf+0xb3>
 537:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 53b:	75 2d                	jne    56a <printf+0xe0>
        printint(fd, *ap, 16, 0);
 53d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 540:	8b 00                	mov    (%eax),%eax
 542:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 549:	00 
 54a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 551:	00 
 552:	89 44 24 04          	mov    %eax,0x4(%esp)
 556:	8b 45 08             	mov    0x8(%ebp),%eax
 559:	89 04 24             	mov    %eax,(%esp)
 55c:	e8 71 fe ff ff       	call   3d2 <printint>
        ap++;
 561:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 565:	e9 b3 00 00 00       	jmp    61d <printf+0x193>
      } else if(c == 's'){
 56a:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 56e:	75 45                	jne    5b5 <printf+0x12b>
        s = (char*)*ap;
 570:	8b 45 e8             	mov    -0x18(%ebp),%eax
 573:	8b 00                	mov    (%eax),%eax
 575:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 578:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 57c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 580:	75 09                	jne    58b <printf+0x101>
          s = "(null)";
 582:	c7 45 f4 7d 08 00 00 	movl   $0x87d,-0xc(%ebp)
        while(*s != 0){
 589:	eb 1e                	jmp    5a9 <printf+0x11f>
 58b:	eb 1c                	jmp    5a9 <printf+0x11f>
          putc(fd, *s);
 58d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 590:	0f b6 00             	movzbl (%eax),%eax
 593:	0f be c0             	movsbl %al,%eax
 596:	89 44 24 04          	mov    %eax,0x4(%esp)
 59a:	8b 45 08             	mov    0x8(%ebp),%eax
 59d:	89 04 24             	mov    %eax,(%esp)
 5a0:	e8 05 fe ff ff       	call   3aa <putc>
          s++;
 5a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 5a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ac:	0f b6 00             	movzbl (%eax),%eax
 5af:	84 c0                	test   %al,%al
 5b1:	75 da                	jne    58d <printf+0x103>
 5b3:	eb 68                	jmp    61d <printf+0x193>
        }
      } else if(c == 'c'){
 5b5:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5b9:	75 1d                	jne    5d8 <printf+0x14e>
        putc(fd, *ap);
 5bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5be:	8b 00                	mov    (%eax),%eax
 5c0:	0f be c0             	movsbl %al,%eax
 5c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ca:	89 04 24             	mov    %eax,(%esp)
 5cd:	e8 d8 fd ff ff       	call   3aa <putc>
        ap++;
 5d2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5d6:	eb 45                	jmp    61d <printf+0x193>
      } else if(c == '%'){
 5d8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5dc:	75 17                	jne    5f5 <printf+0x16b>
        putc(fd, c);
 5de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5e1:	0f be c0             	movsbl %al,%eax
 5e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e8:	8b 45 08             	mov    0x8(%ebp),%eax
 5eb:	89 04 24             	mov    %eax,(%esp)
 5ee:	e8 b7 fd ff ff       	call   3aa <putc>
 5f3:	eb 28                	jmp    61d <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5f5:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5fc:	00 
 5fd:	8b 45 08             	mov    0x8(%ebp),%eax
 600:	89 04 24             	mov    %eax,(%esp)
 603:	e8 a2 fd ff ff       	call   3aa <putc>
        putc(fd, c);
 608:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 60b:	0f be c0             	movsbl %al,%eax
 60e:	89 44 24 04          	mov    %eax,0x4(%esp)
 612:	8b 45 08             	mov    0x8(%ebp),%eax
 615:	89 04 24             	mov    %eax,(%esp)
 618:	e8 8d fd ff ff       	call   3aa <putc>
      }
      state = 0;
 61d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 624:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 628:	8b 55 0c             	mov    0xc(%ebp),%edx
 62b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 62e:	01 d0                	add    %edx,%eax
 630:	0f b6 00             	movzbl (%eax),%eax
 633:	84 c0                	test   %al,%al
 635:	0f 85 71 fe ff ff    	jne    4ac <printf+0x22>
    }
  }
}
 63b:	c9                   	leave  
 63c:	c3                   	ret    

0000063d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 63d:	55                   	push   %ebp
 63e:	89 e5                	mov    %esp,%ebp
 640:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 643:	8b 45 08             	mov    0x8(%ebp),%eax
 646:	83 e8 08             	sub    $0x8,%eax
 649:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64c:	a1 04 0b 00 00       	mov    0xb04,%eax
 651:	89 45 fc             	mov    %eax,-0x4(%ebp)
 654:	eb 24                	jmp    67a <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 656:	8b 45 fc             	mov    -0x4(%ebp),%eax
 659:	8b 00                	mov    (%eax),%eax
 65b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 65e:	77 12                	ja     672 <free+0x35>
 660:	8b 45 f8             	mov    -0x8(%ebp),%eax
 663:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 666:	77 24                	ja     68c <free+0x4f>
 668:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66b:	8b 00                	mov    (%eax),%eax
 66d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 670:	77 1a                	ja     68c <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 672:	8b 45 fc             	mov    -0x4(%ebp),%eax
 675:	8b 00                	mov    (%eax),%eax
 677:	89 45 fc             	mov    %eax,-0x4(%ebp)
 67a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 680:	76 d4                	jbe    656 <free+0x19>
 682:	8b 45 fc             	mov    -0x4(%ebp),%eax
 685:	8b 00                	mov    (%eax),%eax
 687:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 68a:	76 ca                	jbe    656 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 68c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68f:	8b 40 04             	mov    0x4(%eax),%eax
 692:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 699:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69c:	01 c2                	add    %eax,%edx
 69e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a1:	8b 00                	mov    (%eax),%eax
 6a3:	39 c2                	cmp    %eax,%edx
 6a5:	75 24                	jne    6cb <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6aa:	8b 50 04             	mov    0x4(%eax),%edx
 6ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b0:	8b 00                	mov    (%eax),%eax
 6b2:	8b 40 04             	mov    0x4(%eax),%eax
 6b5:	01 c2                	add    %eax,%edx
 6b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ba:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c0:	8b 00                	mov    (%eax),%eax
 6c2:	8b 10                	mov    (%eax),%edx
 6c4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c7:	89 10                	mov    %edx,(%eax)
 6c9:	eb 0a                	jmp    6d5 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ce:	8b 10                	mov    (%eax),%edx
 6d0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d3:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d8:	8b 40 04             	mov    0x4(%eax),%eax
 6db:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e5:	01 d0                	add    %edx,%eax
 6e7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6ea:	75 20                	jne    70c <free+0xcf>
    p->s.size += bp->s.size;
 6ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ef:	8b 50 04             	mov    0x4(%eax),%edx
 6f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f5:	8b 40 04             	mov    0x4(%eax),%eax
 6f8:	01 c2                	add    %eax,%edx
 6fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fd:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 700:	8b 45 f8             	mov    -0x8(%ebp),%eax
 703:	8b 10                	mov    (%eax),%edx
 705:	8b 45 fc             	mov    -0x4(%ebp),%eax
 708:	89 10                	mov    %edx,(%eax)
 70a:	eb 08                	jmp    714 <free+0xd7>
  } else
    p->s.ptr = bp;
 70c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 712:	89 10                	mov    %edx,(%eax)
  freep = p;
 714:	8b 45 fc             	mov    -0x4(%ebp),%eax
 717:	a3 04 0b 00 00       	mov    %eax,0xb04
}
 71c:	c9                   	leave  
 71d:	c3                   	ret    

0000071e <morecore>:

static Header*
morecore(uint nu)
{
 71e:	55                   	push   %ebp
 71f:	89 e5                	mov    %esp,%ebp
 721:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 724:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 72b:	77 07                	ja     734 <morecore+0x16>
    nu = 4096;
 72d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 734:	8b 45 08             	mov    0x8(%ebp),%eax
 737:	c1 e0 03             	shl    $0x3,%eax
 73a:	89 04 24             	mov    %eax,(%esp)
 73d:	e8 40 fc ff ff       	call   382 <sbrk>
 742:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 745:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 749:	75 07                	jne    752 <morecore+0x34>
    return 0;
 74b:	b8 00 00 00 00       	mov    $0x0,%eax
 750:	eb 22                	jmp    774 <morecore+0x56>
  hp = (Header*)p;
 752:	8b 45 f4             	mov    -0xc(%ebp),%eax
 755:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 758:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75b:	8b 55 08             	mov    0x8(%ebp),%edx
 75e:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 761:	8b 45 f0             	mov    -0x10(%ebp),%eax
 764:	83 c0 08             	add    $0x8,%eax
 767:	89 04 24             	mov    %eax,(%esp)
 76a:	e8 ce fe ff ff       	call   63d <free>
  return freep;
 76f:	a1 04 0b 00 00       	mov    0xb04,%eax
}
 774:	c9                   	leave  
 775:	c3                   	ret    

00000776 <malloc>:

void*
malloc(uint nbytes)
{
 776:	55                   	push   %ebp
 777:	89 e5                	mov    %esp,%ebp
 779:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 77c:	8b 45 08             	mov    0x8(%ebp),%eax
 77f:	83 c0 07             	add    $0x7,%eax
 782:	c1 e8 03             	shr    $0x3,%eax
 785:	83 c0 01             	add    $0x1,%eax
 788:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 78b:	a1 04 0b 00 00       	mov    0xb04,%eax
 790:	89 45 f0             	mov    %eax,-0x10(%ebp)
 793:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 797:	75 23                	jne    7bc <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 799:	c7 45 f0 fc 0a 00 00 	movl   $0xafc,-0x10(%ebp)
 7a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a3:	a3 04 0b 00 00       	mov    %eax,0xb04
 7a8:	a1 04 0b 00 00       	mov    0xb04,%eax
 7ad:	a3 fc 0a 00 00       	mov    %eax,0xafc
    base.s.size = 0;
 7b2:	c7 05 00 0b 00 00 00 	movl   $0x0,0xb00
 7b9:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7bf:	8b 00                	mov    (%eax),%eax
 7c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c7:	8b 40 04             	mov    0x4(%eax),%eax
 7ca:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7cd:	72 4d                	jb     81c <malloc+0xa6>
      if(p->s.size == nunits)
 7cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d2:	8b 40 04             	mov    0x4(%eax),%eax
 7d5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7d8:	75 0c                	jne    7e6 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7dd:	8b 10                	mov    (%eax),%edx
 7df:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e2:	89 10                	mov    %edx,(%eax)
 7e4:	eb 26                	jmp    80c <malloc+0x96>
      else {
        p->s.size -= nunits;
 7e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e9:	8b 40 04             	mov    0x4(%eax),%eax
 7ec:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7ef:	89 c2                	mov    %eax,%edx
 7f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fa:	8b 40 04             	mov    0x4(%eax),%eax
 7fd:	c1 e0 03             	shl    $0x3,%eax
 800:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 803:	8b 45 f4             	mov    -0xc(%ebp),%eax
 806:	8b 55 ec             	mov    -0x14(%ebp),%edx
 809:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 80c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80f:	a3 04 0b 00 00       	mov    %eax,0xb04
      return (void*)(p + 1);
 814:	8b 45 f4             	mov    -0xc(%ebp),%eax
 817:	83 c0 08             	add    $0x8,%eax
 81a:	eb 38                	jmp    854 <malloc+0xde>
    }
    if(p == freep)
 81c:	a1 04 0b 00 00       	mov    0xb04,%eax
 821:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 824:	75 1b                	jne    841 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 826:	8b 45 ec             	mov    -0x14(%ebp),%eax
 829:	89 04 24             	mov    %eax,(%esp)
 82c:	e8 ed fe ff ff       	call   71e <morecore>
 831:	89 45 f4             	mov    %eax,-0xc(%ebp)
 834:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 838:	75 07                	jne    841 <malloc+0xcb>
        return 0;
 83a:	b8 00 00 00 00       	mov    $0x0,%eax
 83f:	eb 13                	jmp    854 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 841:	8b 45 f4             	mov    -0xc(%ebp),%eax
 844:	89 45 f0             	mov    %eax,-0x10(%ebp)
 847:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84a:	8b 00                	mov    (%eax),%eax
 84c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 84f:	e9 70 ff ff ff       	jmp    7c4 <malloc+0x4e>
}
 854:	c9                   	leave  
 855:	c3                   	ret    
