
_rm:     file format elf32-i386


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
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "Usage: rm files...\n");
   f:	c7 44 24 04 6c 08 00 	movl   $0x86c,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 7d 04 00 00       	call   4a0 <printf>
    exit();
  23:	e8 e8 02 00 00       	call   310 <exit>
  }

  for(i = 1; i < argc; i++){
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 4f                	jmp    81 <main+0x81>
    if(unlink(argv[i]) < 0){
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 14 03 00 00       	call   360 <unlink>
  4c:	85 c0                	test   %eax,%eax
  4e:	79 2c                	jns    7c <main+0x7c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  50:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  54:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  5e:	01 d0                	add    %edx,%eax
  60:	8b 00                	mov    (%eax),%eax
  62:	89 44 24 08          	mov    %eax,0x8(%esp)
  66:	c7 44 24 04 80 08 00 	movl   $0x880,0x4(%esp)
  6d:	00 
  6e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  75:	e8 26 04 00 00       	call   4a0 <printf>
      break;
  7a:	eb 0e                	jmp    8a <main+0x8a>
  for(i = 1; i < argc; i++){
  7c:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  81:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  85:	3b 45 08             	cmp    0x8(%ebp),%eax
  88:	7c a8                	jl     32 <main+0x32>
    }
  }

  exit();
  8a:	e8 81 02 00 00       	call   310 <exit>

0000008f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  8f:	55                   	push   %ebp
  90:	89 e5                	mov    %esp,%ebp
  92:	57                   	push   %edi
  93:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  94:	8b 4d 08             	mov    0x8(%ebp),%ecx
  97:	8b 55 10             	mov    0x10(%ebp),%edx
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	89 cb                	mov    %ecx,%ebx
  9f:	89 df                	mov    %ebx,%edi
  a1:	89 d1                	mov    %edx,%ecx
  a3:	fc                   	cld    
  a4:	f3 aa                	rep stos %al,%es:(%edi)
  a6:	89 ca                	mov    %ecx,%edx
  a8:	89 fb                	mov    %edi,%ebx
  aa:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ad:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  b0:	5b                   	pop    %ebx
  b1:	5f                   	pop    %edi
  b2:	5d                   	pop    %ebp
  b3:	c3                   	ret    

000000b4 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  c0:	90                   	nop
  c1:	8b 45 08             	mov    0x8(%ebp),%eax
  c4:	8d 50 01             	lea    0x1(%eax),%edx
  c7:	89 55 08             	mov    %edx,0x8(%ebp)
  ca:	8b 55 0c             	mov    0xc(%ebp),%edx
  cd:	8d 4a 01             	lea    0x1(%edx),%ecx
  d0:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  d3:	0f b6 12             	movzbl (%edx),%edx
  d6:	88 10                	mov    %dl,(%eax)
  d8:	0f b6 00             	movzbl (%eax),%eax
  db:	84 c0                	test   %al,%al
  dd:	75 e2                	jne    c1 <strcpy+0xd>
    ;
  return os;
  df:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e2:	c9                   	leave  
  e3:	c3                   	ret    

000000e4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e7:	eb 08                	jmp    f1 <strcmp+0xd>
    p++, q++;
  e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ed:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	84 c0                	test   %al,%al
  f9:	74 10                	je     10b <strcmp+0x27>
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  fe:	0f b6 10             	movzbl (%eax),%edx
 101:	8b 45 0c             	mov    0xc(%ebp),%eax
 104:	0f b6 00             	movzbl (%eax),%eax
 107:	38 c2                	cmp    %al,%dl
 109:	74 de                	je     e9 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 10b:	8b 45 08             	mov    0x8(%ebp),%eax
 10e:	0f b6 00             	movzbl (%eax),%eax
 111:	0f b6 d0             	movzbl %al,%edx
 114:	8b 45 0c             	mov    0xc(%ebp),%eax
 117:	0f b6 00             	movzbl (%eax),%eax
 11a:	0f b6 c0             	movzbl %al,%eax
 11d:	29 c2                	sub    %eax,%edx
 11f:	89 d0                	mov    %edx,%eax
}
 121:	5d                   	pop    %ebp
 122:	c3                   	ret    

00000123 <strlen>:

uint
strlen(const char *s)
{
 123:	55                   	push   %ebp
 124:	89 e5                	mov    %esp,%ebp
 126:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 129:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 130:	eb 04                	jmp    136 <strlen+0x13>
 132:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 136:	8b 55 fc             	mov    -0x4(%ebp),%edx
 139:	8b 45 08             	mov    0x8(%ebp),%eax
 13c:	01 d0                	add    %edx,%eax
 13e:	0f b6 00             	movzbl (%eax),%eax
 141:	84 c0                	test   %al,%al
 143:	75 ed                	jne    132 <strlen+0xf>
    ;
  return n;
 145:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <memset>:

void*
memset(void *dst, int c, uint n)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 150:	8b 45 10             	mov    0x10(%ebp),%eax
 153:	89 44 24 08          	mov    %eax,0x8(%esp)
 157:	8b 45 0c             	mov    0xc(%ebp),%eax
 15a:	89 44 24 04          	mov    %eax,0x4(%esp)
 15e:	8b 45 08             	mov    0x8(%ebp),%eax
 161:	89 04 24             	mov    %eax,(%esp)
 164:	e8 26 ff ff ff       	call   8f <stosb>
  return dst;
 169:	8b 45 08             	mov    0x8(%ebp),%eax
}
 16c:	c9                   	leave  
 16d:	c3                   	ret    

0000016e <strchr>:

char*
strchr(const char *s, char c)
{
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	83 ec 04             	sub    $0x4,%esp
 174:	8b 45 0c             	mov    0xc(%ebp),%eax
 177:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 17a:	eb 14                	jmp    190 <strchr+0x22>
    if(*s == c)
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	0f b6 00             	movzbl (%eax),%eax
 182:	3a 45 fc             	cmp    -0x4(%ebp),%al
 185:	75 05                	jne    18c <strchr+0x1e>
      return (char*)s;
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	eb 13                	jmp    19f <strchr+0x31>
  for(; *s; s++)
 18c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	0f b6 00             	movzbl (%eax),%eax
 196:	84 c0                	test   %al,%al
 198:	75 e2                	jne    17c <strchr+0xe>
  return 0;
 19a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 19f:	c9                   	leave  
 1a0:	c3                   	ret    

000001a1 <gets>:

char*
gets(char *buf, int max)
{
 1a1:	55                   	push   %ebp
 1a2:	89 e5                	mov    %esp,%ebp
 1a4:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1ae:	eb 4c                	jmp    1fc <gets+0x5b>
    cc = read(0, &c, 1);
 1b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1b7:	00 
 1b8:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 1bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1c6:	e8 5d 01 00 00       	call   328 <read>
 1cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1d2:	7f 02                	jg     1d6 <gets+0x35>
      break;
 1d4:	eb 31                	jmp    207 <gets+0x66>
    buf[i++] = c;
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	8d 50 01             	lea    0x1(%eax),%edx
 1dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1df:	89 c2                	mov    %eax,%edx
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	01 c2                	add    %eax,%edx
 1e6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ea:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1ec:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f0:	3c 0a                	cmp    $0xa,%al
 1f2:	74 13                	je     207 <gets+0x66>
 1f4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f8:	3c 0d                	cmp    $0xd,%al
 1fa:	74 0b                	je     207 <gets+0x66>
  for(i=0; i+1 < max; ){
 1fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ff:	83 c0 01             	add    $0x1,%eax
 202:	3b 45 0c             	cmp    0xc(%ebp),%eax
 205:	7c a9                	jl     1b0 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 207:	8b 55 f4             	mov    -0xc(%ebp),%edx
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	01 d0                	add    %edx,%eax
 20f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 212:	8b 45 08             	mov    0x8(%ebp),%eax
}
 215:	c9                   	leave  
 216:	c3                   	ret    

00000217 <stat>:

int
stat(const char *n, struct stat *st)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 21d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 224:	00 
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	89 04 24             	mov    %eax,(%esp)
 22b:	e8 20 01 00 00       	call   350 <open>
 230:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 233:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 237:	79 07                	jns    240 <stat+0x29>
    return -1;
 239:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23e:	eb 23                	jmp    263 <stat+0x4c>
  r = fstat(fd, st);
 240:	8b 45 0c             	mov    0xc(%ebp),%eax
 243:	89 44 24 04          	mov    %eax,0x4(%esp)
 247:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24a:	89 04 24             	mov    %eax,(%esp)
 24d:	e8 16 01 00 00       	call   368 <fstat>
 252:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 255:	8b 45 f4             	mov    -0xc(%ebp),%eax
 258:	89 04 24             	mov    %eax,(%esp)
 25b:	e8 d8 00 00 00       	call   338 <close>
  return r;
 260:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 263:	c9                   	leave  
 264:	c3                   	ret    

00000265 <atoi>:

int
atoi(const char *s)
{
 265:	55                   	push   %ebp
 266:	89 e5                	mov    %esp,%ebp
 268:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 26b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 272:	eb 25                	jmp    299 <atoi+0x34>
    n = n*10 + *s++ - '0';
 274:	8b 55 fc             	mov    -0x4(%ebp),%edx
 277:	89 d0                	mov    %edx,%eax
 279:	c1 e0 02             	shl    $0x2,%eax
 27c:	01 d0                	add    %edx,%eax
 27e:	01 c0                	add    %eax,%eax
 280:	89 c1                	mov    %eax,%ecx
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 08             	mov    %edx,0x8(%ebp)
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	0f be c0             	movsbl %al,%eax
 291:	01 c8                	add    %ecx,%eax
 293:	83 e8 30             	sub    $0x30,%eax
 296:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 299:	8b 45 08             	mov    0x8(%ebp),%eax
 29c:	0f b6 00             	movzbl (%eax),%eax
 29f:	3c 2f                	cmp    $0x2f,%al
 2a1:	7e 0a                	jle    2ad <atoi+0x48>
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	0f b6 00             	movzbl (%eax),%eax
 2a9:	3c 39                	cmp    $0x39,%al
 2ab:	7e c7                	jle    274 <atoi+0xf>
  return n;
 2ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2b0:	c9                   	leave  
 2b1:	c3                   	ret    

000002b2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2b2:	55                   	push   %ebp
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 2bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2c4:	eb 17                	jmp    2dd <memmove+0x2b>
    *dst++ = *src++;
 2c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2c9:	8d 50 01             	lea    0x1(%eax),%edx
 2cc:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2cf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2d2:	8d 4a 01             	lea    0x1(%edx),%ecx
 2d5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2d8:	0f b6 12             	movzbl (%edx),%edx
 2db:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2dd:	8b 45 10             	mov    0x10(%ebp),%eax
 2e0:	8d 50 ff             	lea    -0x1(%eax),%edx
 2e3:	89 55 10             	mov    %edx,0x10(%ebp)
 2e6:	85 c0                	test   %eax,%eax
 2e8:	7f dc                	jg     2c6 <memmove+0x14>
  return vdst;
 2ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ed:	c9                   	leave  
 2ee:	c3                   	ret    

000002ef <ps>:


// ** wrapper funcion for print sat table **//
void ps() {
 2ef:	55                   	push   %ebp
 2f0:	89 e5                	mov    %esp,%ebp
 2f2:	81 ec 18 09 00 00    	sub    $0x918,%esp
  pstatTable p;
  getpinfo(&p);
 2f8:	8d 85 f8 f6 ff ff    	lea    -0x908(%ebp),%eax
 2fe:	89 04 24             	mov    %eax,(%esp)
 301:	e8 aa 00 00 00       	call   3b0 <getpinfo>
 306:	c9                   	leave  
 307:	c3                   	ret    

00000308 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 308:	b8 01 00 00 00       	mov    $0x1,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <exit>:
SYSCALL(exit)
 310:	b8 02 00 00 00       	mov    $0x2,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <wait>:
SYSCALL(wait)
 318:	b8 03 00 00 00       	mov    $0x3,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <pipe>:
SYSCALL(pipe)
 320:	b8 04 00 00 00       	mov    $0x4,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <read>:
SYSCALL(read)
 328:	b8 05 00 00 00       	mov    $0x5,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <write>:
SYSCALL(write)
 330:	b8 10 00 00 00       	mov    $0x10,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <close>:
SYSCALL(close)
 338:	b8 15 00 00 00       	mov    $0x15,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <kill>:
SYSCALL(kill)
 340:	b8 06 00 00 00       	mov    $0x6,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <exec>:
SYSCALL(exec)
 348:	b8 07 00 00 00       	mov    $0x7,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <open>:
SYSCALL(open)
 350:	b8 0f 00 00 00       	mov    $0xf,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <mknod>:
SYSCALL(mknod)
 358:	b8 11 00 00 00       	mov    $0x11,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <unlink>:
SYSCALL(unlink)
 360:	b8 12 00 00 00       	mov    $0x12,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <fstat>:
SYSCALL(fstat)
 368:	b8 08 00 00 00       	mov    $0x8,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <link>:
SYSCALL(link)
 370:	b8 13 00 00 00       	mov    $0x13,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <mkdir>:
SYSCALL(mkdir)
 378:	b8 14 00 00 00       	mov    $0x14,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <chdir>:
SYSCALL(chdir)
 380:	b8 09 00 00 00       	mov    $0x9,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <dup>:
SYSCALL(dup)
 388:	b8 0a 00 00 00       	mov    $0xa,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <getpid>:
SYSCALL(getpid)
 390:	b8 0b 00 00 00       	mov    $0xb,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <sbrk>:
SYSCALL(sbrk)
 398:	b8 0c 00 00 00       	mov    $0xc,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <sleep>:
SYSCALL(sleep)
 3a0:	b8 0d 00 00 00       	mov    $0xd,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <uptime>:
SYSCALL(uptime)
 3a8:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <getpinfo>:
SYSCALL(getpinfo)
 3b0:	b8 16 00 00 00       	mov    $0x16,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <settickets>:
SYSCALL(settickets)
 3b8:	b8 17 00 00 00       	mov    $0x17,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	83 ec 18             	sub    $0x18,%esp
 3c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3cc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3d3:	00 
 3d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 3db:	8b 45 08             	mov    0x8(%ebp),%eax
 3de:	89 04 24             	mov    %eax,(%esp)
 3e1:	e8 4a ff ff ff       	call   330 <write>
}
 3e6:	c9                   	leave  
 3e7:	c3                   	ret    

000003e8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3e8:	55                   	push   %ebp
 3e9:	89 e5                	mov    %esp,%ebp
 3eb:	56                   	push   %esi
 3ec:	53                   	push   %ebx
 3ed:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3f0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3f7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3fb:	74 17                	je     414 <printint+0x2c>
 3fd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 401:	79 11                	jns    414 <printint+0x2c>
    neg = 1;
 403:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 40a:	8b 45 0c             	mov    0xc(%ebp),%eax
 40d:	f7 d8                	neg    %eax
 40f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 412:	eb 06                	jmp    41a <printint+0x32>
  } else {
    x = xx;
 414:	8b 45 0c             	mov    0xc(%ebp),%eax
 417:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 41a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 421:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 424:	8d 41 01             	lea    0x1(%ecx),%eax
 427:	89 45 f4             	mov    %eax,-0xc(%ebp)
 42a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 42d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 430:	ba 00 00 00 00       	mov    $0x0,%edx
 435:	f7 f3                	div    %ebx
 437:	89 d0                	mov    %edx,%eax
 439:	0f b6 80 04 0b 00 00 	movzbl 0xb04(%eax),%eax
 440:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 444:	8b 75 10             	mov    0x10(%ebp),%esi
 447:	8b 45 ec             	mov    -0x14(%ebp),%eax
 44a:	ba 00 00 00 00       	mov    $0x0,%edx
 44f:	f7 f6                	div    %esi
 451:	89 45 ec             	mov    %eax,-0x14(%ebp)
 454:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 458:	75 c7                	jne    421 <printint+0x39>
  if(neg)
 45a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 45e:	74 10                	je     470 <printint+0x88>
    buf[i++] = '-';
 460:	8b 45 f4             	mov    -0xc(%ebp),%eax
 463:	8d 50 01             	lea    0x1(%eax),%edx
 466:	89 55 f4             	mov    %edx,-0xc(%ebp)
 469:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 46e:	eb 1f                	jmp    48f <printint+0xa7>
 470:	eb 1d                	jmp    48f <printint+0xa7>
    putc(fd, buf[i]);
 472:	8d 55 dc             	lea    -0x24(%ebp),%edx
 475:	8b 45 f4             	mov    -0xc(%ebp),%eax
 478:	01 d0                	add    %edx,%eax
 47a:	0f b6 00             	movzbl (%eax),%eax
 47d:	0f be c0             	movsbl %al,%eax
 480:	89 44 24 04          	mov    %eax,0x4(%esp)
 484:	8b 45 08             	mov    0x8(%ebp),%eax
 487:	89 04 24             	mov    %eax,(%esp)
 48a:	e8 31 ff ff ff       	call   3c0 <putc>
  while(--i >= 0)
 48f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 493:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 497:	79 d9                	jns    472 <printint+0x8a>
}
 499:	83 c4 30             	add    $0x30,%esp
 49c:	5b                   	pop    %ebx
 49d:	5e                   	pop    %esi
 49e:	5d                   	pop    %ebp
 49f:	c3                   	ret    

000004a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4a6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4ad:	8d 45 0c             	lea    0xc(%ebp),%eax
 4b0:	83 c0 04             	add    $0x4,%eax
 4b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4b6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4bd:	e9 7c 01 00 00       	jmp    63e <printf+0x19e>
    c = fmt[i] & 0xff;
 4c2:	8b 55 0c             	mov    0xc(%ebp),%edx
 4c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4c8:	01 d0                	add    %edx,%eax
 4ca:	0f b6 00             	movzbl (%eax),%eax
 4cd:	0f be c0             	movsbl %al,%eax
 4d0:	25 ff 00 00 00       	and    $0xff,%eax
 4d5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4d8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4dc:	75 2c                	jne    50a <printf+0x6a>
      if(c == '%'){
 4de:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4e2:	75 0c                	jne    4f0 <printf+0x50>
        state = '%';
 4e4:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4eb:	e9 4a 01 00 00       	jmp    63a <printf+0x19a>
      } else {
        putc(fd, c);
 4f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4f3:	0f be c0             	movsbl %al,%eax
 4f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fa:	8b 45 08             	mov    0x8(%ebp),%eax
 4fd:	89 04 24             	mov    %eax,(%esp)
 500:	e8 bb fe ff ff       	call   3c0 <putc>
 505:	e9 30 01 00 00       	jmp    63a <printf+0x19a>
      }
    } else if(state == '%'){
 50a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 50e:	0f 85 26 01 00 00    	jne    63a <printf+0x19a>
      if(c == 'd'){
 514:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 518:	75 2d                	jne    547 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 51a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 51d:	8b 00                	mov    (%eax),%eax
 51f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 526:	00 
 527:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 52e:	00 
 52f:	89 44 24 04          	mov    %eax,0x4(%esp)
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	89 04 24             	mov    %eax,(%esp)
 539:	e8 aa fe ff ff       	call   3e8 <printint>
        ap++;
 53e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 542:	e9 ec 00 00 00       	jmp    633 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 547:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 54b:	74 06                	je     553 <printf+0xb3>
 54d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 551:	75 2d                	jne    580 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 553:	8b 45 e8             	mov    -0x18(%ebp),%eax
 556:	8b 00                	mov    (%eax),%eax
 558:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 55f:	00 
 560:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 567:	00 
 568:	89 44 24 04          	mov    %eax,0x4(%esp)
 56c:	8b 45 08             	mov    0x8(%ebp),%eax
 56f:	89 04 24             	mov    %eax,(%esp)
 572:	e8 71 fe ff ff       	call   3e8 <printint>
        ap++;
 577:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 57b:	e9 b3 00 00 00       	jmp    633 <printf+0x193>
      } else if(c == 's'){
 580:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 584:	75 45                	jne    5cb <printf+0x12b>
        s = (char*)*ap;
 586:	8b 45 e8             	mov    -0x18(%ebp),%eax
 589:	8b 00                	mov    (%eax),%eax
 58b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 58e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 592:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 596:	75 09                	jne    5a1 <printf+0x101>
          s = "(null)";
 598:	c7 45 f4 99 08 00 00 	movl   $0x899,-0xc(%ebp)
        while(*s != 0){
 59f:	eb 1e                	jmp    5bf <printf+0x11f>
 5a1:	eb 1c                	jmp    5bf <printf+0x11f>
          putc(fd, *s);
 5a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a6:	0f b6 00             	movzbl (%eax),%eax
 5a9:	0f be c0             	movsbl %al,%eax
 5ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b0:	8b 45 08             	mov    0x8(%ebp),%eax
 5b3:	89 04 24             	mov    %eax,(%esp)
 5b6:	e8 05 fe ff ff       	call   3c0 <putc>
          s++;
 5bb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 5bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c2:	0f b6 00             	movzbl (%eax),%eax
 5c5:	84 c0                	test   %al,%al
 5c7:	75 da                	jne    5a3 <printf+0x103>
 5c9:	eb 68                	jmp    633 <printf+0x193>
        }
      } else if(c == 'c'){
 5cb:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5cf:	75 1d                	jne    5ee <printf+0x14e>
        putc(fd, *ap);
 5d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d4:	8b 00                	mov    (%eax),%eax
 5d6:	0f be c0             	movsbl %al,%eax
 5d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5dd:	8b 45 08             	mov    0x8(%ebp),%eax
 5e0:	89 04 24             	mov    %eax,(%esp)
 5e3:	e8 d8 fd ff ff       	call   3c0 <putc>
        ap++;
 5e8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ec:	eb 45                	jmp    633 <printf+0x193>
      } else if(c == '%'){
 5ee:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5f2:	75 17                	jne    60b <printf+0x16b>
        putc(fd, c);
 5f4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f7:	0f be c0             	movsbl %al,%eax
 5fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fe:	8b 45 08             	mov    0x8(%ebp),%eax
 601:	89 04 24             	mov    %eax,(%esp)
 604:	e8 b7 fd ff ff       	call   3c0 <putc>
 609:	eb 28                	jmp    633 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 60b:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 612:	00 
 613:	8b 45 08             	mov    0x8(%ebp),%eax
 616:	89 04 24             	mov    %eax,(%esp)
 619:	e8 a2 fd ff ff       	call   3c0 <putc>
        putc(fd, c);
 61e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 621:	0f be c0             	movsbl %al,%eax
 624:	89 44 24 04          	mov    %eax,0x4(%esp)
 628:	8b 45 08             	mov    0x8(%ebp),%eax
 62b:	89 04 24             	mov    %eax,(%esp)
 62e:	e8 8d fd ff ff       	call   3c0 <putc>
      }
      state = 0;
 633:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 63a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 63e:	8b 55 0c             	mov    0xc(%ebp),%edx
 641:	8b 45 f0             	mov    -0x10(%ebp),%eax
 644:	01 d0                	add    %edx,%eax
 646:	0f b6 00             	movzbl (%eax),%eax
 649:	84 c0                	test   %al,%al
 64b:	0f 85 71 fe ff ff    	jne    4c2 <printf+0x22>
    }
  }
}
 651:	c9                   	leave  
 652:	c3                   	ret    

00000653 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 653:	55                   	push   %ebp
 654:	89 e5                	mov    %esp,%ebp
 656:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 659:	8b 45 08             	mov    0x8(%ebp),%eax
 65c:	83 e8 08             	sub    $0x8,%eax
 65f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 662:	a1 20 0b 00 00       	mov    0xb20,%eax
 667:	89 45 fc             	mov    %eax,-0x4(%ebp)
 66a:	eb 24                	jmp    690 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 66c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66f:	8b 00                	mov    (%eax),%eax
 671:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 674:	77 12                	ja     688 <free+0x35>
 676:	8b 45 f8             	mov    -0x8(%ebp),%eax
 679:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 67c:	77 24                	ja     6a2 <free+0x4f>
 67e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 681:	8b 00                	mov    (%eax),%eax
 683:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 686:	77 1a                	ja     6a2 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 688:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68b:	8b 00                	mov    (%eax),%eax
 68d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 690:	8b 45 f8             	mov    -0x8(%ebp),%eax
 693:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 696:	76 d4                	jbe    66c <free+0x19>
 698:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69b:	8b 00                	mov    (%eax),%eax
 69d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6a0:	76 ca                	jbe    66c <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a5:	8b 40 04             	mov    0x4(%eax),%eax
 6a8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b2:	01 c2                	add    %eax,%edx
 6b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b7:	8b 00                	mov    (%eax),%eax
 6b9:	39 c2                	cmp    %eax,%edx
 6bb:	75 24                	jne    6e1 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c0:	8b 50 04             	mov    0x4(%eax),%edx
 6c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c6:	8b 00                	mov    (%eax),%eax
 6c8:	8b 40 04             	mov    0x4(%eax),%eax
 6cb:	01 c2                	add    %eax,%edx
 6cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d0:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d6:	8b 00                	mov    (%eax),%eax
 6d8:	8b 10                	mov    (%eax),%edx
 6da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6dd:	89 10                	mov    %edx,(%eax)
 6df:	eb 0a                	jmp    6eb <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e4:	8b 10                	mov    (%eax),%edx
 6e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e9:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ee:	8b 40 04             	mov    0x4(%eax),%eax
 6f1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fb:	01 d0                	add    %edx,%eax
 6fd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 700:	75 20                	jne    722 <free+0xcf>
    p->s.size += bp->s.size;
 702:	8b 45 fc             	mov    -0x4(%ebp),%eax
 705:	8b 50 04             	mov    0x4(%eax),%edx
 708:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70b:	8b 40 04             	mov    0x4(%eax),%eax
 70e:	01 c2                	add    %eax,%edx
 710:	8b 45 fc             	mov    -0x4(%ebp),%eax
 713:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 716:	8b 45 f8             	mov    -0x8(%ebp),%eax
 719:	8b 10                	mov    (%eax),%edx
 71b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71e:	89 10                	mov    %edx,(%eax)
 720:	eb 08                	jmp    72a <free+0xd7>
  } else
    p->s.ptr = bp;
 722:	8b 45 fc             	mov    -0x4(%ebp),%eax
 725:	8b 55 f8             	mov    -0x8(%ebp),%edx
 728:	89 10                	mov    %edx,(%eax)
  freep = p;
 72a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72d:	a3 20 0b 00 00       	mov    %eax,0xb20
}
 732:	c9                   	leave  
 733:	c3                   	ret    

00000734 <morecore>:

static Header*
morecore(uint nu)
{
 734:	55                   	push   %ebp
 735:	89 e5                	mov    %esp,%ebp
 737:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 73a:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 741:	77 07                	ja     74a <morecore+0x16>
    nu = 4096;
 743:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 74a:	8b 45 08             	mov    0x8(%ebp),%eax
 74d:	c1 e0 03             	shl    $0x3,%eax
 750:	89 04 24             	mov    %eax,(%esp)
 753:	e8 40 fc ff ff       	call   398 <sbrk>
 758:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 75b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 75f:	75 07                	jne    768 <morecore+0x34>
    return 0;
 761:	b8 00 00 00 00       	mov    $0x0,%eax
 766:	eb 22                	jmp    78a <morecore+0x56>
  hp = (Header*)p;
 768:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 76e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 771:	8b 55 08             	mov    0x8(%ebp),%edx
 774:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 777:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77a:	83 c0 08             	add    $0x8,%eax
 77d:	89 04 24             	mov    %eax,(%esp)
 780:	e8 ce fe ff ff       	call   653 <free>
  return freep;
 785:	a1 20 0b 00 00       	mov    0xb20,%eax
}
 78a:	c9                   	leave  
 78b:	c3                   	ret    

0000078c <malloc>:

void*
malloc(uint nbytes)
{
 78c:	55                   	push   %ebp
 78d:	89 e5                	mov    %esp,%ebp
 78f:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 792:	8b 45 08             	mov    0x8(%ebp),%eax
 795:	83 c0 07             	add    $0x7,%eax
 798:	c1 e8 03             	shr    $0x3,%eax
 79b:	83 c0 01             	add    $0x1,%eax
 79e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7a1:	a1 20 0b 00 00       	mov    0xb20,%eax
 7a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7a9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7ad:	75 23                	jne    7d2 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7af:	c7 45 f0 18 0b 00 00 	movl   $0xb18,-0x10(%ebp)
 7b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b9:	a3 20 0b 00 00       	mov    %eax,0xb20
 7be:	a1 20 0b 00 00       	mov    0xb20,%eax
 7c3:	a3 18 0b 00 00       	mov    %eax,0xb18
    base.s.size = 0;
 7c8:	c7 05 1c 0b 00 00 00 	movl   $0x0,0xb1c
 7cf:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d5:	8b 00                	mov    (%eax),%eax
 7d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7dd:	8b 40 04             	mov    0x4(%eax),%eax
 7e0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7e3:	72 4d                	jb     832 <malloc+0xa6>
      if(p->s.size == nunits)
 7e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e8:	8b 40 04             	mov    0x4(%eax),%eax
 7eb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7ee:	75 0c                	jne    7fc <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f3:	8b 10                	mov    (%eax),%edx
 7f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f8:	89 10                	mov    %edx,(%eax)
 7fa:	eb 26                	jmp    822 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ff:	8b 40 04             	mov    0x4(%eax),%eax
 802:	2b 45 ec             	sub    -0x14(%ebp),%eax
 805:	89 c2                	mov    %eax,%edx
 807:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 80d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 810:	8b 40 04             	mov    0x4(%eax),%eax
 813:	c1 e0 03             	shl    $0x3,%eax
 816:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 819:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81c:	8b 55 ec             	mov    -0x14(%ebp),%edx
 81f:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 822:	8b 45 f0             	mov    -0x10(%ebp),%eax
 825:	a3 20 0b 00 00       	mov    %eax,0xb20
      return (void*)(p + 1);
 82a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82d:	83 c0 08             	add    $0x8,%eax
 830:	eb 38                	jmp    86a <malloc+0xde>
    }
    if(p == freep)
 832:	a1 20 0b 00 00       	mov    0xb20,%eax
 837:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 83a:	75 1b                	jne    857 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 83c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 83f:	89 04 24             	mov    %eax,(%esp)
 842:	e8 ed fe ff ff       	call   734 <morecore>
 847:	89 45 f4             	mov    %eax,-0xc(%ebp)
 84a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 84e:	75 07                	jne    857 <malloc+0xcb>
        return 0;
 850:	b8 00 00 00 00       	mov    $0x0,%eax
 855:	eb 13                	jmp    86a <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 857:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 85d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 860:	8b 00                	mov    (%eax),%eax
 862:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 865:	e9 70 ff ff ff       	jmp    7da <malloc+0x4e>
}
 86a:	c9                   	leave  
 86b:	c3                   	ret    
