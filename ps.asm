
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"


int
main(int argc, char * argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
        ps();
   6:	e8 65 02 00 00       	call   270 <ps>
        // printf(1, "test: %d\n", 1);
        exit();
   b:	e8 81 02 00 00       	call   291 <exit>

00000010 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	57                   	push   %edi
  14:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  15:	8b 4d 08             	mov    0x8(%ebp),%ecx
  18:	8b 55 10             	mov    0x10(%ebp),%edx
  1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  1e:	89 cb                	mov    %ecx,%ebx
  20:	89 df                	mov    %ebx,%edi
  22:	89 d1                	mov    %edx,%ecx
  24:	fc                   	cld    
  25:	f3 aa                	rep stos %al,%es:(%edi)
  27:	89 ca                	mov    %ecx,%edx
  29:	89 fb                	mov    %edi,%ebx
  2b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  2e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  31:	5b                   	pop    %ebx
  32:	5f                   	pop    %edi
  33:	5d                   	pop    %ebp
  34:	c3                   	ret    

00000035 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  35:	55                   	push   %ebp
  36:	89 e5                	mov    %esp,%ebp
  38:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  3b:	8b 45 08             	mov    0x8(%ebp),%eax
  3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  41:	90                   	nop
  42:	8b 45 08             	mov    0x8(%ebp),%eax
  45:	8d 50 01             	lea    0x1(%eax),%edx
  48:	89 55 08             	mov    %edx,0x8(%ebp)
  4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  4e:	8d 4a 01             	lea    0x1(%edx),%ecx
  51:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  54:	0f b6 12             	movzbl (%edx),%edx
  57:	88 10                	mov    %dl,(%eax)
  59:	0f b6 00             	movzbl (%eax),%eax
  5c:	84 c0                	test   %al,%al
  5e:	75 e2                	jne    42 <strcpy+0xd>
    ;
  return os;
  60:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  63:	c9                   	leave  
  64:	c3                   	ret    

00000065 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  68:	eb 08                	jmp    72 <strcmp+0xd>
    p++, q++;
  6a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  6e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  72:	8b 45 08             	mov    0x8(%ebp),%eax
  75:	0f b6 00             	movzbl (%eax),%eax
  78:	84 c0                	test   %al,%al
  7a:	74 10                	je     8c <strcmp+0x27>
  7c:	8b 45 08             	mov    0x8(%ebp),%eax
  7f:	0f b6 10             	movzbl (%eax),%edx
  82:	8b 45 0c             	mov    0xc(%ebp),%eax
  85:	0f b6 00             	movzbl (%eax),%eax
  88:	38 c2                	cmp    %al,%dl
  8a:	74 de                	je     6a <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  8c:	8b 45 08             	mov    0x8(%ebp),%eax
  8f:	0f b6 00             	movzbl (%eax),%eax
  92:	0f b6 d0             	movzbl %al,%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 00             	movzbl (%eax),%eax
  9b:	0f b6 c0             	movzbl %al,%eax
  9e:	29 c2                	sub    %eax,%edx
  a0:	89 d0                	mov    %edx,%eax
}
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    

000000a4 <strlen>:

uint
strlen(const char *s)
{
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  b1:	eb 04                	jmp    b7 <strlen+0x13>
  b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	01 d0                	add    %edx,%eax
  bf:	0f b6 00             	movzbl (%eax),%eax
  c2:	84 c0                	test   %al,%al
  c4:	75 ed                	jne    b3 <strlen+0xf>
    ;
  return n;
  c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c9:	c9                   	leave  
  ca:	c3                   	ret    

000000cb <memset>:

void*
memset(void *dst, int c, uint n)
{
  cb:	55                   	push   %ebp
  cc:	89 e5                	mov    %esp,%ebp
  ce:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  d1:	8b 45 10             	mov    0x10(%ebp),%eax
  d4:	89 44 24 08          	mov    %eax,0x8(%esp)
  d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  db:	89 44 24 04          	mov    %eax,0x4(%esp)
  df:	8b 45 08             	mov    0x8(%ebp),%eax
  e2:	89 04 24             	mov    %eax,(%esp)
  e5:	e8 26 ff ff ff       	call   10 <stosb>
  return dst;
  ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
  ed:	c9                   	leave  
  ee:	c3                   	ret    

000000ef <strchr>:

char*
strchr(const char *s, char c)
{
  ef:	55                   	push   %ebp
  f0:	89 e5                	mov    %esp,%ebp
  f2:	83 ec 04             	sub    $0x4,%esp
  f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  f8:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
  fb:	eb 14                	jmp    111 <strchr+0x22>
    if(*s == c)
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
 100:	0f b6 00             	movzbl (%eax),%eax
 103:	3a 45 fc             	cmp    -0x4(%ebp),%al
 106:	75 05                	jne    10d <strchr+0x1e>
      return (char*)s;
 108:	8b 45 08             	mov    0x8(%ebp),%eax
 10b:	eb 13                	jmp    120 <strchr+0x31>
  for(; *s; s++)
 10d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	0f b6 00             	movzbl (%eax),%eax
 117:	84 c0                	test   %al,%al
 119:	75 e2                	jne    fd <strchr+0xe>
  return 0;
 11b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 120:	c9                   	leave  
 121:	c3                   	ret    

00000122 <gets>:

char*
gets(char *buf, int max)
{
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 128:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 12f:	eb 4c                	jmp    17d <gets+0x5b>
    cc = read(0, &c, 1);
 131:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 138:	00 
 139:	8d 45 ef             	lea    -0x11(%ebp),%eax
 13c:	89 44 24 04          	mov    %eax,0x4(%esp)
 140:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 147:	e8 5d 01 00 00       	call   2a9 <read>
 14c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 14f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 153:	7f 02                	jg     157 <gets+0x35>
      break;
 155:	eb 31                	jmp    188 <gets+0x66>
    buf[i++] = c;
 157:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15a:	8d 50 01             	lea    0x1(%eax),%edx
 15d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 160:	89 c2                	mov    %eax,%edx
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	01 c2                	add    %eax,%edx
 167:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 16b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 16d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 171:	3c 0a                	cmp    $0xa,%al
 173:	74 13                	je     188 <gets+0x66>
 175:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 179:	3c 0d                	cmp    $0xd,%al
 17b:	74 0b                	je     188 <gets+0x66>
  for(i=0; i+1 < max; ){
 17d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 180:	83 c0 01             	add    $0x1,%eax
 183:	3b 45 0c             	cmp    0xc(%ebp),%eax
 186:	7c a9                	jl     131 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 188:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	01 d0                	add    %edx,%eax
 190:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 193:	8b 45 08             	mov    0x8(%ebp),%eax
}
 196:	c9                   	leave  
 197:	c3                   	ret    

00000198 <stat>:

int
stat(const char *n, struct stat *st)
{
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 19e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1a5:	00 
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 1a9:	89 04 24             	mov    %eax,(%esp)
 1ac:	e8 20 01 00 00       	call   2d1 <open>
 1b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b8:	79 07                	jns    1c1 <stat+0x29>
    return -1;
 1ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1bf:	eb 23                	jmp    1e4 <stat+0x4c>
  r = fstat(fd, st);
 1c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1cb:	89 04 24             	mov    %eax,(%esp)
 1ce:	e8 16 01 00 00       	call   2e9 <fstat>
 1d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	89 04 24             	mov    %eax,(%esp)
 1dc:	e8 d8 00 00 00       	call   2b9 <close>
  return r;
 1e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    

000001e6 <atoi>:

int
atoi(const char *s)
{
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1f3:	eb 25                	jmp    21a <atoi+0x34>
    n = n*10 + *s++ - '0';
 1f5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1f8:	89 d0                	mov    %edx,%eax
 1fa:	c1 e0 02             	shl    $0x2,%eax
 1fd:	01 d0                	add    %edx,%eax
 1ff:	01 c0                	add    %eax,%eax
 201:	89 c1                	mov    %eax,%ecx
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	8d 50 01             	lea    0x1(%eax),%edx
 209:	89 55 08             	mov    %edx,0x8(%ebp)
 20c:	0f b6 00             	movzbl (%eax),%eax
 20f:	0f be c0             	movsbl %al,%eax
 212:	01 c8                	add    %ecx,%eax
 214:	83 e8 30             	sub    $0x30,%eax
 217:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
 21d:	0f b6 00             	movzbl (%eax),%eax
 220:	3c 2f                	cmp    $0x2f,%al
 222:	7e 0a                	jle    22e <atoi+0x48>
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	0f b6 00             	movzbl (%eax),%eax
 22a:	3c 39                	cmp    $0x39,%al
 22c:	7e c7                	jle    1f5 <atoi+0xf>
  return n;
 22e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 231:	c9                   	leave  
 232:	c3                   	ret    

00000233 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 239:	8b 45 08             	mov    0x8(%ebp),%eax
 23c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 23f:	8b 45 0c             	mov    0xc(%ebp),%eax
 242:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 245:	eb 17                	jmp    25e <memmove+0x2b>
    *dst++ = *src++;
 247:	8b 45 fc             	mov    -0x4(%ebp),%eax
 24a:	8d 50 01             	lea    0x1(%eax),%edx
 24d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 250:	8b 55 f8             	mov    -0x8(%ebp),%edx
 253:	8d 4a 01             	lea    0x1(%edx),%ecx
 256:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 259:	0f b6 12             	movzbl (%edx),%edx
 25c:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 25e:	8b 45 10             	mov    0x10(%ebp),%eax
 261:	8d 50 ff             	lea    -0x1(%eax),%edx
 264:	89 55 10             	mov    %edx,0x10(%ebp)
 267:	85 c0                	test   %eax,%eax
 269:	7f dc                	jg     247 <memmove+0x14>
  return vdst;
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 26e:	c9                   	leave  
 26f:	c3                   	ret    

00000270 <ps>:


// ** wrapper funcion for print sat table **//
void ps() {
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	81 ec 18 09 00 00    	sub    $0x918,%esp
  pstatTable p;
  getpinfo(&p);
 279:	8d 85 f8 f6 ff ff    	lea    -0x908(%ebp),%eax
 27f:	89 04 24             	mov    %eax,(%esp)
 282:	e8 aa 00 00 00       	call   331 <getpinfo>
 287:	c9                   	leave  
 288:	c3                   	ret    

00000289 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 289:	b8 01 00 00 00       	mov    $0x1,%eax
 28e:	cd 40                	int    $0x40
 290:	c3                   	ret    

00000291 <exit>:
SYSCALL(exit)
 291:	b8 02 00 00 00       	mov    $0x2,%eax
 296:	cd 40                	int    $0x40
 298:	c3                   	ret    

00000299 <wait>:
SYSCALL(wait)
 299:	b8 03 00 00 00       	mov    $0x3,%eax
 29e:	cd 40                	int    $0x40
 2a0:	c3                   	ret    

000002a1 <pipe>:
SYSCALL(pipe)
 2a1:	b8 04 00 00 00       	mov    $0x4,%eax
 2a6:	cd 40                	int    $0x40
 2a8:	c3                   	ret    

000002a9 <read>:
SYSCALL(read)
 2a9:	b8 05 00 00 00       	mov    $0x5,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    

000002b1 <write>:
SYSCALL(write)
 2b1:	b8 10 00 00 00       	mov    $0x10,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret    

000002b9 <close>:
SYSCALL(close)
 2b9:	b8 15 00 00 00       	mov    $0x15,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <kill>:
SYSCALL(kill)
 2c1:	b8 06 00 00 00       	mov    $0x6,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <exec>:
SYSCALL(exec)
 2c9:	b8 07 00 00 00       	mov    $0x7,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <open>:
SYSCALL(open)
 2d1:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <mknod>:
SYSCALL(mknod)
 2d9:	b8 11 00 00 00       	mov    $0x11,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <unlink>:
SYSCALL(unlink)
 2e1:	b8 12 00 00 00       	mov    $0x12,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <fstat>:
SYSCALL(fstat)
 2e9:	b8 08 00 00 00       	mov    $0x8,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <link>:
SYSCALL(link)
 2f1:	b8 13 00 00 00       	mov    $0x13,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <mkdir>:
SYSCALL(mkdir)
 2f9:	b8 14 00 00 00       	mov    $0x14,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <chdir>:
SYSCALL(chdir)
 301:	b8 09 00 00 00       	mov    $0x9,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <dup>:
SYSCALL(dup)
 309:	b8 0a 00 00 00       	mov    $0xa,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <getpid>:
SYSCALL(getpid)
 311:	b8 0b 00 00 00       	mov    $0xb,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <sbrk>:
SYSCALL(sbrk)
 319:	b8 0c 00 00 00       	mov    $0xc,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <sleep>:
SYSCALL(sleep)
 321:	b8 0d 00 00 00       	mov    $0xd,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <uptime>:
SYSCALL(uptime)
 329:	b8 0e 00 00 00       	mov    $0xe,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <getpinfo>:
SYSCALL(getpinfo)
 331:	b8 16 00 00 00       	mov    $0x16,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <settickets>:
SYSCALL(settickets)
 339:	b8 17 00 00 00       	mov    $0x17,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 341:	55                   	push   %ebp
 342:	89 e5                	mov    %esp,%ebp
 344:	83 ec 18             	sub    $0x18,%esp
 347:	8b 45 0c             	mov    0xc(%ebp),%eax
 34a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 34d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 354:	00 
 355:	8d 45 f4             	lea    -0xc(%ebp),%eax
 358:	89 44 24 04          	mov    %eax,0x4(%esp)
 35c:	8b 45 08             	mov    0x8(%ebp),%eax
 35f:	89 04 24             	mov    %eax,(%esp)
 362:	e8 4a ff ff ff       	call   2b1 <write>
}
 367:	c9                   	leave  
 368:	c3                   	ret    

00000369 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 369:	55                   	push   %ebp
 36a:	89 e5                	mov    %esp,%ebp
 36c:	56                   	push   %esi
 36d:	53                   	push   %ebx
 36e:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 371:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 378:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 37c:	74 17                	je     395 <printint+0x2c>
 37e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 382:	79 11                	jns    395 <printint+0x2c>
    neg = 1;
 384:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 38b:	8b 45 0c             	mov    0xc(%ebp),%eax
 38e:	f7 d8                	neg    %eax
 390:	89 45 ec             	mov    %eax,-0x14(%ebp)
 393:	eb 06                	jmp    39b <printint+0x32>
  } else {
    x = xx;
 395:	8b 45 0c             	mov    0xc(%ebp),%eax
 398:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 39b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3a2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3a5:	8d 41 01             	lea    0x1(%ecx),%eax
 3a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3ab:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3b1:	ba 00 00 00 00       	mov    $0x0,%edx
 3b6:	f7 f3                	div    %ebx
 3b8:	89 d0                	mov    %edx,%eax
 3ba:	0f b6 80 58 0a 00 00 	movzbl 0xa58(%eax),%eax
 3c1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3c5:	8b 75 10             	mov    0x10(%ebp),%esi
 3c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3cb:	ba 00 00 00 00       	mov    $0x0,%edx
 3d0:	f7 f6                	div    %esi
 3d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3d5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3d9:	75 c7                	jne    3a2 <printint+0x39>
  if(neg)
 3db:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3df:	74 10                	je     3f1 <printint+0x88>
    buf[i++] = '-';
 3e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3e4:	8d 50 01             	lea    0x1(%eax),%edx
 3e7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3ea:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3ef:	eb 1f                	jmp    410 <printint+0xa7>
 3f1:	eb 1d                	jmp    410 <printint+0xa7>
    putc(fd, buf[i]);
 3f3:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f9:	01 d0                	add    %edx,%eax
 3fb:	0f b6 00             	movzbl (%eax),%eax
 3fe:	0f be c0             	movsbl %al,%eax
 401:	89 44 24 04          	mov    %eax,0x4(%esp)
 405:	8b 45 08             	mov    0x8(%ebp),%eax
 408:	89 04 24             	mov    %eax,(%esp)
 40b:	e8 31 ff ff ff       	call   341 <putc>
  while(--i >= 0)
 410:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 414:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 418:	79 d9                	jns    3f3 <printint+0x8a>
}
 41a:	83 c4 30             	add    $0x30,%esp
 41d:	5b                   	pop    %ebx
 41e:	5e                   	pop    %esi
 41f:	5d                   	pop    %ebp
 420:	c3                   	ret    

00000421 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 421:	55                   	push   %ebp
 422:	89 e5                	mov    %esp,%ebp
 424:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 427:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 42e:	8d 45 0c             	lea    0xc(%ebp),%eax
 431:	83 c0 04             	add    $0x4,%eax
 434:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 437:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 43e:	e9 7c 01 00 00       	jmp    5bf <printf+0x19e>
    c = fmt[i] & 0xff;
 443:	8b 55 0c             	mov    0xc(%ebp),%edx
 446:	8b 45 f0             	mov    -0x10(%ebp),%eax
 449:	01 d0                	add    %edx,%eax
 44b:	0f b6 00             	movzbl (%eax),%eax
 44e:	0f be c0             	movsbl %al,%eax
 451:	25 ff 00 00 00       	and    $0xff,%eax
 456:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 459:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 45d:	75 2c                	jne    48b <printf+0x6a>
      if(c == '%'){
 45f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 463:	75 0c                	jne    471 <printf+0x50>
        state = '%';
 465:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 46c:	e9 4a 01 00 00       	jmp    5bb <printf+0x19a>
      } else {
        putc(fd, c);
 471:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 474:	0f be c0             	movsbl %al,%eax
 477:	89 44 24 04          	mov    %eax,0x4(%esp)
 47b:	8b 45 08             	mov    0x8(%ebp),%eax
 47e:	89 04 24             	mov    %eax,(%esp)
 481:	e8 bb fe ff ff       	call   341 <putc>
 486:	e9 30 01 00 00       	jmp    5bb <printf+0x19a>
      }
    } else if(state == '%'){
 48b:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 48f:	0f 85 26 01 00 00    	jne    5bb <printf+0x19a>
      if(c == 'd'){
 495:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 499:	75 2d                	jne    4c8 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 49b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 49e:	8b 00                	mov    (%eax),%eax
 4a0:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4a7:	00 
 4a8:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4af:	00 
 4b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b4:	8b 45 08             	mov    0x8(%ebp),%eax
 4b7:	89 04 24             	mov    %eax,(%esp)
 4ba:	e8 aa fe ff ff       	call   369 <printint>
        ap++;
 4bf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4c3:	e9 ec 00 00 00       	jmp    5b4 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4c8:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4cc:	74 06                	je     4d4 <printf+0xb3>
 4ce:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4d2:	75 2d                	jne    501 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4d7:	8b 00                	mov    (%eax),%eax
 4d9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4e0:	00 
 4e1:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4e8:	00 
 4e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ed:	8b 45 08             	mov    0x8(%ebp),%eax
 4f0:	89 04 24             	mov    %eax,(%esp)
 4f3:	e8 71 fe ff ff       	call   369 <printint>
        ap++;
 4f8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4fc:	e9 b3 00 00 00       	jmp    5b4 <printf+0x193>
      } else if(c == 's'){
 501:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 505:	75 45                	jne    54c <printf+0x12b>
        s = (char*)*ap;
 507:	8b 45 e8             	mov    -0x18(%ebp),%eax
 50a:	8b 00                	mov    (%eax),%eax
 50c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 50f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 513:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 517:	75 09                	jne    522 <printf+0x101>
          s = "(null)";
 519:	c7 45 f4 ed 07 00 00 	movl   $0x7ed,-0xc(%ebp)
        while(*s != 0){
 520:	eb 1e                	jmp    540 <printf+0x11f>
 522:	eb 1c                	jmp    540 <printf+0x11f>
          putc(fd, *s);
 524:	8b 45 f4             	mov    -0xc(%ebp),%eax
 527:	0f b6 00             	movzbl (%eax),%eax
 52a:	0f be c0             	movsbl %al,%eax
 52d:	89 44 24 04          	mov    %eax,0x4(%esp)
 531:	8b 45 08             	mov    0x8(%ebp),%eax
 534:	89 04 24             	mov    %eax,(%esp)
 537:	e8 05 fe ff ff       	call   341 <putc>
          s++;
 53c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 540:	8b 45 f4             	mov    -0xc(%ebp),%eax
 543:	0f b6 00             	movzbl (%eax),%eax
 546:	84 c0                	test   %al,%al
 548:	75 da                	jne    524 <printf+0x103>
 54a:	eb 68                	jmp    5b4 <printf+0x193>
        }
      } else if(c == 'c'){
 54c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 550:	75 1d                	jne    56f <printf+0x14e>
        putc(fd, *ap);
 552:	8b 45 e8             	mov    -0x18(%ebp),%eax
 555:	8b 00                	mov    (%eax),%eax
 557:	0f be c0             	movsbl %al,%eax
 55a:	89 44 24 04          	mov    %eax,0x4(%esp)
 55e:	8b 45 08             	mov    0x8(%ebp),%eax
 561:	89 04 24             	mov    %eax,(%esp)
 564:	e8 d8 fd ff ff       	call   341 <putc>
        ap++;
 569:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 56d:	eb 45                	jmp    5b4 <printf+0x193>
      } else if(c == '%'){
 56f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 573:	75 17                	jne    58c <printf+0x16b>
        putc(fd, c);
 575:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 578:	0f be c0             	movsbl %al,%eax
 57b:	89 44 24 04          	mov    %eax,0x4(%esp)
 57f:	8b 45 08             	mov    0x8(%ebp),%eax
 582:	89 04 24             	mov    %eax,(%esp)
 585:	e8 b7 fd ff ff       	call   341 <putc>
 58a:	eb 28                	jmp    5b4 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 58c:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 593:	00 
 594:	8b 45 08             	mov    0x8(%ebp),%eax
 597:	89 04 24             	mov    %eax,(%esp)
 59a:	e8 a2 fd ff ff       	call   341 <putc>
        putc(fd, c);
 59f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5a2:	0f be c0             	movsbl %al,%eax
 5a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ac:	89 04 24             	mov    %eax,(%esp)
 5af:	e8 8d fd ff ff       	call   341 <putc>
      }
      state = 0;
 5b4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 5bb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5bf:	8b 55 0c             	mov    0xc(%ebp),%edx
 5c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5c5:	01 d0                	add    %edx,%eax
 5c7:	0f b6 00             	movzbl (%eax),%eax
 5ca:	84 c0                	test   %al,%al
 5cc:	0f 85 71 fe ff ff    	jne    443 <printf+0x22>
    }
  }
}
 5d2:	c9                   	leave  
 5d3:	c3                   	ret    

000005d4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5da:	8b 45 08             	mov    0x8(%ebp),%eax
 5dd:	83 e8 08             	sub    $0x8,%eax
 5e0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e3:	a1 74 0a 00 00       	mov    0xa74,%eax
 5e8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5eb:	eb 24                	jmp    611 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f0:	8b 00                	mov    (%eax),%eax
 5f2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f5:	77 12                	ja     609 <free+0x35>
 5f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5fa:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5fd:	77 24                	ja     623 <free+0x4f>
 5ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 602:	8b 00                	mov    (%eax),%eax
 604:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 607:	77 1a                	ja     623 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 609:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60c:	8b 00                	mov    (%eax),%eax
 60e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 611:	8b 45 f8             	mov    -0x8(%ebp),%eax
 614:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 617:	76 d4                	jbe    5ed <free+0x19>
 619:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61c:	8b 00                	mov    (%eax),%eax
 61e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 621:	76 ca                	jbe    5ed <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 623:	8b 45 f8             	mov    -0x8(%ebp),%eax
 626:	8b 40 04             	mov    0x4(%eax),%eax
 629:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 630:	8b 45 f8             	mov    -0x8(%ebp),%eax
 633:	01 c2                	add    %eax,%edx
 635:	8b 45 fc             	mov    -0x4(%ebp),%eax
 638:	8b 00                	mov    (%eax),%eax
 63a:	39 c2                	cmp    %eax,%edx
 63c:	75 24                	jne    662 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 63e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 641:	8b 50 04             	mov    0x4(%eax),%edx
 644:	8b 45 fc             	mov    -0x4(%ebp),%eax
 647:	8b 00                	mov    (%eax),%eax
 649:	8b 40 04             	mov    0x4(%eax),%eax
 64c:	01 c2                	add    %eax,%edx
 64e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 651:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 654:	8b 45 fc             	mov    -0x4(%ebp),%eax
 657:	8b 00                	mov    (%eax),%eax
 659:	8b 10                	mov    (%eax),%edx
 65b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65e:	89 10                	mov    %edx,(%eax)
 660:	eb 0a                	jmp    66c <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 662:	8b 45 fc             	mov    -0x4(%ebp),%eax
 665:	8b 10                	mov    (%eax),%edx
 667:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 66c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66f:	8b 40 04             	mov    0x4(%eax),%eax
 672:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 679:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67c:	01 d0                	add    %edx,%eax
 67e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 681:	75 20                	jne    6a3 <free+0xcf>
    p->s.size += bp->s.size;
 683:	8b 45 fc             	mov    -0x4(%ebp),%eax
 686:	8b 50 04             	mov    0x4(%eax),%edx
 689:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68c:	8b 40 04             	mov    0x4(%eax),%eax
 68f:	01 c2                	add    %eax,%edx
 691:	8b 45 fc             	mov    -0x4(%ebp),%eax
 694:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 697:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69a:	8b 10                	mov    (%eax),%edx
 69c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69f:	89 10                	mov    %edx,(%eax)
 6a1:	eb 08                	jmp    6ab <free+0xd7>
  } else
    p->s.ptr = bp;
 6a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6a9:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ae:	a3 74 0a 00 00       	mov    %eax,0xa74
}
 6b3:	c9                   	leave  
 6b4:	c3                   	ret    

000006b5 <morecore>:

static Header*
morecore(uint nu)
{
 6b5:	55                   	push   %ebp
 6b6:	89 e5                	mov    %esp,%ebp
 6b8:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6bb:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6c2:	77 07                	ja     6cb <morecore+0x16>
    nu = 4096;
 6c4:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6cb:	8b 45 08             	mov    0x8(%ebp),%eax
 6ce:	c1 e0 03             	shl    $0x3,%eax
 6d1:	89 04 24             	mov    %eax,(%esp)
 6d4:	e8 40 fc ff ff       	call   319 <sbrk>
 6d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6dc:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6e0:	75 07                	jne    6e9 <morecore+0x34>
    return 0;
 6e2:	b8 00 00 00 00       	mov    $0x0,%eax
 6e7:	eb 22                	jmp    70b <morecore+0x56>
  hp = (Header*)p;
 6e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6f2:	8b 55 08             	mov    0x8(%ebp),%edx
 6f5:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6fb:	83 c0 08             	add    $0x8,%eax
 6fe:	89 04 24             	mov    %eax,(%esp)
 701:	e8 ce fe ff ff       	call   5d4 <free>
  return freep;
 706:	a1 74 0a 00 00       	mov    0xa74,%eax
}
 70b:	c9                   	leave  
 70c:	c3                   	ret    

0000070d <malloc>:

void*
malloc(uint nbytes)
{
 70d:	55                   	push   %ebp
 70e:	89 e5                	mov    %esp,%ebp
 710:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 713:	8b 45 08             	mov    0x8(%ebp),%eax
 716:	83 c0 07             	add    $0x7,%eax
 719:	c1 e8 03             	shr    $0x3,%eax
 71c:	83 c0 01             	add    $0x1,%eax
 71f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 722:	a1 74 0a 00 00       	mov    0xa74,%eax
 727:	89 45 f0             	mov    %eax,-0x10(%ebp)
 72a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 72e:	75 23                	jne    753 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 730:	c7 45 f0 6c 0a 00 00 	movl   $0xa6c,-0x10(%ebp)
 737:	8b 45 f0             	mov    -0x10(%ebp),%eax
 73a:	a3 74 0a 00 00       	mov    %eax,0xa74
 73f:	a1 74 0a 00 00       	mov    0xa74,%eax
 744:	a3 6c 0a 00 00       	mov    %eax,0xa6c
    base.s.size = 0;
 749:	c7 05 70 0a 00 00 00 	movl   $0x0,0xa70
 750:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 753:	8b 45 f0             	mov    -0x10(%ebp),%eax
 756:	8b 00                	mov    (%eax),%eax
 758:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 75b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75e:	8b 40 04             	mov    0x4(%eax),%eax
 761:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 764:	72 4d                	jb     7b3 <malloc+0xa6>
      if(p->s.size == nunits)
 766:	8b 45 f4             	mov    -0xc(%ebp),%eax
 769:	8b 40 04             	mov    0x4(%eax),%eax
 76c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 76f:	75 0c                	jne    77d <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 771:	8b 45 f4             	mov    -0xc(%ebp),%eax
 774:	8b 10                	mov    (%eax),%edx
 776:	8b 45 f0             	mov    -0x10(%ebp),%eax
 779:	89 10                	mov    %edx,(%eax)
 77b:	eb 26                	jmp    7a3 <malloc+0x96>
      else {
        p->s.size -= nunits;
 77d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 780:	8b 40 04             	mov    0x4(%eax),%eax
 783:	2b 45 ec             	sub    -0x14(%ebp),%eax
 786:	89 c2                	mov    %eax,%edx
 788:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 78e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 791:	8b 40 04             	mov    0x4(%eax),%eax
 794:	c1 e0 03             	shl    $0x3,%eax
 797:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 79a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79d:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7a0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a6:	a3 74 0a 00 00       	mov    %eax,0xa74
      return (void*)(p + 1);
 7ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ae:	83 c0 08             	add    $0x8,%eax
 7b1:	eb 38                	jmp    7eb <malloc+0xde>
    }
    if(p == freep)
 7b3:	a1 74 0a 00 00       	mov    0xa74,%eax
 7b8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7bb:	75 1b                	jne    7d8 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c0:	89 04 24             	mov    %eax,(%esp)
 7c3:	e8 ed fe ff ff       	call   6b5 <morecore>
 7c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7cf:	75 07                	jne    7d8 <malloc+0xcb>
        return 0;
 7d1:	b8 00 00 00 00       	mov    $0x0,%eax
 7d6:	eb 13                	jmp    7eb <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7db:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e1:	8b 00                	mov    (%eax),%eax
 7e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 7e6:	e9 70 ff ff ff       	jmp    75b <malloc+0x4e>
}
 7eb:	c9                   	leave  
 7ec:	c3                   	ret    
