
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 48             	sub    $0x48,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 68                	jmp    8a <wc+0x8a>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 57                	jmp    82 <wc+0x82>
      c++;
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 c0 0c 00 00       	add    $0xcc0,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 c0 0c 00 00       	add    $0xcc0,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	89 44 24 04          	mov    %eax,0x4(%esp)
  54:	c7 04 24 b6 09 00 00 	movl   $0x9b6,(%esp)
  5b:	e8 58 02 00 00       	call   2b8 <strchr>
  60:	85 c0                	test   %eax,%eax
  62:	74 09                	je     6d <wc+0x6d>
        inword = 0;
  64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6b:	eb 11                	jmp    7e <wc+0x7e>
      else if(!inword){
  6d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  71:	75 0b                	jne    7e <wc+0x7e>
        w++;
  73:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  77:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
  7e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  85:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  88:	7c a1                	jl     2b <wc+0x2b>
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  91:	00 
  92:	c7 44 24 04 c0 0c 00 	movl   $0xcc0,0x4(%esp)
  99:	00 
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 cd 03 00 00       	call   472 <read>
  a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  ac:	0f 8f 70 ff ff ff    	jg     22 <wc+0x22>
      }
    }
  }
  if(n < 0){
  b2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b6:	79 19                	jns    d1 <wc+0xd1>
    printf(1, "wc: read error\n");
  b8:	c7 44 24 04 bc 09 00 	movl   $0x9bc,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 1e 05 00 00       	call   5ea <printf>
    exit();
  cc:	e8 89 03 00 00       	call   45a <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  d4:	89 44 24 14          	mov    %eax,0x14(%esp)
  d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  db:	89 44 24 10          	mov    %eax,0x10(%esp)
  df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  e2:	89 44 24 0c          	mov    %eax,0xc(%esp)
  e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  ed:	c7 44 24 04 cc 09 00 	movl   $0x9cc,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 e9 04 00 00       	call   5ea <printf>
}
 101:	c9                   	leave  
 102:	c3                   	ret    

00000103 <main>:

int
main(int argc, char *argv[])
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	83 e4 f0             	and    $0xfffffff0,%esp
 109:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
 10c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 110:	7f 19                	jg     12b <main+0x28>
    wc(0, "");
 112:	c7 44 24 04 d9 09 00 	movl   $0x9d9,0x4(%esp)
 119:	00 
 11a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 121:	e8 da fe ff ff       	call   0 <wc>
    exit();
 126:	e8 2f 03 00 00       	call   45a <exit>
  }

  for(i = 1; i < argc; i++){
 12b:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 132:	00 
 133:	e9 8f 00 00 00       	jmp    1c7 <main+0xc4>
    if((fd = open(argv[i], 0)) < 0){
 138:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 13c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	01 d0                	add    %edx,%eax
 148:	8b 00                	mov    (%eax),%eax
 14a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 151:	00 
 152:	89 04 24             	mov    %eax,(%esp)
 155:	e8 40 03 00 00       	call   49a <open>
 15a:	89 44 24 18          	mov    %eax,0x18(%esp)
 15e:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 163:	79 2f                	jns    194 <main+0x91>
      printf(1, "wc: cannot open %s\n", argv[i]);
 165:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 169:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 170:	8b 45 0c             	mov    0xc(%ebp),%eax
 173:	01 d0                	add    %edx,%eax
 175:	8b 00                	mov    (%eax),%eax
 177:	89 44 24 08          	mov    %eax,0x8(%esp)
 17b:	c7 44 24 04 da 09 00 	movl   $0x9da,0x4(%esp)
 182:	00 
 183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18a:	e8 5b 04 00 00       	call   5ea <printf>
      exit();
 18f:	e8 c6 02 00 00       	call   45a <exit>
    }
    wc(fd, argv[i]);
 194:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 198:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 19f:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a2:	01 d0                	add    %edx,%eax
 1a4:	8b 00                	mov    (%eax),%eax
 1a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1aa:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ae:	89 04 24             	mov    %eax,(%esp)
 1b1:	e8 4a fe ff ff       	call   0 <wc>
    close(fd);
 1b6:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ba:	89 04 24             	mov    %eax,(%esp)
 1bd:	e8 c0 02 00 00       	call   482 <close>
  for(i = 1; i < argc; i++){
 1c2:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1c7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1cb:	3b 45 08             	cmp    0x8(%ebp),%eax
 1ce:	0f 8c 64 ff ff ff    	jl     138 <main+0x35>
  }
  exit();
 1d4:	e8 81 02 00 00       	call   45a <exit>

000001d9 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	57                   	push   %edi
 1dd:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1de:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e1:	8b 55 10             	mov    0x10(%ebp),%edx
 1e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e7:	89 cb                	mov    %ecx,%ebx
 1e9:	89 df                	mov    %ebx,%edi
 1eb:	89 d1                	mov    %edx,%ecx
 1ed:	fc                   	cld    
 1ee:	f3 aa                	rep stos %al,%es:(%edi)
 1f0:	89 ca                	mov    %ecx,%edx
 1f2:	89 fb                	mov    %edi,%ebx
 1f4:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1f7:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1fa:	5b                   	pop    %ebx
 1fb:	5f                   	pop    %edi
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    

000001fe <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 204:	8b 45 08             	mov    0x8(%ebp),%eax
 207:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 20a:	90                   	nop
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	8d 50 01             	lea    0x1(%eax),%edx
 211:	89 55 08             	mov    %edx,0x8(%ebp)
 214:	8b 55 0c             	mov    0xc(%ebp),%edx
 217:	8d 4a 01             	lea    0x1(%edx),%ecx
 21a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 21d:	0f b6 12             	movzbl (%edx),%edx
 220:	88 10                	mov    %dl,(%eax)
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	84 c0                	test   %al,%al
 227:	75 e2                	jne    20b <strcpy+0xd>
    ;
  return os;
 229:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22c:	c9                   	leave  
 22d:	c3                   	ret    

0000022e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 22e:	55                   	push   %ebp
 22f:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 231:	eb 08                	jmp    23b <strcmp+0xd>
    p++, q++;
 233:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 237:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
 23e:	0f b6 00             	movzbl (%eax),%eax
 241:	84 c0                	test   %al,%al
 243:	74 10                	je     255 <strcmp+0x27>
 245:	8b 45 08             	mov    0x8(%ebp),%eax
 248:	0f b6 10             	movzbl (%eax),%edx
 24b:	8b 45 0c             	mov    0xc(%ebp),%eax
 24e:	0f b6 00             	movzbl (%eax),%eax
 251:	38 c2                	cmp    %al,%dl
 253:	74 de                	je     233 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 255:	8b 45 08             	mov    0x8(%ebp),%eax
 258:	0f b6 00             	movzbl (%eax),%eax
 25b:	0f b6 d0             	movzbl %al,%edx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	0f b6 c0             	movzbl %al,%eax
 267:	29 c2                	sub    %eax,%edx
 269:	89 d0                	mov    %edx,%eax
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <strlen>:

uint
strlen(const char *s)
{
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 273:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 27a:	eb 04                	jmp    280 <strlen+0x13>
 27c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 280:	8b 55 fc             	mov    -0x4(%ebp),%edx
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	01 d0                	add    %edx,%eax
 288:	0f b6 00             	movzbl (%eax),%eax
 28b:	84 c0                	test   %al,%al
 28d:	75 ed                	jne    27c <strlen+0xf>
    ;
  return n;
 28f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <memset>:

void*
memset(void *dst, int c, uint n)
{
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 29a:	8b 45 10             	mov    0x10(%ebp),%eax
 29d:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	89 04 24             	mov    %eax,(%esp)
 2ae:	e8 26 ff ff ff       	call   1d9 <stosb>
  return dst;
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b6:	c9                   	leave  
 2b7:	c3                   	ret    

000002b8 <strchr>:

char*
strchr(const char *s, char c)
{
 2b8:	55                   	push   %ebp
 2b9:	89 e5                	mov    %esp,%ebp
 2bb:	83 ec 04             	sub    $0x4,%esp
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2c4:	eb 14                	jmp    2da <strchr+0x22>
    if(*s == c)
 2c6:	8b 45 08             	mov    0x8(%ebp),%eax
 2c9:	0f b6 00             	movzbl (%eax),%eax
 2cc:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2cf:	75 05                	jne    2d6 <strchr+0x1e>
      return (char*)s;
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	eb 13                	jmp    2e9 <strchr+0x31>
  for(; *s; s++)
 2d6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
 2dd:	0f b6 00             	movzbl (%eax),%eax
 2e0:	84 c0                	test   %al,%al
 2e2:	75 e2                	jne    2c6 <strchr+0xe>
  return 0;
 2e4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e9:	c9                   	leave  
 2ea:	c3                   	ret    

000002eb <gets>:

char*
gets(char *buf, int max)
{
 2eb:	55                   	push   %ebp
 2ec:	89 e5                	mov    %esp,%ebp
 2ee:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2f8:	eb 4c                	jmp    346 <gets+0x5b>
    cc = read(0, &c, 1);
 2fa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 301:	00 
 302:	8d 45 ef             	lea    -0x11(%ebp),%eax
 305:	89 44 24 04          	mov    %eax,0x4(%esp)
 309:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 310:	e8 5d 01 00 00       	call   472 <read>
 315:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 318:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 31c:	7f 02                	jg     320 <gets+0x35>
      break;
 31e:	eb 31                	jmp    351 <gets+0x66>
    buf[i++] = c;
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	8d 50 01             	lea    0x1(%eax),%edx
 326:	89 55 f4             	mov    %edx,-0xc(%ebp)
 329:	89 c2                	mov    %eax,%edx
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	01 c2                	add    %eax,%edx
 330:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 334:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 336:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33a:	3c 0a                	cmp    $0xa,%al
 33c:	74 13                	je     351 <gets+0x66>
 33e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 342:	3c 0d                	cmp    $0xd,%al
 344:	74 0b                	je     351 <gets+0x66>
  for(i=0; i+1 < max; ){
 346:	8b 45 f4             	mov    -0xc(%ebp),%eax
 349:	83 c0 01             	add    $0x1,%eax
 34c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 34f:	7c a9                	jl     2fa <gets+0xf>
      break;
  }
  buf[i] = '\0';
 351:	8b 55 f4             	mov    -0xc(%ebp),%edx
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	01 d0                	add    %edx,%eax
 359:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 35c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35f:	c9                   	leave  
 360:	c3                   	ret    

00000361 <stat>:

int
stat(const char *n, struct stat *st)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 367:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 36e:	00 
 36f:	8b 45 08             	mov    0x8(%ebp),%eax
 372:	89 04 24             	mov    %eax,(%esp)
 375:	e8 20 01 00 00       	call   49a <open>
 37a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 37d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 381:	79 07                	jns    38a <stat+0x29>
    return -1;
 383:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 388:	eb 23                	jmp    3ad <stat+0x4c>
  r = fstat(fd, st);
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	89 44 24 04          	mov    %eax,0x4(%esp)
 391:	8b 45 f4             	mov    -0xc(%ebp),%eax
 394:	89 04 24             	mov    %eax,(%esp)
 397:	e8 16 01 00 00       	call   4b2 <fstat>
 39c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 39f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a2:	89 04 24             	mov    %eax,(%esp)
 3a5:	e8 d8 00 00 00       	call   482 <close>
  return r;
 3aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3ad:	c9                   	leave  
 3ae:	c3                   	ret    

000003af <atoi>:

int
atoi(const char *s)
{
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3b5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3bc:	eb 25                	jmp    3e3 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3be:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3c1:	89 d0                	mov    %edx,%eax
 3c3:	c1 e0 02             	shl    $0x2,%eax
 3c6:	01 d0                	add    %edx,%eax
 3c8:	01 c0                	add    %eax,%eax
 3ca:	89 c1                	mov    %eax,%ecx
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	8d 50 01             	lea    0x1(%eax),%edx
 3d2:	89 55 08             	mov    %edx,0x8(%ebp)
 3d5:	0f b6 00             	movzbl (%eax),%eax
 3d8:	0f be c0             	movsbl %al,%eax
 3db:	01 c8                	add    %ecx,%eax
 3dd:	83 e8 30             	sub    $0x30,%eax
 3e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	3c 2f                	cmp    $0x2f,%al
 3eb:	7e 0a                	jle    3f7 <atoi+0x48>
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	0f b6 00             	movzbl (%eax),%eax
 3f3:	3c 39                	cmp    $0x39,%al
 3f5:	7e c7                	jle    3be <atoi+0xf>
  return n;
 3f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3fa:	c9                   	leave  
 3fb:	c3                   	ret    

000003fc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 402:	8b 45 08             	mov    0x8(%ebp),%eax
 405:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 408:	8b 45 0c             	mov    0xc(%ebp),%eax
 40b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 40e:	eb 17                	jmp    427 <memmove+0x2b>
    *dst++ = *src++;
 410:	8b 45 fc             	mov    -0x4(%ebp),%eax
 413:	8d 50 01             	lea    0x1(%eax),%edx
 416:	89 55 fc             	mov    %edx,-0x4(%ebp)
 419:	8b 55 f8             	mov    -0x8(%ebp),%edx
 41c:	8d 4a 01             	lea    0x1(%edx),%ecx
 41f:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 422:	0f b6 12             	movzbl (%edx),%edx
 425:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 427:	8b 45 10             	mov    0x10(%ebp),%eax
 42a:	8d 50 ff             	lea    -0x1(%eax),%edx
 42d:	89 55 10             	mov    %edx,0x10(%ebp)
 430:	85 c0                	test   %eax,%eax
 432:	7f dc                	jg     410 <memmove+0x14>
  return vdst;
 434:	8b 45 08             	mov    0x8(%ebp),%eax
}
 437:	c9                   	leave  
 438:	c3                   	ret    

00000439 <ps>:


// ** wrapper funcion for print sat table **//
void ps() {
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	81 ec 18 09 00 00    	sub    $0x918,%esp
  pstatTable p;
  getpinfo(&p);
 442:	8d 85 f8 f6 ff ff    	lea    -0x908(%ebp),%eax
 448:	89 04 24             	mov    %eax,(%esp)
 44b:	e8 aa 00 00 00       	call   4fa <getpinfo>
 450:	c9                   	leave  
 451:	c3                   	ret    

00000452 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 452:	b8 01 00 00 00       	mov    $0x1,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <exit>:
SYSCALL(exit)
 45a:	b8 02 00 00 00       	mov    $0x2,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <wait>:
SYSCALL(wait)
 462:	b8 03 00 00 00       	mov    $0x3,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <pipe>:
SYSCALL(pipe)
 46a:	b8 04 00 00 00       	mov    $0x4,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <read>:
SYSCALL(read)
 472:	b8 05 00 00 00       	mov    $0x5,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <write>:
SYSCALL(write)
 47a:	b8 10 00 00 00       	mov    $0x10,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <close>:
SYSCALL(close)
 482:	b8 15 00 00 00       	mov    $0x15,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <kill>:
SYSCALL(kill)
 48a:	b8 06 00 00 00       	mov    $0x6,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <exec>:
SYSCALL(exec)
 492:	b8 07 00 00 00       	mov    $0x7,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <open>:
SYSCALL(open)
 49a:	b8 0f 00 00 00       	mov    $0xf,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <mknod>:
SYSCALL(mknod)
 4a2:	b8 11 00 00 00       	mov    $0x11,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <unlink>:
SYSCALL(unlink)
 4aa:	b8 12 00 00 00       	mov    $0x12,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <fstat>:
SYSCALL(fstat)
 4b2:	b8 08 00 00 00       	mov    $0x8,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <link>:
SYSCALL(link)
 4ba:	b8 13 00 00 00       	mov    $0x13,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <mkdir>:
SYSCALL(mkdir)
 4c2:	b8 14 00 00 00       	mov    $0x14,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <chdir>:
SYSCALL(chdir)
 4ca:	b8 09 00 00 00       	mov    $0x9,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <dup>:
SYSCALL(dup)
 4d2:	b8 0a 00 00 00       	mov    $0xa,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <getpid>:
SYSCALL(getpid)
 4da:	b8 0b 00 00 00       	mov    $0xb,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <sbrk>:
SYSCALL(sbrk)
 4e2:	b8 0c 00 00 00       	mov    $0xc,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <sleep>:
SYSCALL(sleep)
 4ea:	b8 0d 00 00 00       	mov    $0xd,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <uptime>:
SYSCALL(uptime)
 4f2:	b8 0e 00 00 00       	mov    $0xe,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <getpinfo>:
SYSCALL(getpinfo)
 4fa:	b8 16 00 00 00       	mov    $0x16,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <settickets>:
SYSCALL(settickets)
 502:	b8 17 00 00 00       	mov    $0x17,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 50a:	55                   	push   %ebp
 50b:	89 e5                	mov    %esp,%ebp
 50d:	83 ec 18             	sub    $0x18,%esp
 510:	8b 45 0c             	mov    0xc(%ebp),%eax
 513:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 516:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 51d:	00 
 51e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 521:	89 44 24 04          	mov    %eax,0x4(%esp)
 525:	8b 45 08             	mov    0x8(%ebp),%eax
 528:	89 04 24             	mov    %eax,(%esp)
 52b:	e8 4a ff ff ff       	call   47a <write>
}
 530:	c9                   	leave  
 531:	c3                   	ret    

00000532 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 532:	55                   	push   %ebp
 533:	89 e5                	mov    %esp,%ebp
 535:	56                   	push   %esi
 536:	53                   	push   %ebx
 537:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 53a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 541:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 545:	74 17                	je     55e <printint+0x2c>
 547:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 54b:	79 11                	jns    55e <printint+0x2c>
    neg = 1;
 54d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 554:	8b 45 0c             	mov    0xc(%ebp),%eax
 557:	f7 d8                	neg    %eax
 559:	89 45 ec             	mov    %eax,-0x14(%ebp)
 55c:	eb 06                	jmp    564 <printint+0x32>
  } else {
    x = xx;
 55e:	8b 45 0c             	mov    0xc(%ebp),%eax
 561:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 564:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 56b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 56e:	8d 41 01             	lea    0x1(%ecx),%eax
 571:	89 45 f4             	mov    %eax,-0xc(%ebp)
 574:	8b 5d 10             	mov    0x10(%ebp),%ebx
 577:	8b 45 ec             	mov    -0x14(%ebp),%eax
 57a:	ba 00 00 00 00       	mov    $0x0,%edx
 57f:	f7 f3                	div    %ebx
 581:	89 d0                	mov    %edx,%eax
 583:	0f b6 80 7c 0c 00 00 	movzbl 0xc7c(%eax),%eax
 58a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 58e:	8b 75 10             	mov    0x10(%ebp),%esi
 591:	8b 45 ec             	mov    -0x14(%ebp),%eax
 594:	ba 00 00 00 00       	mov    $0x0,%edx
 599:	f7 f6                	div    %esi
 59b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 59e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5a2:	75 c7                	jne    56b <printint+0x39>
  if(neg)
 5a4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5a8:	74 10                	je     5ba <printint+0x88>
    buf[i++] = '-';
 5aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ad:	8d 50 01             	lea    0x1(%eax),%edx
 5b0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5b3:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5b8:	eb 1f                	jmp    5d9 <printint+0xa7>
 5ba:	eb 1d                	jmp    5d9 <printint+0xa7>
    putc(fd, buf[i]);
 5bc:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c2:	01 d0                	add    %edx,%eax
 5c4:	0f b6 00             	movzbl (%eax),%eax
 5c7:	0f be c0             	movsbl %al,%eax
 5ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ce:	8b 45 08             	mov    0x8(%ebp),%eax
 5d1:	89 04 24             	mov    %eax,(%esp)
 5d4:	e8 31 ff ff ff       	call   50a <putc>
  while(--i >= 0)
 5d9:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5e1:	79 d9                	jns    5bc <printint+0x8a>
}
 5e3:	83 c4 30             	add    $0x30,%esp
 5e6:	5b                   	pop    %ebx
 5e7:	5e                   	pop    %esi
 5e8:	5d                   	pop    %ebp
 5e9:	c3                   	ret    

000005ea <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5ea:	55                   	push   %ebp
 5eb:	89 e5                	mov    %esp,%ebp
 5ed:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5f0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5f7:	8d 45 0c             	lea    0xc(%ebp),%eax
 5fa:	83 c0 04             	add    $0x4,%eax
 5fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 600:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 607:	e9 7c 01 00 00       	jmp    788 <printf+0x19e>
    c = fmt[i] & 0xff;
 60c:	8b 55 0c             	mov    0xc(%ebp),%edx
 60f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 612:	01 d0                	add    %edx,%eax
 614:	0f b6 00             	movzbl (%eax),%eax
 617:	0f be c0             	movsbl %al,%eax
 61a:	25 ff 00 00 00       	and    $0xff,%eax
 61f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 622:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 626:	75 2c                	jne    654 <printf+0x6a>
      if(c == '%'){
 628:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 62c:	75 0c                	jne    63a <printf+0x50>
        state = '%';
 62e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 635:	e9 4a 01 00 00       	jmp    784 <printf+0x19a>
      } else {
        putc(fd, c);
 63a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 63d:	0f be c0             	movsbl %al,%eax
 640:	89 44 24 04          	mov    %eax,0x4(%esp)
 644:	8b 45 08             	mov    0x8(%ebp),%eax
 647:	89 04 24             	mov    %eax,(%esp)
 64a:	e8 bb fe ff ff       	call   50a <putc>
 64f:	e9 30 01 00 00       	jmp    784 <printf+0x19a>
      }
    } else if(state == '%'){
 654:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 658:	0f 85 26 01 00 00    	jne    784 <printf+0x19a>
      if(c == 'd'){
 65e:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 662:	75 2d                	jne    691 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 664:	8b 45 e8             	mov    -0x18(%ebp),%eax
 667:	8b 00                	mov    (%eax),%eax
 669:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 670:	00 
 671:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 678:	00 
 679:	89 44 24 04          	mov    %eax,0x4(%esp)
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
 680:	89 04 24             	mov    %eax,(%esp)
 683:	e8 aa fe ff ff       	call   532 <printint>
        ap++;
 688:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 68c:	e9 ec 00 00 00       	jmp    77d <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 691:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 695:	74 06                	je     69d <printf+0xb3>
 697:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 69b:	75 2d                	jne    6ca <printf+0xe0>
        printint(fd, *ap, 16, 0);
 69d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6a0:	8b 00                	mov    (%eax),%eax
 6a2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6a9:	00 
 6aa:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6b1:	00 
 6b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b6:	8b 45 08             	mov    0x8(%ebp),%eax
 6b9:	89 04 24             	mov    %eax,(%esp)
 6bc:	e8 71 fe ff ff       	call   532 <printint>
        ap++;
 6c1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c5:	e9 b3 00 00 00       	jmp    77d <printf+0x193>
      } else if(c == 's'){
 6ca:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6ce:	75 45                	jne    715 <printf+0x12b>
        s = (char*)*ap;
 6d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6d3:	8b 00                	mov    (%eax),%eax
 6d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6d8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6e0:	75 09                	jne    6eb <printf+0x101>
          s = "(null)";
 6e2:	c7 45 f4 ee 09 00 00 	movl   $0x9ee,-0xc(%ebp)
        while(*s != 0){
 6e9:	eb 1e                	jmp    709 <printf+0x11f>
 6eb:	eb 1c                	jmp    709 <printf+0x11f>
          putc(fd, *s);
 6ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f0:	0f b6 00             	movzbl (%eax),%eax
 6f3:	0f be c0             	movsbl %al,%eax
 6f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fa:	8b 45 08             	mov    0x8(%ebp),%eax
 6fd:	89 04 24             	mov    %eax,(%esp)
 700:	e8 05 fe ff ff       	call   50a <putc>
          s++;
 705:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 709:	8b 45 f4             	mov    -0xc(%ebp),%eax
 70c:	0f b6 00             	movzbl (%eax),%eax
 70f:	84 c0                	test   %al,%al
 711:	75 da                	jne    6ed <printf+0x103>
 713:	eb 68                	jmp    77d <printf+0x193>
        }
      } else if(c == 'c'){
 715:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 719:	75 1d                	jne    738 <printf+0x14e>
        putc(fd, *ap);
 71b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 71e:	8b 00                	mov    (%eax),%eax
 720:	0f be c0             	movsbl %al,%eax
 723:	89 44 24 04          	mov    %eax,0x4(%esp)
 727:	8b 45 08             	mov    0x8(%ebp),%eax
 72a:	89 04 24             	mov    %eax,(%esp)
 72d:	e8 d8 fd ff ff       	call   50a <putc>
        ap++;
 732:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 736:	eb 45                	jmp    77d <printf+0x193>
      } else if(c == '%'){
 738:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 73c:	75 17                	jne    755 <printf+0x16b>
        putc(fd, c);
 73e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 741:	0f be c0             	movsbl %al,%eax
 744:	89 44 24 04          	mov    %eax,0x4(%esp)
 748:	8b 45 08             	mov    0x8(%ebp),%eax
 74b:	89 04 24             	mov    %eax,(%esp)
 74e:	e8 b7 fd ff ff       	call   50a <putc>
 753:	eb 28                	jmp    77d <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 755:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 75c:	00 
 75d:	8b 45 08             	mov    0x8(%ebp),%eax
 760:	89 04 24             	mov    %eax,(%esp)
 763:	e8 a2 fd ff ff       	call   50a <putc>
        putc(fd, c);
 768:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 76b:	0f be c0             	movsbl %al,%eax
 76e:	89 44 24 04          	mov    %eax,0x4(%esp)
 772:	8b 45 08             	mov    0x8(%ebp),%eax
 775:	89 04 24             	mov    %eax,(%esp)
 778:	e8 8d fd ff ff       	call   50a <putc>
      }
      state = 0;
 77d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 784:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 788:	8b 55 0c             	mov    0xc(%ebp),%edx
 78b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78e:	01 d0                	add    %edx,%eax
 790:	0f b6 00             	movzbl (%eax),%eax
 793:	84 c0                	test   %al,%al
 795:	0f 85 71 fe ff ff    	jne    60c <printf+0x22>
    }
  }
}
 79b:	c9                   	leave  
 79c:	c3                   	ret    

0000079d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 79d:	55                   	push   %ebp
 79e:	89 e5                	mov    %esp,%ebp
 7a0:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7a3:	8b 45 08             	mov    0x8(%ebp),%eax
 7a6:	83 e8 08             	sub    $0x8,%eax
 7a9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ac:	a1 a8 0c 00 00       	mov    0xca8,%eax
 7b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7b4:	eb 24                	jmp    7da <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b9:	8b 00                	mov    (%eax),%eax
 7bb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7be:	77 12                	ja     7d2 <free+0x35>
 7c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c6:	77 24                	ja     7ec <free+0x4f>
 7c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cb:	8b 00                	mov    (%eax),%eax
 7cd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7d0:	77 1a                	ja     7ec <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d5:	8b 00                	mov    (%eax),%eax
 7d7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7dd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7e0:	76 d4                	jbe    7b6 <free+0x19>
 7e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e5:	8b 00                	mov    (%eax),%eax
 7e7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ea:	76 ca                	jbe    7b6 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ef:	8b 40 04             	mov    0x4(%eax),%eax
 7f2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fc:	01 c2                	add    %eax,%edx
 7fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 801:	8b 00                	mov    (%eax),%eax
 803:	39 c2                	cmp    %eax,%edx
 805:	75 24                	jne    82b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 807:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80a:	8b 50 04             	mov    0x4(%eax),%edx
 80d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 810:	8b 00                	mov    (%eax),%eax
 812:	8b 40 04             	mov    0x4(%eax),%eax
 815:	01 c2                	add    %eax,%edx
 817:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 81d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 820:	8b 00                	mov    (%eax),%eax
 822:	8b 10                	mov    (%eax),%edx
 824:	8b 45 f8             	mov    -0x8(%ebp),%eax
 827:	89 10                	mov    %edx,(%eax)
 829:	eb 0a                	jmp    835 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 82b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82e:	8b 10                	mov    (%eax),%edx
 830:	8b 45 f8             	mov    -0x8(%ebp),%eax
 833:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 835:	8b 45 fc             	mov    -0x4(%ebp),%eax
 838:	8b 40 04             	mov    0x4(%eax),%eax
 83b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 842:	8b 45 fc             	mov    -0x4(%ebp),%eax
 845:	01 d0                	add    %edx,%eax
 847:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 84a:	75 20                	jne    86c <free+0xcf>
    p->s.size += bp->s.size;
 84c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84f:	8b 50 04             	mov    0x4(%eax),%edx
 852:	8b 45 f8             	mov    -0x8(%ebp),%eax
 855:	8b 40 04             	mov    0x4(%eax),%eax
 858:	01 c2                	add    %eax,%edx
 85a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 860:	8b 45 f8             	mov    -0x8(%ebp),%eax
 863:	8b 10                	mov    (%eax),%edx
 865:	8b 45 fc             	mov    -0x4(%ebp),%eax
 868:	89 10                	mov    %edx,(%eax)
 86a:	eb 08                	jmp    874 <free+0xd7>
  } else
    p->s.ptr = bp;
 86c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 872:	89 10                	mov    %edx,(%eax)
  freep = p;
 874:	8b 45 fc             	mov    -0x4(%ebp),%eax
 877:	a3 a8 0c 00 00       	mov    %eax,0xca8
}
 87c:	c9                   	leave  
 87d:	c3                   	ret    

0000087e <morecore>:

static Header*
morecore(uint nu)
{
 87e:	55                   	push   %ebp
 87f:	89 e5                	mov    %esp,%ebp
 881:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 884:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 88b:	77 07                	ja     894 <morecore+0x16>
    nu = 4096;
 88d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 894:	8b 45 08             	mov    0x8(%ebp),%eax
 897:	c1 e0 03             	shl    $0x3,%eax
 89a:	89 04 24             	mov    %eax,(%esp)
 89d:	e8 40 fc ff ff       	call   4e2 <sbrk>
 8a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8a5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8a9:	75 07                	jne    8b2 <morecore+0x34>
    return 0;
 8ab:	b8 00 00 00 00       	mov    $0x0,%eax
 8b0:	eb 22                	jmp    8d4 <morecore+0x56>
  hp = (Header*)p;
 8b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8bb:	8b 55 08             	mov    0x8(%ebp),%edx
 8be:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c4:	83 c0 08             	add    $0x8,%eax
 8c7:	89 04 24             	mov    %eax,(%esp)
 8ca:	e8 ce fe ff ff       	call   79d <free>
  return freep;
 8cf:	a1 a8 0c 00 00       	mov    0xca8,%eax
}
 8d4:	c9                   	leave  
 8d5:	c3                   	ret    

000008d6 <malloc>:

void*
malloc(uint nbytes)
{
 8d6:	55                   	push   %ebp
 8d7:	89 e5                	mov    %esp,%ebp
 8d9:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8dc:	8b 45 08             	mov    0x8(%ebp),%eax
 8df:	83 c0 07             	add    $0x7,%eax
 8e2:	c1 e8 03             	shr    $0x3,%eax
 8e5:	83 c0 01             	add    $0x1,%eax
 8e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8eb:	a1 a8 0c 00 00       	mov    0xca8,%eax
 8f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8f3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8f7:	75 23                	jne    91c <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8f9:	c7 45 f0 a0 0c 00 00 	movl   $0xca0,-0x10(%ebp)
 900:	8b 45 f0             	mov    -0x10(%ebp),%eax
 903:	a3 a8 0c 00 00       	mov    %eax,0xca8
 908:	a1 a8 0c 00 00       	mov    0xca8,%eax
 90d:	a3 a0 0c 00 00       	mov    %eax,0xca0
    base.s.size = 0;
 912:	c7 05 a4 0c 00 00 00 	movl   $0x0,0xca4
 919:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91f:	8b 00                	mov    (%eax),%eax
 921:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 924:	8b 45 f4             	mov    -0xc(%ebp),%eax
 927:	8b 40 04             	mov    0x4(%eax),%eax
 92a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 92d:	72 4d                	jb     97c <malloc+0xa6>
      if(p->s.size == nunits)
 92f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 932:	8b 40 04             	mov    0x4(%eax),%eax
 935:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 938:	75 0c                	jne    946 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 93a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93d:	8b 10                	mov    (%eax),%edx
 93f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 942:	89 10                	mov    %edx,(%eax)
 944:	eb 26                	jmp    96c <malloc+0x96>
      else {
        p->s.size -= nunits;
 946:	8b 45 f4             	mov    -0xc(%ebp),%eax
 949:	8b 40 04             	mov    0x4(%eax),%eax
 94c:	2b 45 ec             	sub    -0x14(%ebp),%eax
 94f:	89 c2                	mov    %eax,%edx
 951:	8b 45 f4             	mov    -0xc(%ebp),%eax
 954:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 957:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95a:	8b 40 04             	mov    0x4(%eax),%eax
 95d:	c1 e0 03             	shl    $0x3,%eax
 960:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 963:	8b 45 f4             	mov    -0xc(%ebp),%eax
 966:	8b 55 ec             	mov    -0x14(%ebp),%edx
 969:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 96c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 96f:	a3 a8 0c 00 00       	mov    %eax,0xca8
      return (void*)(p + 1);
 974:	8b 45 f4             	mov    -0xc(%ebp),%eax
 977:	83 c0 08             	add    $0x8,%eax
 97a:	eb 38                	jmp    9b4 <malloc+0xde>
    }
    if(p == freep)
 97c:	a1 a8 0c 00 00       	mov    0xca8,%eax
 981:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 984:	75 1b                	jne    9a1 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 986:	8b 45 ec             	mov    -0x14(%ebp),%eax
 989:	89 04 24             	mov    %eax,(%esp)
 98c:	e8 ed fe ff ff       	call   87e <morecore>
 991:	89 45 f4             	mov    %eax,-0xc(%ebp)
 994:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 998:	75 07                	jne    9a1 <malloc+0xcb>
        return 0;
 99a:	b8 00 00 00 00       	mov    $0x0,%eax
 99f:	eb 13                	jmp    9b4 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9aa:	8b 00                	mov    (%eax),%eax
 9ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9af:	e9 70 ff ff ff       	jmp    924 <malloc+0x4e>
}
 9b4:	c9                   	leave  
 9b5:	c3                   	ret    
