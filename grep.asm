
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n, m;
  char *p, *q;

  m = 0;
   6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
   d:	e9 c6 00 00 00       	jmp    d8 <grep+0xd8>
    m += n;
  12:	8b 45 ec             	mov    -0x14(%ebp),%eax
  15:	01 45 f4             	add    %eax,-0xc(%ebp)
    buf[m] = '\0';
  18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1b:	05 a0 0e 00 00       	add    $0xea0,%eax
  20:	c6 00 00             	movb   $0x0,(%eax)
    p = buf;
  23:	c7 45 f0 a0 0e 00 00 	movl   $0xea0,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  2a:	eb 51                	jmp    7d <grep+0x7d>
      *q = 0;
  2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2f:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
  32:	8b 45 f0             	mov    -0x10(%ebp),%eax
  35:	89 44 24 04          	mov    %eax,0x4(%esp)
  39:	8b 45 08             	mov    0x8(%ebp),%eax
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 bc 01 00 00       	call   200 <match>
  44:	85 c0                	test   %eax,%eax
  46:	74 2c                	je     74 <grep+0x74>
        *q = '\n';
  48:	8b 45 e8             	mov    -0x18(%ebp),%eax
  4b:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
  4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  51:	83 c0 01             	add    $0x1,%eax
  54:	89 c2                	mov    %eax,%edx
  56:	8b 45 f0             	mov    -0x10(%ebp),%eax
  59:	29 c2                	sub    %eax,%edx
  5b:	89 d0                	mov    %edx,%eax
  5d:	89 44 24 08          	mov    %eax,0x8(%esp)
  61:	8b 45 f0             	mov    -0x10(%ebp),%eax
  64:	89 44 24 04          	mov    %eax,0x4(%esp)
  68:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6f:	e8 8d 05 00 00       	call   601 <write>
      }
      p = q+1;
  74:	8b 45 e8             	mov    -0x18(%ebp),%eax
  77:	83 c0 01             	add    $0x1,%eax
  7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  7d:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  84:	00 
  85:	8b 45 f0             	mov    -0x10(%ebp),%eax
  88:	89 04 24             	mov    %eax,(%esp)
  8b:	e8 af 03 00 00       	call   43f <strchr>
  90:	89 45 e8             	mov    %eax,-0x18(%ebp)
  93:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  97:	75 93                	jne    2c <grep+0x2c>
    }
    if(p == buf)
  99:	81 7d f0 a0 0e 00 00 	cmpl   $0xea0,-0x10(%ebp)
  a0:	75 07                	jne    a9 <grep+0xa9>
      m = 0;
  a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(m > 0){
  a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  ad:	7e 29                	jle    d8 <grep+0xd8>
      m -= p - buf;
  af:	ba a0 0e 00 00       	mov    $0xea0,%edx
  b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  b7:	29 c2                	sub    %eax,%edx
  b9:	89 d0                	mov    %edx,%eax
  bb:	01 45 f4             	add    %eax,-0xc(%ebp)
      memmove(buf, p, m);
  be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c1:	89 44 24 08          	mov    %eax,0x8(%esp)
  c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c8:	89 44 24 04          	mov    %eax,0x4(%esp)
  cc:	c7 04 24 a0 0e 00 00 	movl   $0xea0,(%esp)
  d3:	e8 ab 04 00 00       	call   583 <memmove>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
  d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  db:	ba ff 03 00 00       	mov    $0x3ff,%edx
  e0:	29 c2                	sub    %eax,%edx
  e2:	89 d0                	mov    %edx,%eax
  e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  e7:	81 c2 a0 0e 00 00    	add    $0xea0,%edx
  ed:	89 44 24 08          	mov    %eax,0x8(%esp)
  f1:	89 54 24 04          	mov    %edx,0x4(%esp)
  f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  f8:	89 04 24             	mov    %eax,(%esp)
  fb:	e8 f9 04 00 00       	call   5f9 <read>
 100:	89 45 ec             	mov    %eax,-0x14(%ebp)
 103:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 107:	0f 8f 05 ff ff ff    	jg     12 <grep+0x12>
    }
  }
}
 10d:	c9                   	leave  
 10e:	c3                   	ret    

0000010f <main>:

int
main(int argc, char *argv[])
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	83 e4 f0             	and    $0xfffffff0,%esp
 115:	83 ec 20             	sub    $0x20,%esp
  int fd, i;
  char *pattern;

  if(argc <= 1){
 118:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 11c:	7f 19                	jg     137 <main+0x28>
    printf(2, "usage: grep pattern [file ...]\n");
 11e:	c7 44 24 04 40 0b 00 	movl   $0xb40,0x4(%esp)
 125:	00 
 126:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 12d:	e8 3f 06 00 00       	call   771 <printf>
    exit();
 132:	e8 aa 04 00 00       	call   5e1 <exit>
  }
  pattern = argv[1];
 137:	8b 45 0c             	mov    0xc(%ebp),%eax
 13a:	8b 40 04             	mov    0x4(%eax),%eax
 13d:	89 44 24 18          	mov    %eax,0x18(%esp)

  if(argc <= 2){
 141:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 145:	7f 19                	jg     160 <main+0x51>
    grep(pattern, 0);
 147:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 14e:	00 
 14f:	8b 44 24 18          	mov    0x18(%esp),%eax
 153:	89 04 24             	mov    %eax,(%esp)
 156:	e8 a5 fe ff ff       	call   0 <grep>
    exit();
 15b:	e8 81 04 00 00       	call   5e1 <exit>
  }

  for(i = 2; i < argc; i++){
 160:	c7 44 24 1c 02 00 00 	movl   $0x2,0x1c(%esp)
 167:	00 
 168:	e9 81 00 00 00       	jmp    1ee <main+0xdf>
    if((fd = open(argv[i], 0)) < 0){
 16d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 171:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 178:	8b 45 0c             	mov    0xc(%ebp),%eax
 17b:	01 d0                	add    %edx,%eax
 17d:	8b 00                	mov    (%eax),%eax
 17f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 186:	00 
 187:	89 04 24             	mov    %eax,(%esp)
 18a:	e8 92 04 00 00       	call   621 <open>
 18f:	89 44 24 14          	mov    %eax,0x14(%esp)
 193:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 198:	79 2f                	jns    1c9 <main+0xba>
      printf(1, "grep: cannot open %s\n", argv[i]);
 19a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 19e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 1a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a8:	01 d0                	add    %edx,%eax
 1aa:	8b 00                	mov    (%eax),%eax
 1ac:	89 44 24 08          	mov    %eax,0x8(%esp)
 1b0:	c7 44 24 04 60 0b 00 	movl   $0xb60,0x4(%esp)
 1b7:	00 
 1b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1bf:	e8 ad 05 00 00       	call   771 <printf>
      exit();
 1c4:	e8 18 04 00 00       	call   5e1 <exit>
    }
    grep(pattern, fd);
 1c9:	8b 44 24 14          	mov    0x14(%esp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8b 44 24 18          	mov    0x18(%esp),%eax
 1d5:	89 04 24             	mov    %eax,(%esp)
 1d8:	e8 23 fe ff ff       	call   0 <grep>
    close(fd);
 1dd:	8b 44 24 14          	mov    0x14(%esp),%eax
 1e1:	89 04 24             	mov    %eax,(%esp)
 1e4:	e8 20 04 00 00       	call   609 <close>
  for(i = 2; i < argc; i++){
 1e9:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1ee:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1f2:	3b 45 08             	cmp    0x8(%ebp),%eax
 1f5:	0f 8c 72 ff ff ff    	jl     16d <main+0x5e>
  }
  exit();
 1fb:	e8 e1 03 00 00       	call   5e1 <exit>

00000200 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '^')
 206:	8b 45 08             	mov    0x8(%ebp),%eax
 209:	0f b6 00             	movzbl (%eax),%eax
 20c:	3c 5e                	cmp    $0x5e,%al
 20e:	75 17                	jne    227 <match+0x27>
    return matchhere(re+1, text);
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	8d 50 01             	lea    0x1(%eax),%edx
 216:	8b 45 0c             	mov    0xc(%ebp),%eax
 219:	89 44 24 04          	mov    %eax,0x4(%esp)
 21d:	89 14 24             	mov    %edx,(%esp)
 220:	e8 36 00 00 00       	call   25b <matchhere>
 225:	eb 32                	jmp    259 <match+0x59>
  do{  // must look at empty string
    if(matchhere(re, text))
 227:	8b 45 0c             	mov    0xc(%ebp),%eax
 22a:	89 44 24 04          	mov    %eax,0x4(%esp)
 22e:	8b 45 08             	mov    0x8(%ebp),%eax
 231:	89 04 24             	mov    %eax,(%esp)
 234:	e8 22 00 00 00       	call   25b <matchhere>
 239:	85 c0                	test   %eax,%eax
 23b:	74 07                	je     244 <match+0x44>
      return 1;
 23d:	b8 01 00 00 00       	mov    $0x1,%eax
 242:	eb 15                	jmp    259 <match+0x59>
  }while(*text++ != '\0');
 244:	8b 45 0c             	mov    0xc(%ebp),%eax
 247:	8d 50 01             	lea    0x1(%eax),%edx
 24a:	89 55 0c             	mov    %edx,0xc(%ebp)
 24d:	0f b6 00             	movzbl (%eax),%eax
 250:	84 c0                	test   %al,%al
 252:	75 d3                	jne    227 <match+0x27>
  return 0;
 254:	b8 00 00 00 00       	mov    $0x0,%eax
}
 259:	c9                   	leave  
 25a:	c3                   	ret    

0000025b <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 25b:	55                   	push   %ebp
 25c:	89 e5                	mov    %esp,%ebp
 25e:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '\0')
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	0f b6 00             	movzbl (%eax),%eax
 267:	84 c0                	test   %al,%al
 269:	75 0a                	jne    275 <matchhere+0x1a>
    return 1;
 26b:	b8 01 00 00 00       	mov    $0x1,%eax
 270:	e9 9b 00 00 00       	jmp    310 <matchhere+0xb5>
  if(re[1] == '*')
 275:	8b 45 08             	mov    0x8(%ebp),%eax
 278:	83 c0 01             	add    $0x1,%eax
 27b:	0f b6 00             	movzbl (%eax),%eax
 27e:	3c 2a                	cmp    $0x2a,%al
 280:	75 24                	jne    2a6 <matchhere+0x4b>
    return matchstar(re[0], re+2, text);
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	8d 48 02             	lea    0x2(%eax),%ecx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	0f be c0             	movsbl %al,%eax
 291:	8b 55 0c             	mov    0xc(%ebp),%edx
 294:	89 54 24 08          	mov    %edx,0x8(%esp)
 298:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 29c:	89 04 24             	mov    %eax,(%esp)
 29f:	e8 6e 00 00 00       	call   312 <matchstar>
 2a4:	eb 6a                	jmp    310 <matchhere+0xb5>
  if(re[0] == '$' && re[1] == '\0')
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	0f b6 00             	movzbl (%eax),%eax
 2ac:	3c 24                	cmp    $0x24,%al
 2ae:	75 1d                	jne    2cd <matchhere+0x72>
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	83 c0 01             	add    $0x1,%eax
 2b6:	0f b6 00             	movzbl (%eax),%eax
 2b9:	84 c0                	test   %al,%al
 2bb:	75 10                	jne    2cd <matchhere+0x72>
    return *text == '\0';
 2bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c0:	0f b6 00             	movzbl (%eax),%eax
 2c3:	84 c0                	test   %al,%al
 2c5:	0f 94 c0             	sete   %al
 2c8:	0f b6 c0             	movzbl %al,%eax
 2cb:	eb 43                	jmp    310 <matchhere+0xb5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 2cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d0:	0f b6 00             	movzbl (%eax),%eax
 2d3:	84 c0                	test   %al,%al
 2d5:	74 34                	je     30b <matchhere+0xb0>
 2d7:	8b 45 08             	mov    0x8(%ebp),%eax
 2da:	0f b6 00             	movzbl (%eax),%eax
 2dd:	3c 2e                	cmp    $0x2e,%al
 2df:	74 10                	je     2f1 <matchhere+0x96>
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	0f b6 10             	movzbl (%eax),%edx
 2e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ea:	0f b6 00             	movzbl (%eax),%eax
 2ed:	38 c2                	cmp    %al,%dl
 2ef:	75 1a                	jne    30b <matchhere+0xb0>
    return matchhere(re+1, text+1);
 2f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f4:	8d 50 01             	lea    0x1(%eax),%edx
 2f7:	8b 45 08             	mov    0x8(%ebp),%eax
 2fa:	83 c0 01             	add    $0x1,%eax
 2fd:	89 54 24 04          	mov    %edx,0x4(%esp)
 301:	89 04 24             	mov    %eax,(%esp)
 304:	e8 52 ff ff ff       	call   25b <matchhere>
 309:	eb 05                	jmp    310 <matchhere+0xb5>
  return 0;
 30b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 310:	c9                   	leave  
 311:	c3                   	ret    

00000312 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
 312:	55                   	push   %ebp
 313:	89 e5                	mov    %esp,%ebp
 315:	83 ec 18             	sub    $0x18,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 318:	8b 45 10             	mov    0x10(%ebp),%eax
 31b:	89 44 24 04          	mov    %eax,0x4(%esp)
 31f:	8b 45 0c             	mov    0xc(%ebp),%eax
 322:	89 04 24             	mov    %eax,(%esp)
 325:	e8 31 ff ff ff       	call   25b <matchhere>
 32a:	85 c0                	test   %eax,%eax
 32c:	74 07                	je     335 <matchstar+0x23>
      return 1;
 32e:	b8 01 00 00 00       	mov    $0x1,%eax
 333:	eb 29                	jmp    35e <matchstar+0x4c>
  }while(*text!='\0' && (*text++==c || c=='.'));
 335:	8b 45 10             	mov    0x10(%ebp),%eax
 338:	0f b6 00             	movzbl (%eax),%eax
 33b:	84 c0                	test   %al,%al
 33d:	74 1a                	je     359 <matchstar+0x47>
 33f:	8b 45 10             	mov    0x10(%ebp),%eax
 342:	8d 50 01             	lea    0x1(%eax),%edx
 345:	89 55 10             	mov    %edx,0x10(%ebp)
 348:	0f b6 00             	movzbl (%eax),%eax
 34b:	0f be c0             	movsbl %al,%eax
 34e:	3b 45 08             	cmp    0x8(%ebp),%eax
 351:	74 c5                	je     318 <matchstar+0x6>
 353:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
 357:	74 bf                	je     318 <matchstar+0x6>
  return 0;
 359:	b8 00 00 00 00       	mov    $0x0,%eax
}
 35e:	c9                   	leave  
 35f:	c3                   	ret    

00000360 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 365:	8b 4d 08             	mov    0x8(%ebp),%ecx
 368:	8b 55 10             	mov    0x10(%ebp),%edx
 36b:	8b 45 0c             	mov    0xc(%ebp),%eax
 36e:	89 cb                	mov    %ecx,%ebx
 370:	89 df                	mov    %ebx,%edi
 372:	89 d1                	mov    %edx,%ecx
 374:	fc                   	cld    
 375:	f3 aa                	rep stos %al,%es:(%edi)
 377:	89 ca                	mov    %ecx,%edx
 379:	89 fb                	mov    %edi,%ebx
 37b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 37e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 381:	5b                   	pop    %ebx
 382:	5f                   	pop    %edi
 383:	5d                   	pop    %ebp
 384:	c3                   	ret    

00000385 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 385:	55                   	push   %ebp
 386:	89 e5                	mov    %esp,%ebp
 388:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 391:	90                   	nop
 392:	8b 45 08             	mov    0x8(%ebp),%eax
 395:	8d 50 01             	lea    0x1(%eax),%edx
 398:	89 55 08             	mov    %edx,0x8(%ebp)
 39b:	8b 55 0c             	mov    0xc(%ebp),%edx
 39e:	8d 4a 01             	lea    0x1(%edx),%ecx
 3a1:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 3a4:	0f b6 12             	movzbl (%edx),%edx
 3a7:	88 10                	mov    %dl,(%eax)
 3a9:	0f b6 00             	movzbl (%eax),%eax
 3ac:	84 c0                	test   %al,%al
 3ae:	75 e2                	jne    392 <strcpy+0xd>
    ;
  return os;
 3b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3b3:	c9                   	leave  
 3b4:	c3                   	ret    

000003b5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b5:	55                   	push   %ebp
 3b6:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3b8:	eb 08                	jmp    3c2 <strcmp+0xd>
    p++, q++;
 3ba:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3be:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	0f b6 00             	movzbl (%eax),%eax
 3c8:	84 c0                	test   %al,%al
 3ca:	74 10                	je     3dc <strcmp+0x27>
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	0f b6 10             	movzbl (%eax),%edx
 3d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d5:	0f b6 00             	movzbl (%eax),%eax
 3d8:	38 c2                	cmp    %al,%dl
 3da:	74 de                	je     3ba <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3dc:	8b 45 08             	mov    0x8(%ebp),%eax
 3df:	0f b6 00             	movzbl (%eax),%eax
 3e2:	0f b6 d0             	movzbl %al,%edx
 3e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e8:	0f b6 00             	movzbl (%eax),%eax
 3eb:	0f b6 c0             	movzbl %al,%eax
 3ee:	29 c2                	sub    %eax,%edx
 3f0:	89 d0                	mov    %edx,%eax
}
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    

000003f4 <strlen>:

uint
strlen(const char *s)
{
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3fa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 401:	eb 04                	jmp    407 <strlen+0x13>
 403:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 407:	8b 55 fc             	mov    -0x4(%ebp),%edx
 40a:	8b 45 08             	mov    0x8(%ebp),%eax
 40d:	01 d0                	add    %edx,%eax
 40f:	0f b6 00             	movzbl (%eax),%eax
 412:	84 c0                	test   %al,%al
 414:	75 ed                	jne    403 <strlen+0xf>
    ;
  return n;
 416:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 419:	c9                   	leave  
 41a:	c3                   	ret    

0000041b <memset>:

void*
memset(void *dst, int c, uint n)
{
 41b:	55                   	push   %ebp
 41c:	89 e5                	mov    %esp,%ebp
 41e:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 421:	8b 45 10             	mov    0x10(%ebp),%eax
 424:	89 44 24 08          	mov    %eax,0x8(%esp)
 428:	8b 45 0c             	mov    0xc(%ebp),%eax
 42b:	89 44 24 04          	mov    %eax,0x4(%esp)
 42f:	8b 45 08             	mov    0x8(%ebp),%eax
 432:	89 04 24             	mov    %eax,(%esp)
 435:	e8 26 ff ff ff       	call   360 <stosb>
  return dst;
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 43d:	c9                   	leave  
 43e:	c3                   	ret    

0000043f <strchr>:

char*
strchr(const char *s, char c)
{
 43f:	55                   	push   %ebp
 440:	89 e5                	mov    %esp,%ebp
 442:	83 ec 04             	sub    $0x4,%esp
 445:	8b 45 0c             	mov    0xc(%ebp),%eax
 448:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 44b:	eb 14                	jmp    461 <strchr+0x22>
    if(*s == c)
 44d:	8b 45 08             	mov    0x8(%ebp),%eax
 450:	0f b6 00             	movzbl (%eax),%eax
 453:	3a 45 fc             	cmp    -0x4(%ebp),%al
 456:	75 05                	jne    45d <strchr+0x1e>
      return (char*)s;
 458:	8b 45 08             	mov    0x8(%ebp),%eax
 45b:	eb 13                	jmp    470 <strchr+0x31>
  for(; *s; s++)
 45d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 461:	8b 45 08             	mov    0x8(%ebp),%eax
 464:	0f b6 00             	movzbl (%eax),%eax
 467:	84 c0                	test   %al,%al
 469:	75 e2                	jne    44d <strchr+0xe>
  return 0;
 46b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 470:	c9                   	leave  
 471:	c3                   	ret    

00000472 <gets>:

char*
gets(char *buf, int max)
{
 472:	55                   	push   %ebp
 473:	89 e5                	mov    %esp,%ebp
 475:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 478:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 47f:	eb 4c                	jmp    4cd <gets+0x5b>
    cc = read(0, &c, 1);
 481:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 488:	00 
 489:	8d 45 ef             	lea    -0x11(%ebp),%eax
 48c:	89 44 24 04          	mov    %eax,0x4(%esp)
 490:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 497:	e8 5d 01 00 00       	call   5f9 <read>
 49c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 49f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a3:	7f 02                	jg     4a7 <gets+0x35>
      break;
 4a5:	eb 31                	jmp    4d8 <gets+0x66>
    buf[i++] = c;
 4a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4aa:	8d 50 01             	lea    0x1(%eax),%edx
 4ad:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4b0:	89 c2                	mov    %eax,%edx
 4b2:	8b 45 08             	mov    0x8(%ebp),%eax
 4b5:	01 c2                	add    %eax,%edx
 4b7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4bb:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4bd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c1:	3c 0a                	cmp    $0xa,%al
 4c3:	74 13                	je     4d8 <gets+0x66>
 4c5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c9:	3c 0d                	cmp    $0xd,%al
 4cb:	74 0b                	je     4d8 <gets+0x66>
  for(i=0; i+1 < max; ){
 4cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d0:	83 c0 01             	add    $0x1,%eax
 4d3:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4d6:	7c a9                	jl     481 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 4d8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4db:	8b 45 08             	mov    0x8(%ebp),%eax
 4de:	01 d0                	add    %edx,%eax
 4e0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e6:	c9                   	leave  
 4e7:	c3                   	ret    

000004e8 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e8:	55                   	push   %ebp
 4e9:	89 e5                	mov    %esp,%ebp
 4eb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4ee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4f5:	00 
 4f6:	8b 45 08             	mov    0x8(%ebp),%eax
 4f9:	89 04 24             	mov    %eax,(%esp)
 4fc:	e8 20 01 00 00       	call   621 <open>
 501:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 504:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 508:	79 07                	jns    511 <stat+0x29>
    return -1;
 50a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 50f:	eb 23                	jmp    534 <stat+0x4c>
  r = fstat(fd, st);
 511:	8b 45 0c             	mov    0xc(%ebp),%eax
 514:	89 44 24 04          	mov    %eax,0x4(%esp)
 518:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51b:	89 04 24             	mov    %eax,(%esp)
 51e:	e8 16 01 00 00       	call   639 <fstat>
 523:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 526:	8b 45 f4             	mov    -0xc(%ebp),%eax
 529:	89 04 24             	mov    %eax,(%esp)
 52c:	e8 d8 00 00 00       	call   609 <close>
  return r;
 531:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 534:	c9                   	leave  
 535:	c3                   	ret    

00000536 <atoi>:

int
atoi(const char *s)
{
 536:	55                   	push   %ebp
 537:	89 e5                	mov    %esp,%ebp
 539:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 53c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 543:	eb 25                	jmp    56a <atoi+0x34>
    n = n*10 + *s++ - '0';
 545:	8b 55 fc             	mov    -0x4(%ebp),%edx
 548:	89 d0                	mov    %edx,%eax
 54a:	c1 e0 02             	shl    $0x2,%eax
 54d:	01 d0                	add    %edx,%eax
 54f:	01 c0                	add    %eax,%eax
 551:	89 c1                	mov    %eax,%ecx
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	8d 50 01             	lea    0x1(%eax),%edx
 559:	89 55 08             	mov    %edx,0x8(%ebp)
 55c:	0f b6 00             	movzbl (%eax),%eax
 55f:	0f be c0             	movsbl %al,%eax
 562:	01 c8                	add    %ecx,%eax
 564:	83 e8 30             	sub    $0x30,%eax
 567:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 56a:	8b 45 08             	mov    0x8(%ebp),%eax
 56d:	0f b6 00             	movzbl (%eax),%eax
 570:	3c 2f                	cmp    $0x2f,%al
 572:	7e 0a                	jle    57e <atoi+0x48>
 574:	8b 45 08             	mov    0x8(%ebp),%eax
 577:	0f b6 00             	movzbl (%eax),%eax
 57a:	3c 39                	cmp    $0x39,%al
 57c:	7e c7                	jle    545 <atoi+0xf>
  return n;
 57e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 581:	c9                   	leave  
 582:	c3                   	ret    

00000583 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 583:	55                   	push   %ebp
 584:	89 e5                	mov    %esp,%ebp
 586:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 58f:	8b 45 0c             	mov    0xc(%ebp),%eax
 592:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 595:	eb 17                	jmp    5ae <memmove+0x2b>
    *dst++ = *src++;
 597:	8b 45 fc             	mov    -0x4(%ebp),%eax
 59a:	8d 50 01             	lea    0x1(%eax),%edx
 59d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 5a0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 5a3:	8d 4a 01             	lea    0x1(%edx),%ecx
 5a6:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5a9:	0f b6 12             	movzbl (%edx),%edx
 5ac:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 5ae:	8b 45 10             	mov    0x10(%ebp),%eax
 5b1:	8d 50 ff             	lea    -0x1(%eax),%edx
 5b4:	89 55 10             	mov    %edx,0x10(%ebp)
 5b7:	85 c0                	test   %eax,%eax
 5b9:	7f dc                	jg     597 <memmove+0x14>
  return vdst;
 5bb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5be:	c9                   	leave  
 5bf:	c3                   	ret    

000005c0 <ps>:


// ** wrapper funcion for print sat table **//
void ps() {
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	81 ec 18 09 00 00    	sub    $0x918,%esp
  pstatTable p;
  getpinfo(&p);
 5c9:	8d 85 f8 f6 ff ff    	lea    -0x908(%ebp),%eax
 5cf:	89 04 24             	mov    %eax,(%esp)
 5d2:	e8 aa 00 00 00       	call   681 <getpinfo>
 5d7:	c9                   	leave  
 5d8:	c3                   	ret    

000005d9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5d9:	b8 01 00 00 00       	mov    $0x1,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <exit>:
SYSCALL(exit)
 5e1:	b8 02 00 00 00       	mov    $0x2,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <wait>:
SYSCALL(wait)
 5e9:	b8 03 00 00 00       	mov    $0x3,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <pipe>:
SYSCALL(pipe)
 5f1:	b8 04 00 00 00       	mov    $0x4,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <read>:
SYSCALL(read)
 5f9:	b8 05 00 00 00       	mov    $0x5,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <write>:
SYSCALL(write)
 601:	b8 10 00 00 00       	mov    $0x10,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <close>:
SYSCALL(close)
 609:	b8 15 00 00 00       	mov    $0x15,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <kill>:
SYSCALL(kill)
 611:	b8 06 00 00 00       	mov    $0x6,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <exec>:
SYSCALL(exec)
 619:	b8 07 00 00 00       	mov    $0x7,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <open>:
SYSCALL(open)
 621:	b8 0f 00 00 00       	mov    $0xf,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <mknod>:
SYSCALL(mknod)
 629:	b8 11 00 00 00       	mov    $0x11,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <unlink>:
SYSCALL(unlink)
 631:	b8 12 00 00 00       	mov    $0x12,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <fstat>:
SYSCALL(fstat)
 639:	b8 08 00 00 00       	mov    $0x8,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <link>:
SYSCALL(link)
 641:	b8 13 00 00 00       	mov    $0x13,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <mkdir>:
SYSCALL(mkdir)
 649:	b8 14 00 00 00       	mov    $0x14,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <chdir>:
SYSCALL(chdir)
 651:	b8 09 00 00 00       	mov    $0x9,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <dup>:
SYSCALL(dup)
 659:	b8 0a 00 00 00       	mov    $0xa,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <getpid>:
SYSCALL(getpid)
 661:	b8 0b 00 00 00       	mov    $0xb,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <sbrk>:
SYSCALL(sbrk)
 669:	b8 0c 00 00 00       	mov    $0xc,%eax
 66e:	cd 40                	int    $0x40
 670:	c3                   	ret    

00000671 <sleep>:
SYSCALL(sleep)
 671:	b8 0d 00 00 00       	mov    $0xd,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <uptime>:
SYSCALL(uptime)
 679:	b8 0e 00 00 00       	mov    $0xe,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    

00000681 <getpinfo>:
SYSCALL(getpinfo)
 681:	b8 16 00 00 00       	mov    $0x16,%eax
 686:	cd 40                	int    $0x40
 688:	c3                   	ret    

00000689 <settickets>:
SYSCALL(settickets)
 689:	b8 17 00 00 00       	mov    $0x17,%eax
 68e:	cd 40                	int    $0x40
 690:	c3                   	ret    

00000691 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 691:	55                   	push   %ebp
 692:	89 e5                	mov    %esp,%ebp
 694:	83 ec 18             	sub    $0x18,%esp
 697:	8b 45 0c             	mov    0xc(%ebp),%eax
 69a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 69d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6a4:	00 
 6a5:	8d 45 f4             	lea    -0xc(%ebp),%eax
 6a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ac:	8b 45 08             	mov    0x8(%ebp),%eax
 6af:	89 04 24             	mov    %eax,(%esp)
 6b2:	e8 4a ff ff ff       	call   601 <write>
}
 6b7:	c9                   	leave  
 6b8:	c3                   	ret    

000006b9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6b9:	55                   	push   %ebp
 6ba:	89 e5                	mov    %esp,%ebp
 6bc:	56                   	push   %esi
 6bd:	53                   	push   %ebx
 6be:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6c1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6c8:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6cc:	74 17                	je     6e5 <printint+0x2c>
 6ce:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6d2:	79 11                	jns    6e5 <printint+0x2c>
    neg = 1;
 6d4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6db:	8b 45 0c             	mov    0xc(%ebp),%eax
 6de:	f7 d8                	neg    %eax
 6e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6e3:	eb 06                	jmp    6eb <printint+0x32>
  } else {
    x = xx;
 6e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 6e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6eb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6f2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6f5:	8d 41 01             	lea    0x1(%ecx),%eax
 6f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6fb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
 701:	ba 00 00 00 00       	mov    $0x0,%edx
 706:	f7 f3                	div    %ebx
 708:	89 d0                	mov    %edx,%eax
 70a:	0f b6 80 64 0e 00 00 	movzbl 0xe64(%eax),%eax
 711:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 715:	8b 75 10             	mov    0x10(%ebp),%esi
 718:	8b 45 ec             	mov    -0x14(%ebp),%eax
 71b:	ba 00 00 00 00       	mov    $0x0,%edx
 720:	f7 f6                	div    %esi
 722:	89 45 ec             	mov    %eax,-0x14(%ebp)
 725:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 729:	75 c7                	jne    6f2 <printint+0x39>
  if(neg)
 72b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 72f:	74 10                	je     741 <printint+0x88>
    buf[i++] = '-';
 731:	8b 45 f4             	mov    -0xc(%ebp),%eax
 734:	8d 50 01             	lea    0x1(%eax),%edx
 737:	89 55 f4             	mov    %edx,-0xc(%ebp)
 73a:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 73f:	eb 1f                	jmp    760 <printint+0xa7>
 741:	eb 1d                	jmp    760 <printint+0xa7>
    putc(fd, buf[i]);
 743:	8d 55 dc             	lea    -0x24(%ebp),%edx
 746:	8b 45 f4             	mov    -0xc(%ebp),%eax
 749:	01 d0                	add    %edx,%eax
 74b:	0f b6 00             	movzbl (%eax),%eax
 74e:	0f be c0             	movsbl %al,%eax
 751:	89 44 24 04          	mov    %eax,0x4(%esp)
 755:	8b 45 08             	mov    0x8(%ebp),%eax
 758:	89 04 24             	mov    %eax,(%esp)
 75b:	e8 31 ff ff ff       	call   691 <putc>
  while(--i >= 0)
 760:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 764:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 768:	79 d9                	jns    743 <printint+0x8a>
}
 76a:	83 c4 30             	add    $0x30,%esp
 76d:	5b                   	pop    %ebx
 76e:	5e                   	pop    %esi
 76f:	5d                   	pop    %ebp
 770:	c3                   	ret    

00000771 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 771:	55                   	push   %ebp
 772:	89 e5                	mov    %esp,%ebp
 774:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 777:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 77e:	8d 45 0c             	lea    0xc(%ebp),%eax
 781:	83 c0 04             	add    $0x4,%eax
 784:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 787:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 78e:	e9 7c 01 00 00       	jmp    90f <printf+0x19e>
    c = fmt[i] & 0xff;
 793:	8b 55 0c             	mov    0xc(%ebp),%edx
 796:	8b 45 f0             	mov    -0x10(%ebp),%eax
 799:	01 d0                	add    %edx,%eax
 79b:	0f b6 00             	movzbl (%eax),%eax
 79e:	0f be c0             	movsbl %al,%eax
 7a1:	25 ff 00 00 00       	and    $0xff,%eax
 7a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 7a9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7ad:	75 2c                	jne    7db <printf+0x6a>
      if(c == '%'){
 7af:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7b3:	75 0c                	jne    7c1 <printf+0x50>
        state = '%';
 7b5:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 7bc:	e9 4a 01 00 00       	jmp    90b <printf+0x19a>
      } else {
        putc(fd, c);
 7c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7c4:	0f be c0             	movsbl %al,%eax
 7c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 7cb:	8b 45 08             	mov    0x8(%ebp),%eax
 7ce:	89 04 24             	mov    %eax,(%esp)
 7d1:	e8 bb fe ff ff       	call   691 <putc>
 7d6:	e9 30 01 00 00       	jmp    90b <printf+0x19a>
      }
    } else if(state == '%'){
 7db:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7df:	0f 85 26 01 00 00    	jne    90b <printf+0x19a>
      if(c == 'd'){
 7e5:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7e9:	75 2d                	jne    818 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 7eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7ee:	8b 00                	mov    (%eax),%eax
 7f0:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7f7:	00 
 7f8:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7ff:	00 
 800:	89 44 24 04          	mov    %eax,0x4(%esp)
 804:	8b 45 08             	mov    0x8(%ebp),%eax
 807:	89 04 24             	mov    %eax,(%esp)
 80a:	e8 aa fe ff ff       	call   6b9 <printint>
        ap++;
 80f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 813:	e9 ec 00 00 00       	jmp    904 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 818:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 81c:	74 06                	je     824 <printf+0xb3>
 81e:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 822:	75 2d                	jne    851 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 824:	8b 45 e8             	mov    -0x18(%ebp),%eax
 827:	8b 00                	mov    (%eax),%eax
 829:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 830:	00 
 831:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 838:	00 
 839:	89 44 24 04          	mov    %eax,0x4(%esp)
 83d:	8b 45 08             	mov    0x8(%ebp),%eax
 840:	89 04 24             	mov    %eax,(%esp)
 843:	e8 71 fe ff ff       	call   6b9 <printint>
        ap++;
 848:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 84c:	e9 b3 00 00 00       	jmp    904 <printf+0x193>
      } else if(c == 's'){
 851:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 855:	75 45                	jne    89c <printf+0x12b>
        s = (char*)*ap;
 857:	8b 45 e8             	mov    -0x18(%ebp),%eax
 85a:	8b 00                	mov    (%eax),%eax
 85c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 85f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 863:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 867:	75 09                	jne    872 <printf+0x101>
          s = "(null)";
 869:	c7 45 f4 76 0b 00 00 	movl   $0xb76,-0xc(%ebp)
        while(*s != 0){
 870:	eb 1e                	jmp    890 <printf+0x11f>
 872:	eb 1c                	jmp    890 <printf+0x11f>
          putc(fd, *s);
 874:	8b 45 f4             	mov    -0xc(%ebp),%eax
 877:	0f b6 00             	movzbl (%eax),%eax
 87a:	0f be c0             	movsbl %al,%eax
 87d:	89 44 24 04          	mov    %eax,0x4(%esp)
 881:	8b 45 08             	mov    0x8(%ebp),%eax
 884:	89 04 24             	mov    %eax,(%esp)
 887:	e8 05 fe ff ff       	call   691 <putc>
          s++;
 88c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 890:	8b 45 f4             	mov    -0xc(%ebp),%eax
 893:	0f b6 00             	movzbl (%eax),%eax
 896:	84 c0                	test   %al,%al
 898:	75 da                	jne    874 <printf+0x103>
 89a:	eb 68                	jmp    904 <printf+0x193>
        }
      } else if(c == 'c'){
 89c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 8a0:	75 1d                	jne    8bf <printf+0x14e>
        putc(fd, *ap);
 8a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8a5:	8b 00                	mov    (%eax),%eax
 8a7:	0f be c0             	movsbl %al,%eax
 8aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 8ae:	8b 45 08             	mov    0x8(%ebp),%eax
 8b1:	89 04 24             	mov    %eax,(%esp)
 8b4:	e8 d8 fd ff ff       	call   691 <putc>
        ap++;
 8b9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8bd:	eb 45                	jmp    904 <printf+0x193>
      } else if(c == '%'){
 8bf:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8c3:	75 17                	jne    8dc <printf+0x16b>
        putc(fd, c);
 8c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8c8:	0f be c0             	movsbl %al,%eax
 8cb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8cf:	8b 45 08             	mov    0x8(%ebp),%eax
 8d2:	89 04 24             	mov    %eax,(%esp)
 8d5:	e8 b7 fd ff ff       	call   691 <putc>
 8da:	eb 28                	jmp    904 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8dc:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8e3:	00 
 8e4:	8b 45 08             	mov    0x8(%ebp),%eax
 8e7:	89 04 24             	mov    %eax,(%esp)
 8ea:	e8 a2 fd ff ff       	call   691 <putc>
        putc(fd, c);
 8ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8f2:	0f be c0             	movsbl %al,%eax
 8f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8f9:	8b 45 08             	mov    0x8(%ebp),%eax
 8fc:	89 04 24             	mov    %eax,(%esp)
 8ff:	e8 8d fd ff ff       	call   691 <putc>
      }
      state = 0;
 904:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 90b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 90f:	8b 55 0c             	mov    0xc(%ebp),%edx
 912:	8b 45 f0             	mov    -0x10(%ebp),%eax
 915:	01 d0                	add    %edx,%eax
 917:	0f b6 00             	movzbl (%eax),%eax
 91a:	84 c0                	test   %al,%al
 91c:	0f 85 71 fe ff ff    	jne    793 <printf+0x22>
    }
  }
}
 922:	c9                   	leave  
 923:	c3                   	ret    

00000924 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 924:	55                   	push   %ebp
 925:	89 e5                	mov    %esp,%ebp
 927:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 92a:	8b 45 08             	mov    0x8(%ebp),%eax
 92d:	83 e8 08             	sub    $0x8,%eax
 930:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 933:	a1 88 0e 00 00       	mov    0xe88,%eax
 938:	89 45 fc             	mov    %eax,-0x4(%ebp)
 93b:	eb 24                	jmp    961 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 93d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 940:	8b 00                	mov    (%eax),%eax
 942:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 945:	77 12                	ja     959 <free+0x35>
 947:	8b 45 f8             	mov    -0x8(%ebp),%eax
 94a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 94d:	77 24                	ja     973 <free+0x4f>
 94f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 952:	8b 00                	mov    (%eax),%eax
 954:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 957:	77 1a                	ja     973 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 959:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95c:	8b 00                	mov    (%eax),%eax
 95e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 961:	8b 45 f8             	mov    -0x8(%ebp),%eax
 964:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 967:	76 d4                	jbe    93d <free+0x19>
 969:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96c:	8b 00                	mov    (%eax),%eax
 96e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 971:	76 ca                	jbe    93d <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 973:	8b 45 f8             	mov    -0x8(%ebp),%eax
 976:	8b 40 04             	mov    0x4(%eax),%eax
 979:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 980:	8b 45 f8             	mov    -0x8(%ebp),%eax
 983:	01 c2                	add    %eax,%edx
 985:	8b 45 fc             	mov    -0x4(%ebp),%eax
 988:	8b 00                	mov    (%eax),%eax
 98a:	39 c2                	cmp    %eax,%edx
 98c:	75 24                	jne    9b2 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 98e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 991:	8b 50 04             	mov    0x4(%eax),%edx
 994:	8b 45 fc             	mov    -0x4(%ebp),%eax
 997:	8b 00                	mov    (%eax),%eax
 999:	8b 40 04             	mov    0x4(%eax),%eax
 99c:	01 c2                	add    %eax,%edx
 99e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9a1:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 9a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a7:	8b 00                	mov    (%eax),%eax
 9a9:	8b 10                	mov    (%eax),%edx
 9ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9ae:	89 10                	mov    %edx,(%eax)
 9b0:	eb 0a                	jmp    9bc <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 9b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b5:	8b 10                	mov    (%eax),%edx
 9b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9ba:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 9bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9bf:	8b 40 04             	mov    0x4(%eax),%eax
 9c2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 9c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9cc:	01 d0                	add    %edx,%eax
 9ce:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9d1:	75 20                	jne    9f3 <free+0xcf>
    p->s.size += bp->s.size;
 9d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d6:	8b 50 04             	mov    0x4(%eax),%edx
 9d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9dc:	8b 40 04             	mov    0x4(%eax),%eax
 9df:	01 c2                	add    %eax,%edx
 9e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9e4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9ea:	8b 10                	mov    (%eax),%edx
 9ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ef:	89 10                	mov    %edx,(%eax)
 9f1:	eb 08                	jmp    9fb <free+0xd7>
  } else
    p->s.ptr = bp;
 9f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9f6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9f9:	89 10                	mov    %edx,(%eax)
  freep = p;
 9fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9fe:	a3 88 0e 00 00       	mov    %eax,0xe88
}
 a03:	c9                   	leave  
 a04:	c3                   	ret    

00000a05 <morecore>:

static Header*
morecore(uint nu)
{
 a05:	55                   	push   %ebp
 a06:	89 e5                	mov    %esp,%ebp
 a08:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 a0b:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 a12:	77 07                	ja     a1b <morecore+0x16>
    nu = 4096;
 a14:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 a1b:	8b 45 08             	mov    0x8(%ebp),%eax
 a1e:	c1 e0 03             	shl    $0x3,%eax
 a21:	89 04 24             	mov    %eax,(%esp)
 a24:	e8 40 fc ff ff       	call   669 <sbrk>
 a29:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 a2c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a30:	75 07                	jne    a39 <morecore+0x34>
    return 0;
 a32:	b8 00 00 00 00       	mov    $0x0,%eax
 a37:	eb 22                	jmp    a5b <morecore+0x56>
  hp = (Header*)p;
 a39:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a42:	8b 55 08             	mov    0x8(%ebp),%edx
 a45:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a48:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a4b:	83 c0 08             	add    $0x8,%eax
 a4e:	89 04 24             	mov    %eax,(%esp)
 a51:	e8 ce fe ff ff       	call   924 <free>
  return freep;
 a56:	a1 88 0e 00 00       	mov    0xe88,%eax
}
 a5b:	c9                   	leave  
 a5c:	c3                   	ret    

00000a5d <malloc>:

void*
malloc(uint nbytes)
{
 a5d:	55                   	push   %ebp
 a5e:	89 e5                	mov    %esp,%ebp
 a60:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a63:	8b 45 08             	mov    0x8(%ebp),%eax
 a66:	83 c0 07             	add    $0x7,%eax
 a69:	c1 e8 03             	shr    $0x3,%eax
 a6c:	83 c0 01             	add    $0x1,%eax
 a6f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a72:	a1 88 0e 00 00       	mov    0xe88,%eax
 a77:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a7a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a7e:	75 23                	jne    aa3 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a80:	c7 45 f0 80 0e 00 00 	movl   $0xe80,-0x10(%ebp)
 a87:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a8a:	a3 88 0e 00 00       	mov    %eax,0xe88
 a8f:	a1 88 0e 00 00       	mov    0xe88,%eax
 a94:	a3 80 0e 00 00       	mov    %eax,0xe80
    base.s.size = 0;
 a99:	c7 05 84 0e 00 00 00 	movl   $0x0,0xe84
 aa0:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aa6:	8b 00                	mov    (%eax),%eax
 aa8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 aab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aae:	8b 40 04             	mov    0x4(%eax),%eax
 ab1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 ab4:	72 4d                	jb     b03 <malloc+0xa6>
      if(p->s.size == nunits)
 ab6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab9:	8b 40 04             	mov    0x4(%eax),%eax
 abc:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 abf:	75 0c                	jne    acd <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 ac1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac4:	8b 10                	mov    (%eax),%edx
 ac6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ac9:	89 10                	mov    %edx,(%eax)
 acb:	eb 26                	jmp    af3 <malloc+0x96>
      else {
        p->s.size -= nunits;
 acd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad0:	8b 40 04             	mov    0x4(%eax),%eax
 ad3:	2b 45 ec             	sub    -0x14(%ebp),%eax
 ad6:	89 c2                	mov    %eax,%edx
 ad8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 adb:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ade:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae1:	8b 40 04             	mov    0x4(%eax),%eax
 ae4:	c1 e0 03             	shl    $0x3,%eax
 ae7:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aed:	8b 55 ec             	mov    -0x14(%ebp),%edx
 af0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 af3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 af6:	a3 88 0e 00 00       	mov    %eax,0xe88
      return (void*)(p + 1);
 afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 afe:	83 c0 08             	add    $0x8,%eax
 b01:	eb 38                	jmp    b3b <malloc+0xde>
    }
    if(p == freep)
 b03:	a1 88 0e 00 00       	mov    0xe88,%eax
 b08:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 b0b:	75 1b                	jne    b28 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 b0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b10:	89 04 24             	mov    %eax,(%esp)
 b13:	e8 ed fe ff ff       	call   a05 <morecore>
 b18:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b1b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b1f:	75 07                	jne    b28 <malloc+0xcb>
        return 0;
 b21:	b8 00 00 00 00       	mov    $0x0,%eax
 b26:	eb 13                	jmp    b3b <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b28:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b31:	8b 00                	mov    (%eax),%eax
 b33:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 b36:	e9 70 ff ff ff       	jmp    aab <malloc+0x4e>
}
 b3b:	c9                   	leave  
 b3c:	c3                   	ret    
