
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   6:	eb 39                	jmp    41 <cat+0x41>
    if (write(1, buf, n) != n) {
   8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   b:	89 44 24 08          	mov    %eax,0x8(%esp)
   f:	c7 44 24 04 20 0c 00 	movl   $0xc20,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 b9 03 00 00       	call   3dc <write>
  23:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  26:	74 19                	je     41 <cat+0x41>
      printf(1, "cat: write error\n");
  28:	c7 44 24 04 18 09 00 	movl   $0x918,0x4(%esp)
  2f:	00 
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  37:	e8 10 05 00 00       	call   54c <printf>
      exit();
  3c:	e8 7b 03 00 00       	call   3bc <exit>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  41:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  48:	00 
  49:	c7 44 24 04 20 0c 00 	movl   $0xc20,0x4(%esp)
  50:	00 
  51:	8b 45 08             	mov    0x8(%ebp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 78 03 00 00       	call   3d4 <read>
  5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  63:	7f a3                	jg     8 <cat+0x8>
    }
  }
  if(n < 0){
  65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  69:	79 19                	jns    84 <cat+0x84>
    printf(1, "cat: read error\n");
  6b:	c7 44 24 04 2a 09 00 	movl   $0x92a,0x4(%esp)
  72:	00 
  73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7a:	e8 cd 04 00 00       	call   54c <printf>
    exit();
  7f:	e8 38 03 00 00       	call   3bc <exit>
  }
}
  84:	c9                   	leave  
  85:	c3                   	ret    

00000086 <main>:

int
main(int argc, char *argv[])
{
  86:	55                   	push   %ebp
  87:	89 e5                	mov    %esp,%ebp
  89:	83 e4 f0             	and    $0xfffffff0,%esp
  8c:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
  8f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  93:	7f 11                	jg     a6 <main+0x20>
    cat(0);
  95:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 16 03 00 00       	call   3bc <exit>
  }

  for(i = 1; i < argc; i++){
  a6:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  ad:	00 
  ae:	eb 79                	jmp    129 <main+0xa3>
    if((fd = open(argv[i], 0)) < 0){
  b0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  b4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  be:	01 d0                	add    %edx,%eax
  c0:	8b 00                	mov    (%eax),%eax
  c2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c9:	00 
  ca:	89 04 24             	mov    %eax,(%esp)
  cd:	e8 2a 03 00 00       	call   3fc <open>
  d2:	89 44 24 18          	mov    %eax,0x18(%esp)
  d6:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  db:	79 2f                	jns    10c <main+0x86>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  e1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  eb:	01 d0                	add    %edx,%eax
  ed:	8b 00                	mov    (%eax),%eax
  ef:	89 44 24 08          	mov    %eax,0x8(%esp)
  f3:	c7 44 24 04 3b 09 00 	movl   $0x93b,0x4(%esp)
  fa:	00 
  fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 102:	e8 45 04 00 00       	call   54c <printf>
      exit();
 107:	e8 b0 02 00 00       	call   3bc <exit>
    }
    cat(fd);
 10c:	8b 44 24 18          	mov    0x18(%esp),%eax
 110:	89 04 24             	mov    %eax,(%esp)
 113:	e8 e8 fe ff ff       	call   0 <cat>
    close(fd);
 118:	8b 44 24 18          	mov    0x18(%esp),%eax
 11c:	89 04 24             	mov    %eax,(%esp)
 11f:	e8 c0 02 00 00       	call   3e4 <close>
  for(i = 1; i < argc; i++){
 124:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 129:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 12d:	3b 45 08             	cmp    0x8(%ebp),%eax
 130:	0f 8c 7a ff ff ff    	jl     b0 <main+0x2a>
  }
  exit();
 136:	e8 81 02 00 00       	call   3bc <exit>

0000013b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	57                   	push   %edi
 13f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 140:	8b 4d 08             	mov    0x8(%ebp),%ecx
 143:	8b 55 10             	mov    0x10(%ebp),%edx
 146:	8b 45 0c             	mov    0xc(%ebp),%eax
 149:	89 cb                	mov    %ecx,%ebx
 14b:	89 df                	mov    %ebx,%edi
 14d:	89 d1                	mov    %edx,%ecx
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
 152:	89 ca                	mov    %ecx,%edx
 154:	89 fb                	mov    %edi,%ebx
 156:	89 5d 08             	mov    %ebx,0x8(%ebp)
 159:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 15c:	5b                   	pop    %ebx
 15d:	5f                   	pop    %edi
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 16c:	90                   	nop
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	8d 50 01             	lea    0x1(%eax),%edx
 173:	89 55 08             	mov    %edx,0x8(%ebp)
 176:	8b 55 0c             	mov    0xc(%ebp),%edx
 179:	8d 4a 01             	lea    0x1(%edx),%ecx
 17c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 17f:	0f b6 12             	movzbl (%edx),%edx
 182:	88 10                	mov    %dl,(%eax)
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	84 c0                	test   %al,%al
 189:	75 e2                	jne    16d <strcpy+0xd>
    ;
  return os;
 18b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 18e:	c9                   	leave  
 18f:	c3                   	ret    

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 193:	eb 08                	jmp    19d <strcmp+0xd>
    p++, q++;
 195:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 199:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 19d:	8b 45 08             	mov    0x8(%ebp),%eax
 1a0:	0f b6 00             	movzbl (%eax),%eax
 1a3:	84 c0                	test   %al,%al
 1a5:	74 10                	je     1b7 <strcmp+0x27>
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b0:	0f b6 00             	movzbl (%eax),%eax
 1b3:	38 c2                	cmp    %al,%dl
 1b5:	74 de                	je     195 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	0f b6 00             	movzbl (%eax),%eax
 1bd:	0f b6 d0             	movzbl %al,%edx
 1c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c3:	0f b6 00             	movzbl (%eax),%eax
 1c6:	0f b6 c0             	movzbl %al,%eax
 1c9:	29 c2                	sub    %eax,%edx
 1cb:	89 d0                	mov    %edx,%eax
}
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    

000001cf <strlen>:

uint
strlen(const char *s)
{
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
 1d2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1dc:	eb 04                	jmp    1e2 <strlen+0x13>
 1de:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	01 d0                	add    %edx,%eax
 1ea:	0f b6 00             	movzbl (%eax),%eax
 1ed:	84 c0                	test   %al,%al
 1ef:	75 ed                	jne    1de <strlen+0xf>
    ;
  return n;
 1f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    

000001f6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1fc:	8b 45 10             	mov    0x10(%ebp),%eax
 1ff:	89 44 24 08          	mov    %eax,0x8(%esp)
 203:	8b 45 0c             	mov    0xc(%ebp),%eax
 206:	89 44 24 04          	mov    %eax,0x4(%esp)
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	89 04 24             	mov    %eax,(%esp)
 210:	e8 26 ff ff ff       	call   13b <stosb>
  return dst;
 215:	8b 45 08             	mov    0x8(%ebp),%eax
}
 218:	c9                   	leave  
 219:	c3                   	ret    

0000021a <strchr>:

char*
strchr(const char *s, char c)
{
 21a:	55                   	push   %ebp
 21b:	89 e5                	mov    %esp,%ebp
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	8b 45 0c             	mov    0xc(%ebp),%eax
 223:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 226:	eb 14                	jmp    23c <strchr+0x22>
    if(*s == c)
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	0f b6 00             	movzbl (%eax),%eax
 22e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 231:	75 05                	jne    238 <strchr+0x1e>
      return (char*)s;
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	eb 13                	jmp    24b <strchr+0x31>
  for(; *s; s++)
 238:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 23c:	8b 45 08             	mov    0x8(%ebp),%eax
 23f:	0f b6 00             	movzbl (%eax),%eax
 242:	84 c0                	test   %al,%al
 244:	75 e2                	jne    228 <strchr+0xe>
  return 0;
 246:	b8 00 00 00 00       	mov    $0x0,%eax
}
 24b:	c9                   	leave  
 24c:	c3                   	ret    

0000024d <gets>:

char*
gets(char *buf, int max)
{
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 253:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 25a:	eb 4c                	jmp    2a8 <gets+0x5b>
    cc = read(0, &c, 1);
 25c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 263:	00 
 264:	8d 45 ef             	lea    -0x11(%ebp),%eax
 267:	89 44 24 04          	mov    %eax,0x4(%esp)
 26b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 272:	e8 5d 01 00 00       	call   3d4 <read>
 277:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 27a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 27e:	7f 02                	jg     282 <gets+0x35>
      break;
 280:	eb 31                	jmp    2b3 <gets+0x66>
    buf[i++] = c;
 282:	8b 45 f4             	mov    -0xc(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 f4             	mov    %edx,-0xc(%ebp)
 28b:	89 c2                	mov    %eax,%edx
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	01 c2                	add    %eax,%edx
 292:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 296:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 298:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29c:	3c 0a                	cmp    $0xa,%al
 29e:	74 13                	je     2b3 <gets+0x66>
 2a0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a4:	3c 0d                	cmp    $0xd,%al
 2a6:	74 0b                	je     2b3 <gets+0x66>
  for(i=0; i+1 < max; ){
 2a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ab:	83 c0 01             	add    $0x1,%eax
 2ae:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2b1:	7c a9                	jl     25c <gets+0xf>
      break;
  }
  buf[i] = '\0';
 2b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
 2b9:	01 d0                	add    %edx,%eax
 2bb:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c1:	c9                   	leave  
 2c2:	c3                   	ret    

000002c3 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c3:	55                   	push   %ebp
 2c4:	89 e5                	mov    %esp,%ebp
 2c6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2d0:	00 
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	89 04 24             	mov    %eax,(%esp)
 2d7:	e8 20 01 00 00       	call   3fc <open>
 2dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e3:	79 07                	jns    2ec <stat+0x29>
    return -1;
 2e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ea:	eb 23                	jmp    30f <stat+0x4c>
  r = fstat(fd, st);
 2ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f6:	89 04 24             	mov    %eax,(%esp)
 2f9:	e8 16 01 00 00       	call   414 <fstat>
 2fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 301:	8b 45 f4             	mov    -0xc(%ebp),%eax
 304:	89 04 24             	mov    %eax,(%esp)
 307:	e8 d8 00 00 00       	call   3e4 <close>
  return r;
 30c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 30f:	c9                   	leave  
 310:	c3                   	ret    

00000311 <atoi>:

int
atoi(const char *s)
{
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
 314:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 317:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 31e:	eb 25                	jmp    345 <atoi+0x34>
    n = n*10 + *s++ - '0';
 320:	8b 55 fc             	mov    -0x4(%ebp),%edx
 323:	89 d0                	mov    %edx,%eax
 325:	c1 e0 02             	shl    $0x2,%eax
 328:	01 d0                	add    %edx,%eax
 32a:	01 c0                	add    %eax,%eax
 32c:	89 c1                	mov    %eax,%ecx
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	8d 50 01             	lea    0x1(%eax),%edx
 334:	89 55 08             	mov    %edx,0x8(%ebp)
 337:	0f b6 00             	movzbl (%eax),%eax
 33a:	0f be c0             	movsbl %al,%eax
 33d:	01 c8                	add    %ecx,%eax
 33f:	83 e8 30             	sub    $0x30,%eax
 342:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	0f b6 00             	movzbl (%eax),%eax
 34b:	3c 2f                	cmp    $0x2f,%al
 34d:	7e 0a                	jle    359 <atoi+0x48>
 34f:	8b 45 08             	mov    0x8(%ebp),%eax
 352:	0f b6 00             	movzbl (%eax),%eax
 355:	3c 39                	cmp    $0x39,%al
 357:	7e c7                	jle    320 <atoi+0xf>
  return n;
 359:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 35c:	c9                   	leave  
 35d:	c3                   	ret    

0000035e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 35e:	55                   	push   %ebp
 35f:	89 e5                	mov    %esp,%ebp
 361:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 36a:	8b 45 0c             	mov    0xc(%ebp),%eax
 36d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 370:	eb 17                	jmp    389 <memmove+0x2b>
    *dst++ = *src++;
 372:	8b 45 fc             	mov    -0x4(%ebp),%eax
 375:	8d 50 01             	lea    0x1(%eax),%edx
 378:	89 55 fc             	mov    %edx,-0x4(%ebp)
 37b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 37e:	8d 4a 01             	lea    0x1(%edx),%ecx
 381:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 384:	0f b6 12             	movzbl (%edx),%edx
 387:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 389:	8b 45 10             	mov    0x10(%ebp),%eax
 38c:	8d 50 ff             	lea    -0x1(%eax),%edx
 38f:	89 55 10             	mov    %edx,0x10(%ebp)
 392:	85 c0                	test   %eax,%eax
 394:	7f dc                	jg     372 <memmove+0x14>
  return vdst;
 396:	8b 45 08             	mov    0x8(%ebp),%eax
}
 399:	c9                   	leave  
 39a:	c3                   	ret    

0000039b <ps>:


// ** wrapper funcion for print sat table **//
void ps() {
 39b:	55                   	push   %ebp
 39c:	89 e5                	mov    %esp,%ebp
 39e:	81 ec 18 09 00 00    	sub    $0x918,%esp
  pstatTable p;
  getpinfo(&p);
 3a4:	8d 85 f8 f6 ff ff    	lea    -0x908(%ebp),%eax
 3aa:	89 04 24             	mov    %eax,(%esp)
 3ad:	e8 aa 00 00 00       	call   45c <getpinfo>
 3b2:	c9                   	leave  
 3b3:	c3                   	ret    

000003b4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3b4:	b8 01 00 00 00       	mov    $0x1,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <exit>:
SYSCALL(exit)
 3bc:	b8 02 00 00 00       	mov    $0x2,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <wait>:
SYSCALL(wait)
 3c4:	b8 03 00 00 00       	mov    $0x3,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <pipe>:
SYSCALL(pipe)
 3cc:	b8 04 00 00 00       	mov    $0x4,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <read>:
SYSCALL(read)
 3d4:	b8 05 00 00 00       	mov    $0x5,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <write>:
SYSCALL(write)
 3dc:	b8 10 00 00 00       	mov    $0x10,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <close>:
SYSCALL(close)
 3e4:	b8 15 00 00 00       	mov    $0x15,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <kill>:
SYSCALL(kill)
 3ec:	b8 06 00 00 00       	mov    $0x6,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <exec>:
SYSCALL(exec)
 3f4:	b8 07 00 00 00       	mov    $0x7,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <open>:
SYSCALL(open)
 3fc:	b8 0f 00 00 00       	mov    $0xf,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <mknod>:
SYSCALL(mknod)
 404:	b8 11 00 00 00       	mov    $0x11,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <unlink>:
SYSCALL(unlink)
 40c:	b8 12 00 00 00       	mov    $0x12,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <fstat>:
SYSCALL(fstat)
 414:	b8 08 00 00 00       	mov    $0x8,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <link>:
SYSCALL(link)
 41c:	b8 13 00 00 00       	mov    $0x13,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <mkdir>:
SYSCALL(mkdir)
 424:	b8 14 00 00 00       	mov    $0x14,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <chdir>:
SYSCALL(chdir)
 42c:	b8 09 00 00 00       	mov    $0x9,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <dup>:
SYSCALL(dup)
 434:	b8 0a 00 00 00       	mov    $0xa,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <getpid>:
SYSCALL(getpid)
 43c:	b8 0b 00 00 00       	mov    $0xb,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <sbrk>:
SYSCALL(sbrk)
 444:	b8 0c 00 00 00       	mov    $0xc,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <sleep>:
SYSCALL(sleep)
 44c:	b8 0d 00 00 00       	mov    $0xd,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <uptime>:
SYSCALL(uptime)
 454:	b8 0e 00 00 00       	mov    $0xe,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <getpinfo>:
SYSCALL(getpinfo)
 45c:	b8 16 00 00 00       	mov    $0x16,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <settickets>:
SYSCALL(settickets)
 464:	b8 17 00 00 00       	mov    $0x17,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 46c:	55                   	push   %ebp
 46d:	89 e5                	mov    %esp,%ebp
 46f:	83 ec 18             	sub    $0x18,%esp
 472:	8b 45 0c             	mov    0xc(%ebp),%eax
 475:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 478:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 47f:	00 
 480:	8d 45 f4             	lea    -0xc(%ebp),%eax
 483:	89 44 24 04          	mov    %eax,0x4(%esp)
 487:	8b 45 08             	mov    0x8(%ebp),%eax
 48a:	89 04 24             	mov    %eax,(%esp)
 48d:	e8 4a ff ff ff       	call   3dc <write>
}
 492:	c9                   	leave  
 493:	c3                   	ret    

00000494 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	56                   	push   %esi
 498:	53                   	push   %ebx
 499:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 49c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4a3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4a7:	74 17                	je     4c0 <printint+0x2c>
 4a9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4ad:	79 11                	jns    4c0 <printint+0x2c>
    neg = 1;
 4af:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b9:	f7 d8                	neg    %eax
 4bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4be:	eb 06                	jmp    4c6 <printint+0x32>
  } else {
    x = xx;
 4c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 4c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4cd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4d0:	8d 41 01             	lea    0x1(%ecx),%eax
 4d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4d6:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4dc:	ba 00 00 00 00       	mov    $0x0,%edx
 4e1:	f7 f3                	div    %ebx
 4e3:	89 d0                	mov    %edx,%eax
 4e5:	0f b6 80 dc 0b 00 00 	movzbl 0xbdc(%eax),%eax
 4ec:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4f0:	8b 75 10             	mov    0x10(%ebp),%esi
 4f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4f6:	ba 00 00 00 00       	mov    $0x0,%edx
 4fb:	f7 f6                	div    %esi
 4fd:	89 45 ec             	mov    %eax,-0x14(%ebp)
 500:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 504:	75 c7                	jne    4cd <printint+0x39>
  if(neg)
 506:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 50a:	74 10                	je     51c <printint+0x88>
    buf[i++] = '-';
 50c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 50f:	8d 50 01             	lea    0x1(%eax),%edx
 512:	89 55 f4             	mov    %edx,-0xc(%ebp)
 515:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 51a:	eb 1f                	jmp    53b <printint+0xa7>
 51c:	eb 1d                	jmp    53b <printint+0xa7>
    putc(fd, buf[i]);
 51e:	8d 55 dc             	lea    -0x24(%ebp),%edx
 521:	8b 45 f4             	mov    -0xc(%ebp),%eax
 524:	01 d0                	add    %edx,%eax
 526:	0f b6 00             	movzbl (%eax),%eax
 529:	0f be c0             	movsbl %al,%eax
 52c:	89 44 24 04          	mov    %eax,0x4(%esp)
 530:	8b 45 08             	mov    0x8(%ebp),%eax
 533:	89 04 24             	mov    %eax,(%esp)
 536:	e8 31 ff ff ff       	call   46c <putc>
  while(--i >= 0)
 53b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 53f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 543:	79 d9                	jns    51e <printint+0x8a>
}
 545:	83 c4 30             	add    $0x30,%esp
 548:	5b                   	pop    %ebx
 549:	5e                   	pop    %esi
 54a:	5d                   	pop    %ebp
 54b:	c3                   	ret    

0000054c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 54c:	55                   	push   %ebp
 54d:	89 e5                	mov    %esp,%ebp
 54f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 552:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 559:	8d 45 0c             	lea    0xc(%ebp),%eax
 55c:	83 c0 04             	add    $0x4,%eax
 55f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 562:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 569:	e9 7c 01 00 00       	jmp    6ea <printf+0x19e>
    c = fmt[i] & 0xff;
 56e:	8b 55 0c             	mov    0xc(%ebp),%edx
 571:	8b 45 f0             	mov    -0x10(%ebp),%eax
 574:	01 d0                	add    %edx,%eax
 576:	0f b6 00             	movzbl (%eax),%eax
 579:	0f be c0             	movsbl %al,%eax
 57c:	25 ff 00 00 00       	and    $0xff,%eax
 581:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 584:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 588:	75 2c                	jne    5b6 <printf+0x6a>
      if(c == '%'){
 58a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 58e:	75 0c                	jne    59c <printf+0x50>
        state = '%';
 590:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 597:	e9 4a 01 00 00       	jmp    6e6 <printf+0x19a>
      } else {
        putc(fd, c);
 59c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 59f:	0f be c0             	movsbl %al,%eax
 5a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a6:	8b 45 08             	mov    0x8(%ebp),%eax
 5a9:	89 04 24             	mov    %eax,(%esp)
 5ac:	e8 bb fe ff ff       	call   46c <putc>
 5b1:	e9 30 01 00 00       	jmp    6e6 <printf+0x19a>
      }
    } else if(state == '%'){
 5b6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5ba:	0f 85 26 01 00 00    	jne    6e6 <printf+0x19a>
      if(c == 'd'){
 5c0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5c4:	75 2d                	jne    5f3 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5c9:	8b 00                	mov    (%eax),%eax
 5cb:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5d2:	00 
 5d3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5da:	00 
 5db:	89 44 24 04          	mov    %eax,0x4(%esp)
 5df:	8b 45 08             	mov    0x8(%ebp),%eax
 5e2:	89 04 24             	mov    %eax,(%esp)
 5e5:	e8 aa fe ff ff       	call   494 <printint>
        ap++;
 5ea:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ee:	e9 ec 00 00 00       	jmp    6df <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5f3:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5f7:	74 06                	je     5ff <printf+0xb3>
 5f9:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5fd:	75 2d                	jne    62c <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
 602:	8b 00                	mov    (%eax),%eax
 604:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 60b:	00 
 60c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 613:	00 
 614:	89 44 24 04          	mov    %eax,0x4(%esp)
 618:	8b 45 08             	mov    0x8(%ebp),%eax
 61b:	89 04 24             	mov    %eax,(%esp)
 61e:	e8 71 fe ff ff       	call   494 <printint>
        ap++;
 623:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 627:	e9 b3 00 00 00       	jmp    6df <printf+0x193>
      } else if(c == 's'){
 62c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 630:	75 45                	jne    677 <printf+0x12b>
        s = (char*)*ap;
 632:	8b 45 e8             	mov    -0x18(%ebp),%eax
 635:	8b 00                	mov    (%eax),%eax
 637:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 63a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 63e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 642:	75 09                	jne    64d <printf+0x101>
          s = "(null)";
 644:	c7 45 f4 50 09 00 00 	movl   $0x950,-0xc(%ebp)
        while(*s != 0){
 64b:	eb 1e                	jmp    66b <printf+0x11f>
 64d:	eb 1c                	jmp    66b <printf+0x11f>
          putc(fd, *s);
 64f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 652:	0f b6 00             	movzbl (%eax),%eax
 655:	0f be c0             	movsbl %al,%eax
 658:	89 44 24 04          	mov    %eax,0x4(%esp)
 65c:	8b 45 08             	mov    0x8(%ebp),%eax
 65f:	89 04 24             	mov    %eax,(%esp)
 662:	e8 05 fe ff ff       	call   46c <putc>
          s++;
 667:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 66b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 66e:	0f b6 00             	movzbl (%eax),%eax
 671:	84 c0                	test   %al,%al
 673:	75 da                	jne    64f <printf+0x103>
 675:	eb 68                	jmp    6df <printf+0x193>
        }
      } else if(c == 'c'){
 677:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 67b:	75 1d                	jne    69a <printf+0x14e>
        putc(fd, *ap);
 67d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 680:	8b 00                	mov    (%eax),%eax
 682:	0f be c0             	movsbl %al,%eax
 685:	89 44 24 04          	mov    %eax,0x4(%esp)
 689:	8b 45 08             	mov    0x8(%ebp),%eax
 68c:	89 04 24             	mov    %eax,(%esp)
 68f:	e8 d8 fd ff ff       	call   46c <putc>
        ap++;
 694:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 698:	eb 45                	jmp    6df <printf+0x193>
      } else if(c == '%'){
 69a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 69e:	75 17                	jne    6b7 <printf+0x16b>
        putc(fd, c);
 6a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6a3:	0f be c0             	movsbl %al,%eax
 6a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6aa:	8b 45 08             	mov    0x8(%ebp),%eax
 6ad:	89 04 24             	mov    %eax,(%esp)
 6b0:	e8 b7 fd ff ff       	call   46c <putc>
 6b5:	eb 28                	jmp    6df <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6b7:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6be:	00 
 6bf:	8b 45 08             	mov    0x8(%ebp),%eax
 6c2:	89 04 24             	mov    %eax,(%esp)
 6c5:	e8 a2 fd ff ff       	call   46c <putc>
        putc(fd, c);
 6ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6cd:	0f be c0             	movsbl %al,%eax
 6d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d4:	8b 45 08             	mov    0x8(%ebp),%eax
 6d7:	89 04 24             	mov    %eax,(%esp)
 6da:	e8 8d fd ff ff       	call   46c <putc>
      }
      state = 0;
 6df:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6e6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6ea:	8b 55 0c             	mov    0xc(%ebp),%edx
 6ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6f0:	01 d0                	add    %edx,%eax
 6f2:	0f b6 00             	movzbl (%eax),%eax
 6f5:	84 c0                	test   %al,%al
 6f7:	0f 85 71 fe ff ff    	jne    56e <printf+0x22>
    }
  }
}
 6fd:	c9                   	leave  
 6fe:	c3                   	ret    

000006ff <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6ff:	55                   	push   %ebp
 700:	89 e5                	mov    %esp,%ebp
 702:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	83 e8 08             	sub    $0x8,%eax
 70b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70e:	a1 08 0c 00 00       	mov    0xc08,%eax
 713:	89 45 fc             	mov    %eax,-0x4(%ebp)
 716:	eb 24                	jmp    73c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 718:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71b:	8b 00                	mov    (%eax),%eax
 71d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 720:	77 12                	ja     734 <free+0x35>
 722:	8b 45 f8             	mov    -0x8(%ebp),%eax
 725:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 728:	77 24                	ja     74e <free+0x4f>
 72a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72d:	8b 00                	mov    (%eax),%eax
 72f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 732:	77 1a                	ja     74e <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 734:	8b 45 fc             	mov    -0x4(%ebp),%eax
 737:	8b 00                	mov    (%eax),%eax
 739:	89 45 fc             	mov    %eax,-0x4(%ebp)
 73c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 742:	76 d4                	jbe    718 <free+0x19>
 744:	8b 45 fc             	mov    -0x4(%ebp),%eax
 747:	8b 00                	mov    (%eax),%eax
 749:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 74c:	76 ca                	jbe    718 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 74e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 751:	8b 40 04             	mov    0x4(%eax),%eax
 754:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 75b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75e:	01 c2                	add    %eax,%edx
 760:	8b 45 fc             	mov    -0x4(%ebp),%eax
 763:	8b 00                	mov    (%eax),%eax
 765:	39 c2                	cmp    %eax,%edx
 767:	75 24                	jne    78d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 769:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76c:	8b 50 04             	mov    0x4(%eax),%edx
 76f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 772:	8b 00                	mov    (%eax),%eax
 774:	8b 40 04             	mov    0x4(%eax),%eax
 777:	01 c2                	add    %eax,%edx
 779:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 77f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 782:	8b 00                	mov    (%eax),%eax
 784:	8b 10                	mov    (%eax),%edx
 786:	8b 45 f8             	mov    -0x8(%ebp),%eax
 789:	89 10                	mov    %edx,(%eax)
 78b:	eb 0a                	jmp    797 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 78d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 790:	8b 10                	mov    (%eax),%edx
 792:	8b 45 f8             	mov    -0x8(%ebp),%eax
 795:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 797:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79a:	8b 40 04             	mov    0x4(%eax),%eax
 79d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a7:	01 d0                	add    %edx,%eax
 7a9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ac:	75 20                	jne    7ce <free+0xcf>
    p->s.size += bp->s.size;
 7ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b1:	8b 50 04             	mov    0x4(%eax),%edx
 7b4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b7:	8b 40 04             	mov    0x4(%eax),%eax
 7ba:	01 c2                	add    %eax,%edx
 7bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c5:	8b 10                	mov    (%eax),%edx
 7c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ca:	89 10                	mov    %edx,(%eax)
 7cc:	eb 08                	jmp    7d6 <free+0xd7>
  } else
    p->s.ptr = bp;
 7ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7d4:	89 10                	mov    %edx,(%eax)
  freep = p;
 7d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d9:	a3 08 0c 00 00       	mov    %eax,0xc08
}
 7de:	c9                   	leave  
 7df:	c3                   	ret    

000007e0 <morecore>:

static Header*
morecore(uint nu)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7e6:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7ed:	77 07                	ja     7f6 <morecore+0x16>
    nu = 4096;
 7ef:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7f6:	8b 45 08             	mov    0x8(%ebp),%eax
 7f9:	c1 e0 03             	shl    $0x3,%eax
 7fc:	89 04 24             	mov    %eax,(%esp)
 7ff:	e8 40 fc ff ff       	call   444 <sbrk>
 804:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 807:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 80b:	75 07                	jne    814 <morecore+0x34>
    return 0;
 80d:	b8 00 00 00 00       	mov    $0x0,%eax
 812:	eb 22                	jmp    836 <morecore+0x56>
  hp = (Header*)p;
 814:	8b 45 f4             	mov    -0xc(%ebp),%eax
 817:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 81a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 81d:	8b 55 08             	mov    0x8(%ebp),%edx
 820:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 823:	8b 45 f0             	mov    -0x10(%ebp),%eax
 826:	83 c0 08             	add    $0x8,%eax
 829:	89 04 24             	mov    %eax,(%esp)
 82c:	e8 ce fe ff ff       	call   6ff <free>
  return freep;
 831:	a1 08 0c 00 00       	mov    0xc08,%eax
}
 836:	c9                   	leave  
 837:	c3                   	ret    

00000838 <malloc>:

void*
malloc(uint nbytes)
{
 838:	55                   	push   %ebp
 839:	89 e5                	mov    %esp,%ebp
 83b:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 83e:	8b 45 08             	mov    0x8(%ebp),%eax
 841:	83 c0 07             	add    $0x7,%eax
 844:	c1 e8 03             	shr    $0x3,%eax
 847:	83 c0 01             	add    $0x1,%eax
 84a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 84d:	a1 08 0c 00 00       	mov    0xc08,%eax
 852:	89 45 f0             	mov    %eax,-0x10(%ebp)
 855:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 859:	75 23                	jne    87e <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 85b:	c7 45 f0 00 0c 00 00 	movl   $0xc00,-0x10(%ebp)
 862:	8b 45 f0             	mov    -0x10(%ebp),%eax
 865:	a3 08 0c 00 00       	mov    %eax,0xc08
 86a:	a1 08 0c 00 00       	mov    0xc08,%eax
 86f:	a3 00 0c 00 00       	mov    %eax,0xc00
    base.s.size = 0;
 874:	c7 05 04 0c 00 00 00 	movl   $0x0,0xc04
 87b:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 87e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 881:	8b 00                	mov    (%eax),%eax
 883:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 886:	8b 45 f4             	mov    -0xc(%ebp),%eax
 889:	8b 40 04             	mov    0x4(%eax),%eax
 88c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 88f:	72 4d                	jb     8de <malloc+0xa6>
      if(p->s.size == nunits)
 891:	8b 45 f4             	mov    -0xc(%ebp),%eax
 894:	8b 40 04             	mov    0x4(%eax),%eax
 897:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 89a:	75 0c                	jne    8a8 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 89c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89f:	8b 10                	mov    (%eax),%edx
 8a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a4:	89 10                	mov    %edx,(%eax)
 8a6:	eb 26                	jmp    8ce <malloc+0x96>
      else {
        p->s.size -= nunits;
 8a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ab:	8b 40 04             	mov    0x4(%eax),%eax
 8ae:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8b1:	89 c2                	mov    %eax,%edx
 8b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bc:	8b 40 04             	mov    0x4(%eax),%eax
 8bf:	c1 e0 03             	shl    $0x3,%eax
 8c2:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c8:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8cb:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d1:	a3 08 0c 00 00       	mov    %eax,0xc08
      return (void*)(p + 1);
 8d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d9:	83 c0 08             	add    $0x8,%eax
 8dc:	eb 38                	jmp    916 <malloc+0xde>
    }
    if(p == freep)
 8de:	a1 08 0c 00 00       	mov    0xc08,%eax
 8e3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8e6:	75 1b                	jne    903 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8eb:	89 04 24             	mov    %eax,(%esp)
 8ee:	e8 ed fe ff ff       	call   7e0 <morecore>
 8f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8fa:	75 07                	jne    903 <malloc+0xcb>
        return 0;
 8fc:	b8 00 00 00 00       	mov    $0x0,%eax
 901:	eb 13                	jmp    916 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 903:	8b 45 f4             	mov    -0xc(%ebp),%eax
 906:	89 45 f0             	mov    %eax,-0x10(%ebp)
 909:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90c:	8b 00                	mov    (%eax),%eax
 90e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 911:	e9 70 ff ff ff       	jmp    886 <malloc+0x4e>
}
 916:	c9                   	leave  
 917:	c3                   	ret    
