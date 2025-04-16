
_schedtest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

#define startingArg 2

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 3c             	sub    $0x3c,%esp
  13:	89 cb                	mov    %ecx,%ebx
    // case 1 no or not enough args
    if(argc <= 2) {
  15:	83 3b 02             	cmpl   $0x2,(%ebx)
  18:	7f 19                	jg     33 <main+0x33>
         printf(1, "usage: schedtest loops tickets 1 [ tickets2 ... ticketsN ]\n \
  1a:	c7 44 24 04 c8 09 00 	movl   $0x9c8,0x4(%esp)
  21:	00 
  22:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  29:	e8 cb 05 00 00       	call   5f9 <printf>
        loops must be greater than 0\n \
        tickets must be greater than or equal to 10\n \
        up to 7 tickets can be provided\n");

        exit();
  2e:	e8 36 04 00 00       	call   469 <exit>
    }

    int i = 0;
  33:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    int numOfProcesses = argc - startingArg; // argc = 2 means 1 arg.
  3a:	8b 03                	mov    (%ebx),%eax
  3c:	83 e8 02             	sub    $0x2,%eax
  3f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    int loops = atoi(argv[1]); // first arg is looping
  42:	8b 43 04             	mov    0x4(%ebx),%eax
  45:	83 c0 04             	add    $0x4,%eax
  48:	8b 00                	mov    (%eax),%eax
  4a:	89 04 24             	mov    %eax,(%esp)
  4d:	e8 6c 03 00 00       	call   3be <atoi>
  52:	89 45 dc             	mov    %eax,-0x24(%ebp)

    printf(1, "loop count: %d\n", loops);
  55:	8b 45 dc             	mov    -0x24(%ebp),%eax
  58:	89 44 24 08          	mov    %eax,0x8(%esp)
  5c:	c7 44 24 04 88 0a 00 	movl   $0xa88,0x4(%esp)
  63:	00 
  64:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6b:	e8 89 05 00 00       	call   5f9 <printf>
    
    /** error checking **/
    if(loops <= 0) {
  70:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  74:	7f 19                	jg     8f <main+0x8f>
        printf(1, "loops must be >= 0\n");
  76:	c7 44 24 04 98 0a 00 	movl   $0xa98,0x4(%esp)
  7d:	00 
  7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  85:	e8 6f 05 00 00       	call   5f9 <printf>
        exit();
  8a:	e8 da 03 00 00       	call   469 <exit>
    }

    if(numOfProcesses > 7) {
  8f:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
  93:	7e 19                	jle    ae <main+0xae>
        printf(1, "too many processes. up to 7 can be provided\n");
  95:	c7 44 24 04 ac 0a 00 	movl   $0xaac,0x4(%esp)
  9c:	00 
  9d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a4:	e8 50 05 00 00       	call   5f9 <printf>
        exit();
  a9:	e8 bb 03 00 00       	call   469 <exit>
    } 

    for(i = 0; i < numOfProcesses; i++) {
  ae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  b5:	eb 3e                	jmp    f5 <main+0xf5>
        if(atoi(argv[i + startingArg]) < 10) {
  b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  ba:	83 c0 02             	add    $0x2,%eax
  bd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c4:	8b 43 04             	mov    0x4(%ebx),%eax
  c7:	01 d0                	add    %edx,%eax
  c9:	8b 00                	mov    (%eax),%eax
  cb:	89 04 24             	mov    %eax,(%esp)
  ce:	e8 eb 02 00 00       	call   3be <atoi>
  d3:	83 f8 09             	cmp    $0x9,%eax
  d6:	7f 19                	jg     f1 <main+0xf1>
            printf(1, "tickets must be >= 10\n");
  d8:	c7 44 24 04 d9 0a 00 	movl   $0xad9,0x4(%esp)
  df:	00 
  e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e7:	e8 0d 05 00 00       	call   5f9 <printf>
            exit();
  ec:	e8 78 03 00 00       	call   469 <exit>
    for(i = 0; i < numOfProcesses; i++) {
  f1:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  f8:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  fb:	7c ba                	jl     b7 <main+0xb7>
    }

    /** safe args **/

    int pid;
    int pids[numOfProcesses];
  fd:	8b 45 e0             	mov    -0x20(%ebp),%eax
 100:	8d 50 ff             	lea    -0x1(%eax),%edx
 103:	89 55 d8             	mov    %edx,-0x28(%ebp)
 106:	c1 e0 02             	shl    $0x2,%eax
 109:	8d 50 03             	lea    0x3(%eax),%edx
 10c:	b8 10 00 00 00       	mov    $0x10,%eax
 111:	83 e8 01             	sub    $0x1,%eax
 114:	01 d0                	add    %edx,%eax
 116:	be 10 00 00 00       	mov    $0x10,%esi
 11b:	ba 00 00 00 00       	mov    $0x0,%edx
 120:	f7 f6                	div    %esi
 122:	6b c0 10             	imul   $0x10,%eax,%eax
 125:	29 c4                	sub    %eax,%esp
 127:	8d 44 24 0c          	lea    0xc(%esp),%eax
 12b:	83 c0 03             	add    $0x3,%eax
 12e:	c1 e8 02             	shr    $0x2,%eax
 131:	c1 e0 02             	shl    $0x2,%eax
 134:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    int tickets;
    for(i = 0; i < numOfProcesses; i++) {
 137:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 13e:	eb 4a                	jmp    18a <main+0x18a>

        pid = fork();                        // create child process
 140:	e8 1c 03 00 00       	call   461 <fork>
 145:	89 45 d0             	mov    %eax,-0x30(%ebp)
        tickets = atoi(argv[i + startingArg]); // get ticket #
 148:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 14b:	83 c0 02             	add    $0x2,%eax
 14e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 155:	8b 43 04             	mov    0x4(%ebx),%eax
 158:	01 d0                	add    %edx,%eax
 15a:	8b 00                	mov    (%eax),%eax
 15c:	89 04 24             	mov    %eax,(%esp)
 15f:	e8 5a 02 00 00       	call   3be <atoi>
 164:	89 45 cc             	mov    %eax,-0x34(%ebp)

        if(pid == 0) {                       // im a child process
 167:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
 16b:	75 0d                	jne    17a <main+0x17a>
            settickets(tickets);             // set tickets
 16d:	8b 45 cc             	mov    -0x34(%ebp),%eax
 170:	89 04 24             	mov    %eax,(%esp)
 173:	e8 99 03 00 00       	call   511 <settickets>
            while(1);                      // infinite loop           
 178:	eb fe                	jmp    178 <main+0x178>
        }

        pids[i] = pid; // parent will add this to kill pids
 17a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 17d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 180:	8b 4d d0             	mov    -0x30(%ebp),%ecx
 183:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
    for(i = 0; i < numOfProcesses; i++) {
 186:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 18a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 18d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 190:	7c ae                	jl     140 <main+0x140>
    }
   
    for(i = 0; i < loops; i++) {
 192:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 199:	eb 15                	jmp    1b0 <main+0x1b0>
        ps();
 19b:	e8 a8 02 00 00       	call   448 <ps>
        sleep(3);
 1a0:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 1a7:	e8 4d 03 00 00       	call   4f9 <sleep>
    for(i = 0; i < loops; i++) {
 1ac:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 1b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 1b3:	3b 45 dc             	cmp    -0x24(%ebp),%eax
 1b6:	7c e3                	jl     19b <main+0x19b>
        //printf(1, "loop num: %d\n", i);
    }

    for(i = 0; i < numOfProcesses; i++) {
 1b8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1bf:	eb 1a                	jmp    1db <main+0x1db>
        kill(pids[i]);
 1c1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 1c4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1c7:	8b 04 90             	mov    (%eax,%edx,4),%eax
 1ca:	89 04 24             	mov    %eax,(%esp)
 1cd:	e8 c7 02 00 00       	call   499 <kill>
        //printf(1, "value of pid killed: %d\n", pids[i]);
        wait();
 1d2:	e8 9a 02 00 00       	call   471 <wait>
    for(i = 0; i < numOfProcesses; i++) {
 1d7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 1db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 1de:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 1e1:	7c de                	jl     1c1 <main+0x1c1>
    }

    exit();
 1e3:	e8 81 02 00 00       	call   469 <exit>

000001e8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1e8:	55                   	push   %ebp
 1e9:	89 e5                	mov    %esp,%ebp
 1eb:	57                   	push   %edi
 1ec:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f0:	8b 55 10             	mov    0x10(%ebp),%edx
 1f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f6:	89 cb                	mov    %ecx,%ebx
 1f8:	89 df                	mov    %ebx,%edi
 1fa:	89 d1                	mov    %edx,%ecx
 1fc:	fc                   	cld    
 1fd:	f3 aa                	rep stos %al,%es:(%edi)
 1ff:	89 ca                	mov    %ecx,%edx
 201:	89 fb                	mov    %edi,%ebx
 203:	89 5d 08             	mov    %ebx,0x8(%ebp)
 206:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 209:	5b                   	pop    %ebx
 20a:	5f                   	pop    %edi
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret    

0000020d <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 20d:	55                   	push   %ebp
 20e:	89 e5                	mov    %esp,%ebp
 210:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 219:	90                   	nop
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
 21d:	8d 50 01             	lea    0x1(%eax),%edx
 220:	89 55 08             	mov    %edx,0x8(%ebp)
 223:	8b 55 0c             	mov    0xc(%ebp),%edx
 226:	8d 4a 01             	lea    0x1(%edx),%ecx
 229:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 22c:	0f b6 12             	movzbl (%edx),%edx
 22f:	88 10                	mov    %dl,(%eax)
 231:	0f b6 00             	movzbl (%eax),%eax
 234:	84 c0                	test   %al,%al
 236:	75 e2                	jne    21a <strcpy+0xd>
    ;
  return os;
 238:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 23b:	c9                   	leave  
 23c:	c3                   	ret    

0000023d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 23d:	55                   	push   %ebp
 23e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 240:	eb 08                	jmp    24a <strcmp+0xd>
    p++, q++;
 242:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 246:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 24a:	8b 45 08             	mov    0x8(%ebp),%eax
 24d:	0f b6 00             	movzbl (%eax),%eax
 250:	84 c0                	test   %al,%al
 252:	74 10                	je     264 <strcmp+0x27>
 254:	8b 45 08             	mov    0x8(%ebp),%eax
 257:	0f b6 10             	movzbl (%eax),%edx
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	0f b6 00             	movzbl (%eax),%eax
 260:	38 c2                	cmp    %al,%dl
 262:	74 de                	je     242 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	0f b6 00             	movzbl (%eax),%eax
 26a:	0f b6 d0             	movzbl %al,%edx
 26d:	8b 45 0c             	mov    0xc(%ebp),%eax
 270:	0f b6 00             	movzbl (%eax),%eax
 273:	0f b6 c0             	movzbl %al,%eax
 276:	29 c2                	sub    %eax,%edx
 278:	89 d0                	mov    %edx,%eax
}
 27a:	5d                   	pop    %ebp
 27b:	c3                   	ret    

0000027c <strlen>:

uint
strlen(const char *s)
{
 27c:	55                   	push   %ebp
 27d:	89 e5                	mov    %esp,%ebp
 27f:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 282:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 289:	eb 04                	jmp    28f <strlen+0x13>
 28b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 28f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 292:	8b 45 08             	mov    0x8(%ebp),%eax
 295:	01 d0                	add    %edx,%eax
 297:	0f b6 00             	movzbl (%eax),%eax
 29a:	84 c0                	test   %al,%al
 29c:	75 ed                	jne    28b <strlen+0xf>
    ;
  return n;
 29e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2a1:	c9                   	leave  
 2a2:	c3                   	ret    

000002a3 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 2a9:	8b 45 10             	mov    0x10(%ebp),%eax
 2ac:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 2b7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ba:	89 04 24             	mov    %eax,(%esp)
 2bd:	e8 26 ff ff ff       	call   1e8 <stosb>
  return dst;
 2c2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c5:	c9                   	leave  
 2c6:	c3                   	ret    

000002c7 <strchr>:

char*
strchr(const char *s, char c)
{
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
 2ca:	83 ec 04             	sub    $0x4,%esp
 2cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d0:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2d3:	eb 14                	jmp    2e9 <strchr+0x22>
    if(*s == c)
 2d5:	8b 45 08             	mov    0x8(%ebp),%eax
 2d8:	0f b6 00             	movzbl (%eax),%eax
 2db:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2de:	75 05                	jne    2e5 <strchr+0x1e>
      return (char*)s;
 2e0:	8b 45 08             	mov    0x8(%ebp),%eax
 2e3:	eb 13                	jmp    2f8 <strchr+0x31>
  for(; *s; s++)
 2e5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2e9:	8b 45 08             	mov    0x8(%ebp),%eax
 2ec:	0f b6 00             	movzbl (%eax),%eax
 2ef:	84 c0                	test   %al,%al
 2f1:	75 e2                	jne    2d5 <strchr+0xe>
  return 0;
 2f3:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2f8:	c9                   	leave  
 2f9:	c3                   	ret    

000002fa <gets>:

char*
gets(char *buf, int max)
{
 2fa:	55                   	push   %ebp
 2fb:	89 e5                	mov    %esp,%ebp
 2fd:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 300:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 307:	eb 4c                	jmp    355 <gets+0x5b>
    cc = read(0, &c, 1);
 309:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 310:	00 
 311:	8d 45 ef             	lea    -0x11(%ebp),%eax
 314:	89 44 24 04          	mov    %eax,0x4(%esp)
 318:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 31f:	e8 5d 01 00 00       	call   481 <read>
 324:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 327:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 32b:	7f 02                	jg     32f <gets+0x35>
      break;
 32d:	eb 31                	jmp    360 <gets+0x66>
    buf[i++] = c;
 32f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 332:	8d 50 01             	lea    0x1(%eax),%edx
 335:	89 55 f4             	mov    %edx,-0xc(%ebp)
 338:	89 c2                	mov    %eax,%edx
 33a:	8b 45 08             	mov    0x8(%ebp),%eax
 33d:	01 c2                	add    %eax,%edx
 33f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 343:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 345:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 349:	3c 0a                	cmp    $0xa,%al
 34b:	74 13                	je     360 <gets+0x66>
 34d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 351:	3c 0d                	cmp    $0xd,%al
 353:	74 0b                	je     360 <gets+0x66>
  for(i=0; i+1 < max; ){
 355:	8b 45 f4             	mov    -0xc(%ebp),%eax
 358:	83 c0 01             	add    $0x1,%eax
 35b:	3b 45 0c             	cmp    0xc(%ebp),%eax
 35e:	7c a9                	jl     309 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 360:	8b 55 f4             	mov    -0xc(%ebp),%edx
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	01 d0                	add    %edx,%eax
 368:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 36b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36e:	c9                   	leave  
 36f:	c3                   	ret    

00000370 <stat>:

int
stat(const char *n, struct stat *st)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 376:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 37d:	00 
 37e:	8b 45 08             	mov    0x8(%ebp),%eax
 381:	89 04 24             	mov    %eax,(%esp)
 384:	e8 20 01 00 00       	call   4a9 <open>
 389:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 38c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 390:	79 07                	jns    399 <stat+0x29>
    return -1;
 392:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 397:	eb 23                	jmp    3bc <stat+0x4c>
  r = fstat(fd, st);
 399:	8b 45 0c             	mov    0xc(%ebp),%eax
 39c:	89 44 24 04          	mov    %eax,0x4(%esp)
 3a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a3:	89 04 24             	mov    %eax,(%esp)
 3a6:	e8 16 01 00 00       	call   4c1 <fstat>
 3ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 3ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3b1:	89 04 24             	mov    %eax,(%esp)
 3b4:	e8 d8 00 00 00       	call   491 <close>
  return r;
 3b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3bc:	c9                   	leave  
 3bd:	c3                   	ret    

000003be <atoi>:

int
atoi(const char *s)
{
 3be:	55                   	push   %ebp
 3bf:	89 e5                	mov    %esp,%ebp
 3c1:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3c4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3cb:	eb 25                	jmp    3f2 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3cd:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3d0:	89 d0                	mov    %edx,%eax
 3d2:	c1 e0 02             	shl    $0x2,%eax
 3d5:	01 d0                	add    %edx,%eax
 3d7:	01 c0                	add    %eax,%eax
 3d9:	89 c1                	mov    %eax,%ecx
 3db:	8b 45 08             	mov    0x8(%ebp),%eax
 3de:	8d 50 01             	lea    0x1(%eax),%edx
 3e1:	89 55 08             	mov    %edx,0x8(%ebp)
 3e4:	0f b6 00             	movzbl (%eax),%eax
 3e7:	0f be c0             	movsbl %al,%eax
 3ea:	01 c8                	add    %ecx,%eax
 3ec:	83 e8 30             	sub    $0x30,%eax
 3ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3f2:	8b 45 08             	mov    0x8(%ebp),%eax
 3f5:	0f b6 00             	movzbl (%eax),%eax
 3f8:	3c 2f                	cmp    $0x2f,%al
 3fa:	7e 0a                	jle    406 <atoi+0x48>
 3fc:	8b 45 08             	mov    0x8(%ebp),%eax
 3ff:	0f b6 00             	movzbl (%eax),%eax
 402:	3c 39                	cmp    $0x39,%al
 404:	7e c7                	jle    3cd <atoi+0xf>
  return n;
 406:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 409:	c9                   	leave  
 40a:	c3                   	ret    

0000040b <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
 40e:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 411:	8b 45 08             	mov    0x8(%ebp),%eax
 414:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 417:	8b 45 0c             	mov    0xc(%ebp),%eax
 41a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 41d:	eb 17                	jmp    436 <memmove+0x2b>
    *dst++ = *src++;
 41f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 422:	8d 50 01             	lea    0x1(%eax),%edx
 425:	89 55 fc             	mov    %edx,-0x4(%ebp)
 428:	8b 55 f8             	mov    -0x8(%ebp),%edx
 42b:	8d 4a 01             	lea    0x1(%edx),%ecx
 42e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 431:	0f b6 12             	movzbl (%edx),%edx
 434:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 436:	8b 45 10             	mov    0x10(%ebp),%eax
 439:	8d 50 ff             	lea    -0x1(%eax),%edx
 43c:	89 55 10             	mov    %edx,0x10(%ebp)
 43f:	85 c0                	test   %eax,%eax
 441:	7f dc                	jg     41f <memmove+0x14>
  return vdst;
 443:	8b 45 08             	mov    0x8(%ebp),%eax
}
 446:	c9                   	leave  
 447:	c3                   	ret    

00000448 <ps>:


// ** wrapper funcion for print sat table **//
void ps() {
 448:	55                   	push   %ebp
 449:	89 e5                	mov    %esp,%ebp
 44b:	81 ec 18 09 00 00    	sub    $0x918,%esp
  pstatTable p;
  getpinfo(&p);
 451:	8d 85 f8 f6 ff ff    	lea    -0x908(%ebp),%eax
 457:	89 04 24             	mov    %eax,(%esp)
 45a:	e8 aa 00 00 00       	call   509 <getpinfo>
 45f:	c9                   	leave  
 460:	c3                   	ret    

00000461 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 461:	b8 01 00 00 00       	mov    $0x1,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <exit>:
SYSCALL(exit)
 469:	b8 02 00 00 00       	mov    $0x2,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <wait>:
SYSCALL(wait)
 471:	b8 03 00 00 00       	mov    $0x3,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <pipe>:
SYSCALL(pipe)
 479:	b8 04 00 00 00       	mov    $0x4,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <read>:
SYSCALL(read)
 481:	b8 05 00 00 00       	mov    $0x5,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <write>:
SYSCALL(write)
 489:	b8 10 00 00 00       	mov    $0x10,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <close>:
SYSCALL(close)
 491:	b8 15 00 00 00       	mov    $0x15,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <kill>:
SYSCALL(kill)
 499:	b8 06 00 00 00       	mov    $0x6,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <exec>:
SYSCALL(exec)
 4a1:	b8 07 00 00 00       	mov    $0x7,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <open>:
SYSCALL(open)
 4a9:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <mknod>:
SYSCALL(mknod)
 4b1:	b8 11 00 00 00       	mov    $0x11,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <unlink>:
SYSCALL(unlink)
 4b9:	b8 12 00 00 00       	mov    $0x12,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <fstat>:
SYSCALL(fstat)
 4c1:	b8 08 00 00 00       	mov    $0x8,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <link>:
SYSCALL(link)
 4c9:	b8 13 00 00 00       	mov    $0x13,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <mkdir>:
SYSCALL(mkdir)
 4d1:	b8 14 00 00 00       	mov    $0x14,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <chdir>:
SYSCALL(chdir)
 4d9:	b8 09 00 00 00       	mov    $0x9,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <dup>:
SYSCALL(dup)
 4e1:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <getpid>:
SYSCALL(getpid)
 4e9:	b8 0b 00 00 00       	mov    $0xb,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <sbrk>:
SYSCALL(sbrk)
 4f1:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <sleep>:
SYSCALL(sleep)
 4f9:	b8 0d 00 00 00       	mov    $0xd,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <uptime>:
SYSCALL(uptime)
 501:	b8 0e 00 00 00       	mov    $0xe,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    

00000509 <getpinfo>:
SYSCALL(getpinfo)
 509:	b8 16 00 00 00       	mov    $0x16,%eax
 50e:	cd 40                	int    $0x40
 510:	c3                   	ret    

00000511 <settickets>:
SYSCALL(settickets)
 511:	b8 17 00 00 00       	mov    $0x17,%eax
 516:	cd 40                	int    $0x40
 518:	c3                   	ret    

00000519 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 519:	55                   	push   %ebp
 51a:	89 e5                	mov    %esp,%ebp
 51c:	83 ec 18             	sub    $0x18,%esp
 51f:	8b 45 0c             	mov    0xc(%ebp),%eax
 522:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 525:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 52c:	00 
 52d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 530:	89 44 24 04          	mov    %eax,0x4(%esp)
 534:	8b 45 08             	mov    0x8(%ebp),%eax
 537:	89 04 24             	mov    %eax,(%esp)
 53a:	e8 4a ff ff ff       	call   489 <write>
}
 53f:	c9                   	leave  
 540:	c3                   	ret    

00000541 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 541:	55                   	push   %ebp
 542:	89 e5                	mov    %esp,%ebp
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 549:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 550:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 554:	74 17                	je     56d <printint+0x2c>
 556:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 55a:	79 11                	jns    56d <printint+0x2c>
    neg = 1;
 55c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 563:	8b 45 0c             	mov    0xc(%ebp),%eax
 566:	f7 d8                	neg    %eax
 568:	89 45 ec             	mov    %eax,-0x14(%ebp)
 56b:	eb 06                	jmp    573 <printint+0x32>
  } else {
    x = xx;
 56d:	8b 45 0c             	mov    0xc(%ebp),%eax
 570:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 573:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 57a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 57d:	8d 41 01             	lea    0x1(%ecx),%eax
 580:	89 45 f4             	mov    %eax,-0xc(%ebp)
 583:	8b 5d 10             	mov    0x10(%ebp),%ebx
 586:	8b 45 ec             	mov    -0x14(%ebp),%eax
 589:	ba 00 00 00 00       	mov    $0x0,%edx
 58e:	f7 f3                	div    %ebx
 590:	89 d0                	mov    %edx,%eax
 592:	0f b6 80 6c 0d 00 00 	movzbl 0xd6c(%eax),%eax
 599:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 59d:	8b 75 10             	mov    0x10(%ebp),%esi
 5a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5a3:	ba 00 00 00 00       	mov    $0x0,%edx
 5a8:	f7 f6                	div    %esi
 5aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5ad:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b1:	75 c7                	jne    57a <printint+0x39>
  if(neg)
 5b3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5b7:	74 10                	je     5c9 <printint+0x88>
    buf[i++] = '-';
 5b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5bc:	8d 50 01             	lea    0x1(%eax),%edx
 5bf:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5c2:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5c7:	eb 1f                	jmp    5e8 <printint+0xa7>
 5c9:	eb 1d                	jmp    5e8 <printint+0xa7>
    putc(fd, buf[i]);
 5cb:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5d1:	01 d0                	add    %edx,%eax
 5d3:	0f b6 00             	movzbl (%eax),%eax
 5d6:	0f be c0             	movsbl %al,%eax
 5d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5dd:	8b 45 08             	mov    0x8(%ebp),%eax
 5e0:	89 04 24             	mov    %eax,(%esp)
 5e3:	e8 31 ff ff ff       	call   519 <putc>
  while(--i >= 0)
 5e8:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5ec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5f0:	79 d9                	jns    5cb <printint+0x8a>
}
 5f2:	83 c4 30             	add    $0x30,%esp
 5f5:	5b                   	pop    %ebx
 5f6:	5e                   	pop    %esi
 5f7:	5d                   	pop    %ebp
 5f8:	c3                   	ret    

000005f9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5f9:	55                   	push   %ebp
 5fa:	89 e5                	mov    %esp,%ebp
 5fc:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5ff:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 606:	8d 45 0c             	lea    0xc(%ebp),%eax
 609:	83 c0 04             	add    $0x4,%eax
 60c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 60f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 616:	e9 7c 01 00 00       	jmp    797 <printf+0x19e>
    c = fmt[i] & 0xff;
 61b:	8b 55 0c             	mov    0xc(%ebp),%edx
 61e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 621:	01 d0                	add    %edx,%eax
 623:	0f b6 00             	movzbl (%eax),%eax
 626:	0f be c0             	movsbl %al,%eax
 629:	25 ff 00 00 00       	and    $0xff,%eax
 62e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 631:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 635:	75 2c                	jne    663 <printf+0x6a>
      if(c == '%'){
 637:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 63b:	75 0c                	jne    649 <printf+0x50>
        state = '%';
 63d:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 644:	e9 4a 01 00 00       	jmp    793 <printf+0x19a>
      } else {
        putc(fd, c);
 649:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 64c:	0f be c0             	movsbl %al,%eax
 64f:	89 44 24 04          	mov    %eax,0x4(%esp)
 653:	8b 45 08             	mov    0x8(%ebp),%eax
 656:	89 04 24             	mov    %eax,(%esp)
 659:	e8 bb fe ff ff       	call   519 <putc>
 65e:	e9 30 01 00 00       	jmp    793 <printf+0x19a>
      }
    } else if(state == '%'){
 663:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 667:	0f 85 26 01 00 00    	jne    793 <printf+0x19a>
      if(c == 'd'){
 66d:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 671:	75 2d                	jne    6a0 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 673:	8b 45 e8             	mov    -0x18(%ebp),%eax
 676:	8b 00                	mov    (%eax),%eax
 678:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 67f:	00 
 680:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 687:	00 
 688:	89 44 24 04          	mov    %eax,0x4(%esp)
 68c:	8b 45 08             	mov    0x8(%ebp),%eax
 68f:	89 04 24             	mov    %eax,(%esp)
 692:	e8 aa fe ff ff       	call   541 <printint>
        ap++;
 697:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 69b:	e9 ec 00 00 00       	jmp    78c <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6a0:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6a4:	74 06                	je     6ac <printf+0xb3>
 6a6:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6aa:	75 2d                	jne    6d9 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6af:	8b 00                	mov    (%eax),%eax
 6b1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6b8:	00 
 6b9:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6c0:	00 
 6c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c5:	8b 45 08             	mov    0x8(%ebp),%eax
 6c8:	89 04 24             	mov    %eax,(%esp)
 6cb:	e8 71 fe ff ff       	call   541 <printint>
        ap++;
 6d0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6d4:	e9 b3 00 00 00       	jmp    78c <printf+0x193>
      } else if(c == 's'){
 6d9:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6dd:	75 45                	jne    724 <printf+0x12b>
        s = (char*)*ap;
 6df:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6e2:	8b 00                	mov    (%eax),%eax
 6e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6e7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6eb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6ef:	75 09                	jne    6fa <printf+0x101>
          s = "(null)";
 6f1:	c7 45 f4 f0 0a 00 00 	movl   $0xaf0,-0xc(%ebp)
        while(*s != 0){
 6f8:	eb 1e                	jmp    718 <printf+0x11f>
 6fa:	eb 1c                	jmp    718 <printf+0x11f>
          putc(fd, *s);
 6fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ff:	0f b6 00             	movzbl (%eax),%eax
 702:	0f be c0             	movsbl %al,%eax
 705:	89 44 24 04          	mov    %eax,0x4(%esp)
 709:	8b 45 08             	mov    0x8(%ebp),%eax
 70c:	89 04 24             	mov    %eax,(%esp)
 70f:	e8 05 fe ff ff       	call   519 <putc>
          s++;
 714:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 718:	8b 45 f4             	mov    -0xc(%ebp),%eax
 71b:	0f b6 00             	movzbl (%eax),%eax
 71e:	84 c0                	test   %al,%al
 720:	75 da                	jne    6fc <printf+0x103>
 722:	eb 68                	jmp    78c <printf+0x193>
        }
      } else if(c == 'c'){
 724:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 728:	75 1d                	jne    747 <printf+0x14e>
        putc(fd, *ap);
 72a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 72d:	8b 00                	mov    (%eax),%eax
 72f:	0f be c0             	movsbl %al,%eax
 732:	89 44 24 04          	mov    %eax,0x4(%esp)
 736:	8b 45 08             	mov    0x8(%ebp),%eax
 739:	89 04 24             	mov    %eax,(%esp)
 73c:	e8 d8 fd ff ff       	call   519 <putc>
        ap++;
 741:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 745:	eb 45                	jmp    78c <printf+0x193>
      } else if(c == '%'){
 747:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 74b:	75 17                	jne    764 <printf+0x16b>
        putc(fd, c);
 74d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 750:	0f be c0             	movsbl %al,%eax
 753:	89 44 24 04          	mov    %eax,0x4(%esp)
 757:	8b 45 08             	mov    0x8(%ebp),%eax
 75a:	89 04 24             	mov    %eax,(%esp)
 75d:	e8 b7 fd ff ff       	call   519 <putc>
 762:	eb 28                	jmp    78c <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 764:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 76b:	00 
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
 76f:	89 04 24             	mov    %eax,(%esp)
 772:	e8 a2 fd ff ff       	call   519 <putc>
        putc(fd, c);
 777:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 77a:	0f be c0             	movsbl %al,%eax
 77d:	89 44 24 04          	mov    %eax,0x4(%esp)
 781:	8b 45 08             	mov    0x8(%ebp),%eax
 784:	89 04 24             	mov    %eax,(%esp)
 787:	e8 8d fd ff ff       	call   519 <putc>
      }
      state = 0;
 78c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 793:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 797:	8b 55 0c             	mov    0xc(%ebp),%edx
 79a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79d:	01 d0                	add    %edx,%eax
 79f:	0f b6 00             	movzbl (%eax),%eax
 7a2:	84 c0                	test   %al,%al
 7a4:	0f 85 71 fe ff ff    	jne    61b <printf+0x22>
    }
  }
}
 7aa:	c9                   	leave  
 7ab:	c3                   	ret    

000007ac <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ac:	55                   	push   %ebp
 7ad:	89 e5                	mov    %esp,%ebp
 7af:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7b2:	8b 45 08             	mov    0x8(%ebp),%eax
 7b5:	83 e8 08             	sub    $0x8,%eax
 7b8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7bb:	a1 88 0d 00 00       	mov    0xd88,%eax
 7c0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7c3:	eb 24                	jmp    7e9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c8:	8b 00                	mov    (%eax),%eax
 7ca:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7cd:	77 12                	ja     7e1 <free+0x35>
 7cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7d5:	77 24                	ja     7fb <free+0x4f>
 7d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7da:	8b 00                	mov    (%eax),%eax
 7dc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7df:	77 1a                	ja     7fb <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e4:	8b 00                	mov    (%eax),%eax
 7e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ec:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ef:	76 d4                	jbe    7c5 <free+0x19>
 7f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f4:	8b 00                	mov    (%eax),%eax
 7f6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7f9:	76 ca                	jbe    7c5 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fe:	8b 40 04             	mov    0x4(%eax),%eax
 801:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 808:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80b:	01 c2                	add    %eax,%edx
 80d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 810:	8b 00                	mov    (%eax),%eax
 812:	39 c2                	cmp    %eax,%edx
 814:	75 24                	jne    83a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 816:	8b 45 f8             	mov    -0x8(%ebp),%eax
 819:	8b 50 04             	mov    0x4(%eax),%edx
 81c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81f:	8b 00                	mov    (%eax),%eax
 821:	8b 40 04             	mov    0x4(%eax),%eax
 824:	01 c2                	add    %eax,%edx
 826:	8b 45 f8             	mov    -0x8(%ebp),%eax
 829:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 82c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82f:	8b 00                	mov    (%eax),%eax
 831:	8b 10                	mov    (%eax),%edx
 833:	8b 45 f8             	mov    -0x8(%ebp),%eax
 836:	89 10                	mov    %edx,(%eax)
 838:	eb 0a                	jmp    844 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 83a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83d:	8b 10                	mov    (%eax),%edx
 83f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 842:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 844:	8b 45 fc             	mov    -0x4(%ebp),%eax
 847:	8b 40 04             	mov    0x4(%eax),%eax
 84a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 851:	8b 45 fc             	mov    -0x4(%ebp),%eax
 854:	01 d0                	add    %edx,%eax
 856:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 859:	75 20                	jne    87b <free+0xcf>
    p->s.size += bp->s.size;
 85b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85e:	8b 50 04             	mov    0x4(%eax),%edx
 861:	8b 45 f8             	mov    -0x8(%ebp),%eax
 864:	8b 40 04             	mov    0x4(%eax),%eax
 867:	01 c2                	add    %eax,%edx
 869:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 86f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 872:	8b 10                	mov    (%eax),%edx
 874:	8b 45 fc             	mov    -0x4(%ebp),%eax
 877:	89 10                	mov    %edx,(%eax)
 879:	eb 08                	jmp    883 <free+0xd7>
  } else
    p->s.ptr = bp;
 87b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 881:	89 10                	mov    %edx,(%eax)
  freep = p;
 883:	8b 45 fc             	mov    -0x4(%ebp),%eax
 886:	a3 88 0d 00 00       	mov    %eax,0xd88
}
 88b:	c9                   	leave  
 88c:	c3                   	ret    

0000088d <morecore>:

static Header*
morecore(uint nu)
{
 88d:	55                   	push   %ebp
 88e:	89 e5                	mov    %esp,%ebp
 890:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 893:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 89a:	77 07                	ja     8a3 <morecore+0x16>
    nu = 4096;
 89c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8a3:	8b 45 08             	mov    0x8(%ebp),%eax
 8a6:	c1 e0 03             	shl    $0x3,%eax
 8a9:	89 04 24             	mov    %eax,(%esp)
 8ac:	e8 40 fc ff ff       	call   4f1 <sbrk>
 8b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8b4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8b8:	75 07                	jne    8c1 <morecore+0x34>
    return 0;
 8ba:	b8 00 00 00 00       	mov    $0x0,%eax
 8bf:	eb 22                	jmp    8e3 <morecore+0x56>
  hp = (Header*)p;
 8c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ca:	8b 55 08             	mov    0x8(%ebp),%edx
 8cd:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d3:	83 c0 08             	add    $0x8,%eax
 8d6:	89 04 24             	mov    %eax,(%esp)
 8d9:	e8 ce fe ff ff       	call   7ac <free>
  return freep;
 8de:	a1 88 0d 00 00       	mov    0xd88,%eax
}
 8e3:	c9                   	leave  
 8e4:	c3                   	ret    

000008e5 <malloc>:

void*
malloc(uint nbytes)
{
 8e5:	55                   	push   %ebp
 8e6:	89 e5                	mov    %esp,%ebp
 8e8:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8eb:	8b 45 08             	mov    0x8(%ebp),%eax
 8ee:	83 c0 07             	add    $0x7,%eax
 8f1:	c1 e8 03             	shr    $0x3,%eax
 8f4:	83 c0 01             	add    $0x1,%eax
 8f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8fa:	a1 88 0d 00 00       	mov    0xd88,%eax
 8ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
 902:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 906:	75 23                	jne    92b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 908:	c7 45 f0 80 0d 00 00 	movl   $0xd80,-0x10(%ebp)
 90f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 912:	a3 88 0d 00 00       	mov    %eax,0xd88
 917:	a1 88 0d 00 00       	mov    0xd88,%eax
 91c:	a3 80 0d 00 00       	mov    %eax,0xd80
    base.s.size = 0;
 921:	c7 05 84 0d 00 00 00 	movl   $0x0,0xd84
 928:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92e:	8b 00                	mov    (%eax),%eax
 930:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 933:	8b 45 f4             	mov    -0xc(%ebp),%eax
 936:	8b 40 04             	mov    0x4(%eax),%eax
 939:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 93c:	72 4d                	jb     98b <malloc+0xa6>
      if(p->s.size == nunits)
 93e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 941:	8b 40 04             	mov    0x4(%eax),%eax
 944:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 947:	75 0c                	jne    955 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 949:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94c:	8b 10                	mov    (%eax),%edx
 94e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 951:	89 10                	mov    %edx,(%eax)
 953:	eb 26                	jmp    97b <malloc+0x96>
      else {
        p->s.size -= nunits;
 955:	8b 45 f4             	mov    -0xc(%ebp),%eax
 958:	8b 40 04             	mov    0x4(%eax),%eax
 95b:	2b 45 ec             	sub    -0x14(%ebp),%eax
 95e:	89 c2                	mov    %eax,%edx
 960:	8b 45 f4             	mov    -0xc(%ebp),%eax
 963:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 966:	8b 45 f4             	mov    -0xc(%ebp),%eax
 969:	8b 40 04             	mov    0x4(%eax),%eax
 96c:	c1 e0 03             	shl    $0x3,%eax
 96f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 972:	8b 45 f4             	mov    -0xc(%ebp),%eax
 975:	8b 55 ec             	mov    -0x14(%ebp),%edx
 978:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 97b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97e:	a3 88 0d 00 00       	mov    %eax,0xd88
      return (void*)(p + 1);
 983:	8b 45 f4             	mov    -0xc(%ebp),%eax
 986:	83 c0 08             	add    $0x8,%eax
 989:	eb 38                	jmp    9c3 <malloc+0xde>
    }
    if(p == freep)
 98b:	a1 88 0d 00 00       	mov    0xd88,%eax
 990:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 993:	75 1b                	jne    9b0 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 995:	8b 45 ec             	mov    -0x14(%ebp),%eax
 998:	89 04 24             	mov    %eax,(%esp)
 99b:	e8 ed fe ff ff       	call   88d <morecore>
 9a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9a3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9a7:	75 07                	jne    9b0 <malloc+0xcb>
        return 0;
 9a9:	b8 00 00 00 00       	mov    $0x0,%eax
 9ae:	eb 13                	jmp    9c3 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b9:	8b 00                	mov    (%eax),%eax
 9bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9be:	e9 70 ff ff ff       	jmp    933 <malloc+0x4e>
}
 9c3:	c9                   	leave  
 9c4:	c3                   	ret    
