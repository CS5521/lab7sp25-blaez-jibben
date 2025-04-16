
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 24             	sub    $0x24,%esp
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   7:	8b 45 08             	mov    0x8(%ebp),%eax
   a:	89 04 24             	mov    %eax,(%esp)
   d:	e8 dd 03 00 00       	call   3ef <strlen>
  12:	8b 55 08             	mov    0x8(%ebp),%edx
  15:	01 d0                	add    %edx,%eax
  17:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1a:	eb 04                	jmp    20 <fmtname+0x20>
  1c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  23:	3b 45 08             	cmp    0x8(%ebp),%eax
  26:	72 0a                	jb     32 <fmtname+0x32>
  28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2b:	0f b6 00             	movzbl (%eax),%eax
  2e:	3c 2f                	cmp    $0x2f,%al
  30:	75 ea                	jne    1c <fmtname+0x1c>
    ;
  p++;
  32:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  39:	89 04 24             	mov    %eax,(%esp)
  3c:	e8 ae 03 00 00       	call   3ef <strlen>
  41:	83 f8 0d             	cmp    $0xd,%eax
  44:	76 05                	jbe    4b <fmtname+0x4b>
    return p;
  46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  49:	eb 5f                	jmp    aa <fmtname+0xaa>
  memmove(buf, p, strlen(p));
  4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  4e:	89 04 24             	mov    %eax,(%esp)
  51:	e8 99 03 00 00       	call   3ef <strlen>
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  61:	c7 04 24 58 0e 00 00 	movl   $0xe58,(%esp)
  68:	e8 11 05 00 00       	call   57e <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  70:	89 04 24             	mov    %eax,(%esp)
  73:	e8 77 03 00 00       	call   3ef <strlen>
  78:	ba 0e 00 00 00       	mov    $0xe,%edx
  7d:	89 d3                	mov    %edx,%ebx
  7f:	29 c3                	sub    %eax,%ebx
  81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  84:	89 04 24             	mov    %eax,(%esp)
  87:	e8 63 03 00 00       	call   3ef <strlen>
  8c:	05 58 0e 00 00       	add    $0xe58,%eax
  91:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  95:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9c:	00 
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 71 03 00 00       	call   416 <memset>
  return buf;
  a5:	b8 58 0e 00 00       	mov    $0xe58,%eax
}
  aa:	83 c4 24             	add    $0x24,%esp
  ad:	5b                   	pop    %ebx
  ae:	5d                   	pop    %ebp
  af:	c3                   	ret    

000000b0 <ls>:

void
ls(char *path)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	81 ec 5c 02 00 00    	sub    $0x25c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c3:	00 
  c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c7:	89 04 24             	mov    %eax,(%esp)
  ca:	e8 4d 05 00 00       	call   61c <open>
  cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  d6:	79 20                	jns    f8 <ls+0x48>
    printf(2, "ls: cannot open %s\n", path);
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	89 44 24 08          	mov    %eax,0x8(%esp)
  df:	c7 44 24 04 38 0b 00 	movl   $0xb38,0x4(%esp)
  e6:	00 
  e7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ee:	e8 79 06 00 00       	call   76c <printf>
    return;
  f3:	e9 01 02 00 00       	jmp    2f9 <ls+0x249>
  }

  if(fstat(fd, &st) < 0){
  f8:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
  fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 102:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 105:	89 04 24             	mov    %eax,(%esp)
 108:	e8 27 05 00 00       	call   634 <fstat>
 10d:	85 c0                	test   %eax,%eax
 10f:	79 2b                	jns    13c <ls+0x8c>
    printf(2, "ls: cannot stat %s\n", path);
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	89 44 24 08          	mov    %eax,0x8(%esp)
 118:	c7 44 24 04 4c 0b 00 	movl   $0xb4c,0x4(%esp)
 11f:	00 
 120:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 127:	e8 40 06 00 00       	call   76c <printf>
    close(fd);
 12c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 12f:	89 04 24             	mov    %eax,(%esp)
 132:	e8 cd 04 00 00       	call   604 <close>
    return;
 137:	e9 bd 01 00 00       	jmp    2f9 <ls+0x249>
  }

  switch(st.type){
 13c:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 143:	98                   	cwtl   
 144:	83 f8 01             	cmp    $0x1,%eax
 147:	74 53                	je     19c <ls+0xec>
 149:	83 f8 02             	cmp    $0x2,%eax
 14c:	0f 85 9c 01 00 00    	jne    2ee <ls+0x23e>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 152:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 158:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 15e:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 165:	0f bf d8             	movswl %ax,%ebx
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	89 04 24             	mov    %eax,(%esp)
 16e:	e8 8d fe ff ff       	call   0 <fmtname>
 173:	89 7c 24 14          	mov    %edi,0x14(%esp)
 177:	89 74 24 10          	mov    %esi,0x10(%esp)
 17b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 17f:	89 44 24 08          	mov    %eax,0x8(%esp)
 183:	c7 44 24 04 60 0b 00 	movl   $0xb60,0x4(%esp)
 18a:	00 
 18b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 192:	e8 d5 05 00 00       	call   76c <printf>
    break;
 197:	e9 52 01 00 00       	jmp    2ee <ls+0x23e>

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 48 02 00 00       	call   3ef <strlen>
 1a7:	83 c0 10             	add    $0x10,%eax
 1aa:	3d 00 02 00 00       	cmp    $0x200,%eax
 1af:	76 19                	jbe    1ca <ls+0x11a>
      printf(1, "ls: path too long\n");
 1b1:	c7 44 24 04 6d 0b 00 	movl   $0xb6d,0x4(%esp)
 1b8:	00 
 1b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c0:	e8 a7 05 00 00       	call   76c <printf>
      break;
 1c5:	e9 24 01 00 00       	jmp    2ee <ls+0x23e>
    }
    strcpy(buf, path);
 1ca:	8b 45 08             	mov    0x8(%ebp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1d7:	89 04 24             	mov    %eax,(%esp)
 1da:	e8 a1 01 00 00       	call   380 <strcpy>
    p = buf+strlen(buf);
 1df:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1e5:	89 04 24             	mov    %eax,(%esp)
 1e8:	e8 02 02 00 00       	call   3ef <strlen>
 1ed:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
 1f3:	01 d0                	add    %edx,%eax
 1f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1f8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1fb:	8d 50 01             	lea    0x1(%eax),%edx
 1fe:	89 55 e0             	mov    %edx,-0x20(%ebp)
 201:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 204:	e9 be 00 00 00       	jmp    2c7 <ls+0x217>
      if(de.inum == 0)
 209:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 210:	66 85 c0             	test   %ax,%ax
 213:	75 05                	jne    21a <ls+0x16a>
        continue;
 215:	e9 ad 00 00 00       	jmp    2c7 <ls+0x217>
      memmove(p, de.name, DIRSIZ);
 21a:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 221:	00 
 222:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 228:	83 c0 02             	add    $0x2,%eax
 22b:	89 44 24 04          	mov    %eax,0x4(%esp)
 22f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 232:	89 04 24             	mov    %eax,(%esp)
 235:	e8 44 03 00 00       	call   57e <memmove>
      p[DIRSIZ] = 0;
 23a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 23d:	83 c0 0e             	add    $0xe,%eax
 240:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 243:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 253:	89 04 24             	mov    %eax,(%esp)
 256:	e8 88 02 00 00       	call   4e3 <stat>
 25b:	85 c0                	test   %eax,%eax
 25d:	79 20                	jns    27f <ls+0x1cf>
        printf(1, "ls: cannot stat %s\n", buf);
 25f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 265:	89 44 24 08          	mov    %eax,0x8(%esp)
 269:	c7 44 24 04 4c 0b 00 	movl   $0xb4c,0x4(%esp)
 270:	00 
 271:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 278:	e8 ef 04 00 00       	call   76c <printf>
        continue;
 27d:	eb 48                	jmp    2c7 <ls+0x217>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 27f:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 285:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 28b:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 292:	0f bf d8             	movswl %ax,%ebx
 295:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 29b:	89 04 24             	mov    %eax,(%esp)
 29e:	e8 5d fd ff ff       	call   0 <fmtname>
 2a3:	89 7c 24 14          	mov    %edi,0x14(%esp)
 2a7:	89 74 24 10          	mov    %esi,0x10(%esp)
 2ab:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 2af:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b3:	c7 44 24 04 60 0b 00 	movl   $0xb60,0x4(%esp)
 2ba:	00 
 2bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c2:	e8 a5 04 00 00       	call   76c <printf>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2c7:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 2ce:	00 
 2cf:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2dc:	89 04 24             	mov    %eax,(%esp)
 2df:	e8 10 03 00 00       	call   5f4 <read>
 2e4:	83 f8 10             	cmp    $0x10,%eax
 2e7:	0f 84 1c ff ff ff    	je     209 <ls+0x159>
    }
    break;
 2ed:	90                   	nop
  }
  close(fd);
 2ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2f1:	89 04 24             	mov    %eax,(%esp)
 2f4:	e8 0b 03 00 00       	call   604 <close>
}
 2f9:	81 c4 5c 02 00 00    	add    $0x25c,%esp
 2ff:	5b                   	pop    %ebx
 300:	5e                   	pop    %esi
 301:	5f                   	pop    %edi
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    

00000304 <main>:

int
main(int argc, char *argv[])
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	83 e4 f0             	and    $0xfffffff0,%esp
 30a:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
 30d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 311:	7f 11                	jg     324 <main+0x20>
    ls(".");
 313:	c7 04 24 80 0b 00 00 	movl   $0xb80,(%esp)
 31a:	e8 91 fd ff ff       	call   b0 <ls>
    exit();
 31f:	e8 b8 02 00 00       	call   5dc <exit>
  }
  for(i=1; i<argc; i++)
 324:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 32b:	00 
 32c:	eb 1f                	jmp    34d <main+0x49>
    ls(argv[i]);
 32e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 332:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 339:	8b 45 0c             	mov    0xc(%ebp),%eax
 33c:	01 d0                	add    %edx,%eax
 33e:	8b 00                	mov    (%eax),%eax
 340:	89 04 24             	mov    %eax,(%esp)
 343:	e8 68 fd ff ff       	call   b0 <ls>
  for(i=1; i<argc; i++)
 348:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 34d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 351:	3b 45 08             	cmp    0x8(%ebp),%eax
 354:	7c d8                	jl     32e <main+0x2a>
  exit();
 356:	e8 81 02 00 00       	call   5dc <exit>

0000035b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	57                   	push   %edi
 35f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 360:	8b 4d 08             	mov    0x8(%ebp),%ecx
 363:	8b 55 10             	mov    0x10(%ebp),%edx
 366:	8b 45 0c             	mov    0xc(%ebp),%eax
 369:	89 cb                	mov    %ecx,%ebx
 36b:	89 df                	mov    %ebx,%edi
 36d:	89 d1                	mov    %edx,%ecx
 36f:	fc                   	cld    
 370:	f3 aa                	rep stos %al,%es:(%edi)
 372:	89 ca                	mov    %ecx,%edx
 374:	89 fb                	mov    %edi,%ebx
 376:	89 5d 08             	mov    %ebx,0x8(%ebp)
 379:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 37c:	5b                   	pop    %ebx
 37d:	5f                   	pop    %edi
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    

00000380 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 386:	8b 45 08             	mov    0x8(%ebp),%eax
 389:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 38c:	90                   	nop
 38d:	8b 45 08             	mov    0x8(%ebp),%eax
 390:	8d 50 01             	lea    0x1(%eax),%edx
 393:	89 55 08             	mov    %edx,0x8(%ebp)
 396:	8b 55 0c             	mov    0xc(%ebp),%edx
 399:	8d 4a 01             	lea    0x1(%edx),%ecx
 39c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 39f:	0f b6 12             	movzbl (%edx),%edx
 3a2:	88 10                	mov    %dl,(%eax)
 3a4:	0f b6 00             	movzbl (%eax),%eax
 3a7:	84 c0                	test   %al,%al
 3a9:	75 e2                	jne    38d <strcpy+0xd>
    ;
  return os;
 3ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ae:	c9                   	leave  
 3af:	c3                   	ret    

000003b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3b3:	eb 08                	jmp    3bd <strcmp+0xd>
    p++, q++;
 3b5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3b9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	0f b6 00             	movzbl (%eax),%eax
 3c3:	84 c0                	test   %al,%al
 3c5:	74 10                	je     3d7 <strcmp+0x27>
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 10             	movzbl (%eax),%edx
 3cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d0:	0f b6 00             	movzbl (%eax),%eax
 3d3:	38 c2                	cmp    %al,%dl
 3d5:	74 de                	je     3b5 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3d7:	8b 45 08             	mov    0x8(%ebp),%eax
 3da:	0f b6 00             	movzbl (%eax),%eax
 3dd:	0f b6 d0             	movzbl %al,%edx
 3e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e3:	0f b6 00             	movzbl (%eax),%eax
 3e6:	0f b6 c0             	movzbl %al,%eax
 3e9:	29 c2                	sub    %eax,%edx
 3eb:	89 d0                	mov    %edx,%eax
}
 3ed:	5d                   	pop    %ebp
 3ee:	c3                   	ret    

000003ef <strlen>:

uint
strlen(const char *s)
{
 3ef:	55                   	push   %ebp
 3f0:	89 e5                	mov    %esp,%ebp
 3f2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3f5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3fc:	eb 04                	jmp    402 <strlen+0x13>
 3fe:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 402:	8b 55 fc             	mov    -0x4(%ebp),%edx
 405:	8b 45 08             	mov    0x8(%ebp),%eax
 408:	01 d0                	add    %edx,%eax
 40a:	0f b6 00             	movzbl (%eax),%eax
 40d:	84 c0                	test   %al,%al
 40f:	75 ed                	jne    3fe <strlen+0xf>
    ;
  return n;
 411:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <memset>:

void*
memset(void *dst, int c, uint n)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 41c:	8b 45 10             	mov    0x10(%ebp),%eax
 41f:	89 44 24 08          	mov    %eax,0x8(%esp)
 423:	8b 45 0c             	mov    0xc(%ebp),%eax
 426:	89 44 24 04          	mov    %eax,0x4(%esp)
 42a:	8b 45 08             	mov    0x8(%ebp),%eax
 42d:	89 04 24             	mov    %eax,(%esp)
 430:	e8 26 ff ff ff       	call   35b <stosb>
  return dst;
 435:	8b 45 08             	mov    0x8(%ebp),%eax
}
 438:	c9                   	leave  
 439:	c3                   	ret    

0000043a <strchr>:

char*
strchr(const char *s, char c)
{
 43a:	55                   	push   %ebp
 43b:	89 e5                	mov    %esp,%ebp
 43d:	83 ec 04             	sub    $0x4,%esp
 440:	8b 45 0c             	mov    0xc(%ebp),%eax
 443:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 446:	eb 14                	jmp    45c <strchr+0x22>
    if(*s == c)
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	0f b6 00             	movzbl (%eax),%eax
 44e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 451:	75 05                	jne    458 <strchr+0x1e>
      return (char*)s;
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	eb 13                	jmp    46b <strchr+0x31>
  for(; *s; s++)
 458:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 45c:	8b 45 08             	mov    0x8(%ebp),%eax
 45f:	0f b6 00             	movzbl (%eax),%eax
 462:	84 c0                	test   %al,%al
 464:	75 e2                	jne    448 <strchr+0xe>
  return 0;
 466:	b8 00 00 00 00       	mov    $0x0,%eax
}
 46b:	c9                   	leave  
 46c:	c3                   	ret    

0000046d <gets>:

char*
gets(char *buf, int max)
{
 46d:	55                   	push   %ebp
 46e:	89 e5                	mov    %esp,%ebp
 470:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 473:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 47a:	eb 4c                	jmp    4c8 <gets+0x5b>
    cc = read(0, &c, 1);
 47c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 483:	00 
 484:	8d 45 ef             	lea    -0x11(%ebp),%eax
 487:	89 44 24 04          	mov    %eax,0x4(%esp)
 48b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 492:	e8 5d 01 00 00       	call   5f4 <read>
 497:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 49a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 49e:	7f 02                	jg     4a2 <gets+0x35>
      break;
 4a0:	eb 31                	jmp    4d3 <gets+0x66>
    buf[i++] = c;
 4a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a5:	8d 50 01             	lea    0x1(%eax),%edx
 4a8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4ab:	89 c2                	mov    %eax,%edx
 4ad:	8b 45 08             	mov    0x8(%ebp),%eax
 4b0:	01 c2                	add    %eax,%edx
 4b2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4b6:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4b8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4bc:	3c 0a                	cmp    $0xa,%al
 4be:	74 13                	je     4d3 <gets+0x66>
 4c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c4:	3c 0d                	cmp    $0xd,%al
 4c6:	74 0b                	je     4d3 <gets+0x66>
  for(i=0; i+1 < max; ){
 4c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4cb:	83 c0 01             	add    $0x1,%eax
 4ce:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4d1:	7c a9                	jl     47c <gets+0xf>
      break;
  }
  buf[i] = '\0';
 4d3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
 4d9:	01 d0                	add    %edx,%eax
 4db:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4de:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e1:	c9                   	leave  
 4e2:	c3                   	ret    

000004e3 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e3:	55                   	push   %ebp
 4e4:	89 e5                	mov    %esp,%ebp
 4e6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4f0:	00 
 4f1:	8b 45 08             	mov    0x8(%ebp),%eax
 4f4:	89 04 24             	mov    %eax,(%esp)
 4f7:	e8 20 01 00 00       	call   61c <open>
 4fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 503:	79 07                	jns    50c <stat+0x29>
    return -1;
 505:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 50a:	eb 23                	jmp    52f <stat+0x4c>
  r = fstat(fd, st);
 50c:	8b 45 0c             	mov    0xc(%ebp),%eax
 50f:	89 44 24 04          	mov    %eax,0x4(%esp)
 513:	8b 45 f4             	mov    -0xc(%ebp),%eax
 516:	89 04 24             	mov    %eax,(%esp)
 519:	e8 16 01 00 00       	call   634 <fstat>
 51e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 521:	8b 45 f4             	mov    -0xc(%ebp),%eax
 524:	89 04 24             	mov    %eax,(%esp)
 527:	e8 d8 00 00 00       	call   604 <close>
  return r;
 52c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 52f:	c9                   	leave  
 530:	c3                   	ret    

00000531 <atoi>:

int
atoi(const char *s)
{
 531:	55                   	push   %ebp
 532:	89 e5                	mov    %esp,%ebp
 534:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 537:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 53e:	eb 25                	jmp    565 <atoi+0x34>
    n = n*10 + *s++ - '0';
 540:	8b 55 fc             	mov    -0x4(%ebp),%edx
 543:	89 d0                	mov    %edx,%eax
 545:	c1 e0 02             	shl    $0x2,%eax
 548:	01 d0                	add    %edx,%eax
 54a:	01 c0                	add    %eax,%eax
 54c:	89 c1                	mov    %eax,%ecx
 54e:	8b 45 08             	mov    0x8(%ebp),%eax
 551:	8d 50 01             	lea    0x1(%eax),%edx
 554:	89 55 08             	mov    %edx,0x8(%ebp)
 557:	0f b6 00             	movzbl (%eax),%eax
 55a:	0f be c0             	movsbl %al,%eax
 55d:	01 c8                	add    %ecx,%eax
 55f:	83 e8 30             	sub    $0x30,%eax
 562:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 565:	8b 45 08             	mov    0x8(%ebp),%eax
 568:	0f b6 00             	movzbl (%eax),%eax
 56b:	3c 2f                	cmp    $0x2f,%al
 56d:	7e 0a                	jle    579 <atoi+0x48>
 56f:	8b 45 08             	mov    0x8(%ebp),%eax
 572:	0f b6 00             	movzbl (%eax),%eax
 575:	3c 39                	cmp    $0x39,%al
 577:	7e c7                	jle    540 <atoi+0xf>
  return n;
 579:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 57c:	c9                   	leave  
 57d:	c3                   	ret    

0000057e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 57e:	55                   	push   %ebp
 57f:	89 e5                	mov    %esp,%ebp
 581:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 584:	8b 45 08             	mov    0x8(%ebp),%eax
 587:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 58a:	8b 45 0c             	mov    0xc(%ebp),%eax
 58d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 590:	eb 17                	jmp    5a9 <memmove+0x2b>
    *dst++ = *src++;
 592:	8b 45 fc             	mov    -0x4(%ebp),%eax
 595:	8d 50 01             	lea    0x1(%eax),%edx
 598:	89 55 fc             	mov    %edx,-0x4(%ebp)
 59b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 59e:	8d 4a 01             	lea    0x1(%edx),%ecx
 5a1:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5a4:	0f b6 12             	movzbl (%edx),%edx
 5a7:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 5a9:	8b 45 10             	mov    0x10(%ebp),%eax
 5ac:	8d 50 ff             	lea    -0x1(%eax),%edx
 5af:	89 55 10             	mov    %edx,0x10(%ebp)
 5b2:	85 c0                	test   %eax,%eax
 5b4:	7f dc                	jg     592 <memmove+0x14>
  return vdst;
 5b6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5b9:	c9                   	leave  
 5ba:	c3                   	ret    

000005bb <ps>:


// ** wrapper funcion for print sat table **//
void ps() {
 5bb:	55                   	push   %ebp
 5bc:	89 e5                	mov    %esp,%ebp
 5be:	81 ec 18 09 00 00    	sub    $0x918,%esp
  pstatTable p;
  getpinfo(&p);
 5c4:	8d 85 f8 f6 ff ff    	lea    -0x908(%ebp),%eax
 5ca:	89 04 24             	mov    %eax,(%esp)
 5cd:	e8 aa 00 00 00       	call   67c <getpinfo>
 5d2:	c9                   	leave  
 5d3:	c3                   	ret    

000005d4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5d4:	b8 01 00 00 00       	mov    $0x1,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <exit>:
SYSCALL(exit)
 5dc:	b8 02 00 00 00       	mov    $0x2,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <wait>:
SYSCALL(wait)
 5e4:	b8 03 00 00 00       	mov    $0x3,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <pipe>:
SYSCALL(pipe)
 5ec:	b8 04 00 00 00       	mov    $0x4,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <read>:
SYSCALL(read)
 5f4:	b8 05 00 00 00       	mov    $0x5,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <write>:
SYSCALL(write)
 5fc:	b8 10 00 00 00       	mov    $0x10,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <close>:
SYSCALL(close)
 604:	b8 15 00 00 00       	mov    $0x15,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <kill>:
SYSCALL(kill)
 60c:	b8 06 00 00 00       	mov    $0x6,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <exec>:
SYSCALL(exec)
 614:	b8 07 00 00 00       	mov    $0x7,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <open>:
SYSCALL(open)
 61c:	b8 0f 00 00 00       	mov    $0xf,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <mknod>:
SYSCALL(mknod)
 624:	b8 11 00 00 00       	mov    $0x11,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <unlink>:
SYSCALL(unlink)
 62c:	b8 12 00 00 00       	mov    $0x12,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <fstat>:
SYSCALL(fstat)
 634:	b8 08 00 00 00       	mov    $0x8,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <link>:
SYSCALL(link)
 63c:	b8 13 00 00 00       	mov    $0x13,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <mkdir>:
SYSCALL(mkdir)
 644:	b8 14 00 00 00       	mov    $0x14,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <chdir>:
SYSCALL(chdir)
 64c:	b8 09 00 00 00       	mov    $0x9,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <dup>:
SYSCALL(dup)
 654:	b8 0a 00 00 00       	mov    $0xa,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <getpid>:
SYSCALL(getpid)
 65c:	b8 0b 00 00 00       	mov    $0xb,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <sbrk>:
SYSCALL(sbrk)
 664:	b8 0c 00 00 00       	mov    $0xc,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <sleep>:
SYSCALL(sleep)
 66c:	b8 0d 00 00 00       	mov    $0xd,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <uptime>:
SYSCALL(uptime)
 674:	b8 0e 00 00 00       	mov    $0xe,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <getpinfo>:
SYSCALL(getpinfo)
 67c:	b8 16 00 00 00       	mov    $0x16,%eax
 681:	cd 40                	int    $0x40
 683:	c3                   	ret    

00000684 <settickets>:
SYSCALL(settickets)
 684:	b8 17 00 00 00       	mov    $0x17,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 68c:	55                   	push   %ebp
 68d:	89 e5                	mov    %esp,%ebp
 68f:	83 ec 18             	sub    $0x18,%esp
 692:	8b 45 0c             	mov    0xc(%ebp),%eax
 695:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 698:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 69f:	00 
 6a0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 6a3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a7:	8b 45 08             	mov    0x8(%ebp),%eax
 6aa:	89 04 24             	mov    %eax,(%esp)
 6ad:	e8 4a ff ff ff       	call   5fc <write>
}
 6b2:	c9                   	leave  
 6b3:	c3                   	ret    

000006b4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6b4:	55                   	push   %ebp
 6b5:	89 e5                	mov    %esp,%ebp
 6b7:	56                   	push   %esi
 6b8:	53                   	push   %ebx
 6b9:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6bc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6c3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6c7:	74 17                	je     6e0 <printint+0x2c>
 6c9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6cd:	79 11                	jns    6e0 <printint+0x2c>
    neg = 1;
 6cf:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 6d9:	f7 d8                	neg    %eax
 6db:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6de:	eb 06                	jmp    6e6 <printint+0x32>
  } else {
    x = xx;
 6e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 6e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6e6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6ed:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6f0:	8d 41 01             	lea    0x1(%ecx),%eax
 6f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6f6:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6fc:	ba 00 00 00 00       	mov    $0x0,%edx
 701:	f7 f3                	div    %ebx
 703:	89 d0                	mov    %edx,%eax
 705:	0f b6 80 44 0e 00 00 	movzbl 0xe44(%eax),%eax
 70c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 710:	8b 75 10             	mov    0x10(%ebp),%esi
 713:	8b 45 ec             	mov    -0x14(%ebp),%eax
 716:	ba 00 00 00 00       	mov    $0x0,%edx
 71b:	f7 f6                	div    %esi
 71d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 720:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 724:	75 c7                	jne    6ed <printint+0x39>
  if(neg)
 726:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 72a:	74 10                	je     73c <printint+0x88>
    buf[i++] = '-';
 72c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 72f:	8d 50 01             	lea    0x1(%eax),%edx
 732:	89 55 f4             	mov    %edx,-0xc(%ebp)
 735:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 73a:	eb 1f                	jmp    75b <printint+0xa7>
 73c:	eb 1d                	jmp    75b <printint+0xa7>
    putc(fd, buf[i]);
 73e:	8d 55 dc             	lea    -0x24(%ebp),%edx
 741:	8b 45 f4             	mov    -0xc(%ebp),%eax
 744:	01 d0                	add    %edx,%eax
 746:	0f b6 00             	movzbl (%eax),%eax
 749:	0f be c0             	movsbl %al,%eax
 74c:	89 44 24 04          	mov    %eax,0x4(%esp)
 750:	8b 45 08             	mov    0x8(%ebp),%eax
 753:	89 04 24             	mov    %eax,(%esp)
 756:	e8 31 ff ff ff       	call   68c <putc>
  while(--i >= 0)
 75b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 75f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 763:	79 d9                	jns    73e <printint+0x8a>
}
 765:	83 c4 30             	add    $0x30,%esp
 768:	5b                   	pop    %ebx
 769:	5e                   	pop    %esi
 76a:	5d                   	pop    %ebp
 76b:	c3                   	ret    

0000076c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 76c:	55                   	push   %ebp
 76d:	89 e5                	mov    %esp,%ebp
 76f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 772:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 779:	8d 45 0c             	lea    0xc(%ebp),%eax
 77c:	83 c0 04             	add    $0x4,%eax
 77f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 782:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 789:	e9 7c 01 00 00       	jmp    90a <printf+0x19e>
    c = fmt[i] & 0xff;
 78e:	8b 55 0c             	mov    0xc(%ebp),%edx
 791:	8b 45 f0             	mov    -0x10(%ebp),%eax
 794:	01 d0                	add    %edx,%eax
 796:	0f b6 00             	movzbl (%eax),%eax
 799:	0f be c0             	movsbl %al,%eax
 79c:	25 ff 00 00 00       	and    $0xff,%eax
 7a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 7a4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7a8:	75 2c                	jne    7d6 <printf+0x6a>
      if(c == '%'){
 7aa:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7ae:	75 0c                	jne    7bc <printf+0x50>
        state = '%';
 7b0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 7b7:	e9 4a 01 00 00       	jmp    906 <printf+0x19a>
      } else {
        putc(fd, c);
 7bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7bf:	0f be c0             	movsbl %al,%eax
 7c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 7c6:	8b 45 08             	mov    0x8(%ebp),%eax
 7c9:	89 04 24             	mov    %eax,(%esp)
 7cc:	e8 bb fe ff ff       	call   68c <putc>
 7d1:	e9 30 01 00 00       	jmp    906 <printf+0x19a>
      }
    } else if(state == '%'){
 7d6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7da:	0f 85 26 01 00 00    	jne    906 <printf+0x19a>
      if(c == 'd'){
 7e0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7e4:	75 2d                	jne    813 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 7e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7e9:	8b 00                	mov    (%eax),%eax
 7eb:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7f2:	00 
 7f3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7fa:	00 
 7fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ff:	8b 45 08             	mov    0x8(%ebp),%eax
 802:	89 04 24             	mov    %eax,(%esp)
 805:	e8 aa fe ff ff       	call   6b4 <printint>
        ap++;
 80a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 80e:	e9 ec 00 00 00       	jmp    8ff <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 813:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 817:	74 06                	je     81f <printf+0xb3>
 819:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 81d:	75 2d                	jne    84c <printf+0xe0>
        printint(fd, *ap, 16, 0);
 81f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 822:	8b 00                	mov    (%eax),%eax
 824:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 82b:	00 
 82c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 833:	00 
 834:	89 44 24 04          	mov    %eax,0x4(%esp)
 838:	8b 45 08             	mov    0x8(%ebp),%eax
 83b:	89 04 24             	mov    %eax,(%esp)
 83e:	e8 71 fe ff ff       	call   6b4 <printint>
        ap++;
 843:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 847:	e9 b3 00 00 00       	jmp    8ff <printf+0x193>
      } else if(c == 's'){
 84c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 850:	75 45                	jne    897 <printf+0x12b>
        s = (char*)*ap;
 852:	8b 45 e8             	mov    -0x18(%ebp),%eax
 855:	8b 00                	mov    (%eax),%eax
 857:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 85a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 85e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 862:	75 09                	jne    86d <printf+0x101>
          s = "(null)";
 864:	c7 45 f4 82 0b 00 00 	movl   $0xb82,-0xc(%ebp)
        while(*s != 0){
 86b:	eb 1e                	jmp    88b <printf+0x11f>
 86d:	eb 1c                	jmp    88b <printf+0x11f>
          putc(fd, *s);
 86f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 872:	0f b6 00             	movzbl (%eax),%eax
 875:	0f be c0             	movsbl %al,%eax
 878:	89 44 24 04          	mov    %eax,0x4(%esp)
 87c:	8b 45 08             	mov    0x8(%ebp),%eax
 87f:	89 04 24             	mov    %eax,(%esp)
 882:	e8 05 fe ff ff       	call   68c <putc>
          s++;
 887:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 88b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88e:	0f b6 00             	movzbl (%eax),%eax
 891:	84 c0                	test   %al,%al
 893:	75 da                	jne    86f <printf+0x103>
 895:	eb 68                	jmp    8ff <printf+0x193>
        }
      } else if(c == 'c'){
 897:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 89b:	75 1d                	jne    8ba <printf+0x14e>
        putc(fd, *ap);
 89d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8a0:	8b 00                	mov    (%eax),%eax
 8a2:	0f be c0             	movsbl %al,%eax
 8a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
 8ac:	89 04 24             	mov    %eax,(%esp)
 8af:	e8 d8 fd ff ff       	call   68c <putc>
        ap++;
 8b4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8b8:	eb 45                	jmp    8ff <printf+0x193>
      } else if(c == '%'){
 8ba:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8be:	75 17                	jne    8d7 <printf+0x16b>
        putc(fd, c);
 8c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8c3:	0f be c0             	movsbl %al,%eax
 8c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8ca:	8b 45 08             	mov    0x8(%ebp),%eax
 8cd:	89 04 24             	mov    %eax,(%esp)
 8d0:	e8 b7 fd ff ff       	call   68c <putc>
 8d5:	eb 28                	jmp    8ff <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8d7:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8de:	00 
 8df:	8b 45 08             	mov    0x8(%ebp),%eax
 8e2:	89 04 24             	mov    %eax,(%esp)
 8e5:	e8 a2 fd ff ff       	call   68c <putc>
        putc(fd, c);
 8ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8ed:	0f be c0             	movsbl %al,%eax
 8f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8f4:	8b 45 08             	mov    0x8(%ebp),%eax
 8f7:	89 04 24             	mov    %eax,(%esp)
 8fa:	e8 8d fd ff ff       	call   68c <putc>
      }
      state = 0;
 8ff:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 906:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 90a:	8b 55 0c             	mov    0xc(%ebp),%edx
 90d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 910:	01 d0                	add    %edx,%eax
 912:	0f b6 00             	movzbl (%eax),%eax
 915:	84 c0                	test   %al,%al
 917:	0f 85 71 fe ff ff    	jne    78e <printf+0x22>
    }
  }
}
 91d:	c9                   	leave  
 91e:	c3                   	ret    

0000091f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 91f:	55                   	push   %ebp
 920:	89 e5                	mov    %esp,%ebp
 922:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 925:	8b 45 08             	mov    0x8(%ebp),%eax
 928:	83 e8 08             	sub    $0x8,%eax
 92b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 92e:	a1 70 0e 00 00       	mov    0xe70,%eax
 933:	89 45 fc             	mov    %eax,-0x4(%ebp)
 936:	eb 24                	jmp    95c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 938:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93b:	8b 00                	mov    (%eax),%eax
 93d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 940:	77 12                	ja     954 <free+0x35>
 942:	8b 45 f8             	mov    -0x8(%ebp),%eax
 945:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 948:	77 24                	ja     96e <free+0x4f>
 94a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94d:	8b 00                	mov    (%eax),%eax
 94f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 952:	77 1a                	ja     96e <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 954:	8b 45 fc             	mov    -0x4(%ebp),%eax
 957:	8b 00                	mov    (%eax),%eax
 959:	89 45 fc             	mov    %eax,-0x4(%ebp)
 95c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 962:	76 d4                	jbe    938 <free+0x19>
 964:	8b 45 fc             	mov    -0x4(%ebp),%eax
 967:	8b 00                	mov    (%eax),%eax
 969:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 96c:	76 ca                	jbe    938 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 96e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 971:	8b 40 04             	mov    0x4(%eax),%eax
 974:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 97b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 97e:	01 c2                	add    %eax,%edx
 980:	8b 45 fc             	mov    -0x4(%ebp),%eax
 983:	8b 00                	mov    (%eax),%eax
 985:	39 c2                	cmp    %eax,%edx
 987:	75 24                	jne    9ad <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 989:	8b 45 f8             	mov    -0x8(%ebp),%eax
 98c:	8b 50 04             	mov    0x4(%eax),%edx
 98f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 992:	8b 00                	mov    (%eax),%eax
 994:	8b 40 04             	mov    0x4(%eax),%eax
 997:	01 c2                	add    %eax,%edx
 999:	8b 45 f8             	mov    -0x8(%ebp),%eax
 99c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 99f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a2:	8b 00                	mov    (%eax),%eax
 9a4:	8b 10                	mov    (%eax),%edx
 9a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9a9:	89 10                	mov    %edx,(%eax)
 9ab:	eb 0a                	jmp    9b7 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 9ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b0:	8b 10                	mov    (%eax),%edx
 9b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9b5:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 9b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ba:	8b 40 04             	mov    0x4(%eax),%eax
 9bd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 9c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c7:	01 d0                	add    %edx,%eax
 9c9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9cc:	75 20                	jne    9ee <free+0xcf>
    p->s.size += bp->s.size;
 9ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d1:	8b 50 04             	mov    0x4(%eax),%edx
 9d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9d7:	8b 40 04             	mov    0x4(%eax),%eax
 9da:	01 c2                	add    %eax,%edx
 9dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9e5:	8b 10                	mov    (%eax),%edx
 9e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ea:	89 10                	mov    %edx,(%eax)
 9ec:	eb 08                	jmp    9f6 <free+0xd7>
  } else
    p->s.ptr = bp;
 9ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9f1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9f4:	89 10                	mov    %edx,(%eax)
  freep = p;
 9f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9f9:	a3 70 0e 00 00       	mov    %eax,0xe70
}
 9fe:	c9                   	leave  
 9ff:	c3                   	ret    

00000a00 <morecore>:

static Header*
morecore(uint nu)
{
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
 a03:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 a06:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 a0d:	77 07                	ja     a16 <morecore+0x16>
    nu = 4096;
 a0f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 a16:	8b 45 08             	mov    0x8(%ebp),%eax
 a19:	c1 e0 03             	shl    $0x3,%eax
 a1c:	89 04 24             	mov    %eax,(%esp)
 a1f:	e8 40 fc ff ff       	call   664 <sbrk>
 a24:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 a27:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a2b:	75 07                	jne    a34 <morecore+0x34>
    return 0;
 a2d:	b8 00 00 00 00       	mov    $0x0,%eax
 a32:	eb 22                	jmp    a56 <morecore+0x56>
  hp = (Header*)p;
 a34:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a37:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a3d:	8b 55 08             	mov    0x8(%ebp),%edx
 a40:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a43:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a46:	83 c0 08             	add    $0x8,%eax
 a49:	89 04 24             	mov    %eax,(%esp)
 a4c:	e8 ce fe ff ff       	call   91f <free>
  return freep;
 a51:	a1 70 0e 00 00       	mov    0xe70,%eax
}
 a56:	c9                   	leave  
 a57:	c3                   	ret    

00000a58 <malloc>:

void*
malloc(uint nbytes)
{
 a58:	55                   	push   %ebp
 a59:	89 e5                	mov    %esp,%ebp
 a5b:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a5e:	8b 45 08             	mov    0x8(%ebp),%eax
 a61:	83 c0 07             	add    $0x7,%eax
 a64:	c1 e8 03             	shr    $0x3,%eax
 a67:	83 c0 01             	add    $0x1,%eax
 a6a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a6d:	a1 70 0e 00 00       	mov    0xe70,%eax
 a72:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a75:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a79:	75 23                	jne    a9e <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a7b:	c7 45 f0 68 0e 00 00 	movl   $0xe68,-0x10(%ebp)
 a82:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a85:	a3 70 0e 00 00       	mov    %eax,0xe70
 a8a:	a1 70 0e 00 00       	mov    0xe70,%eax
 a8f:	a3 68 0e 00 00       	mov    %eax,0xe68
    base.s.size = 0;
 a94:	c7 05 6c 0e 00 00 00 	movl   $0x0,0xe6c
 a9b:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aa1:	8b 00                	mov    (%eax),%eax
 aa3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 aa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa9:	8b 40 04             	mov    0x4(%eax),%eax
 aac:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 aaf:	72 4d                	jb     afe <malloc+0xa6>
      if(p->s.size == nunits)
 ab1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab4:	8b 40 04             	mov    0x4(%eax),%eax
 ab7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 aba:	75 0c                	jne    ac8 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 abc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 abf:	8b 10                	mov    (%eax),%edx
 ac1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ac4:	89 10                	mov    %edx,(%eax)
 ac6:	eb 26                	jmp    aee <malloc+0x96>
      else {
        p->s.size -= nunits;
 ac8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 acb:	8b 40 04             	mov    0x4(%eax),%eax
 ace:	2b 45 ec             	sub    -0x14(%ebp),%eax
 ad1:	89 c2                	mov    %eax,%edx
 ad3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ad9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 adc:	8b 40 04             	mov    0x4(%eax),%eax
 adf:	c1 e0 03             	shl    $0x3,%eax
 ae2:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 ae5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae8:	8b 55 ec             	mov    -0x14(%ebp),%edx
 aeb:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 aee:	8b 45 f0             	mov    -0x10(%ebp),%eax
 af1:	a3 70 0e 00 00       	mov    %eax,0xe70
      return (void*)(p + 1);
 af6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af9:	83 c0 08             	add    $0x8,%eax
 afc:	eb 38                	jmp    b36 <malloc+0xde>
    }
    if(p == freep)
 afe:	a1 70 0e 00 00       	mov    0xe70,%eax
 b03:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 b06:	75 1b                	jne    b23 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 b08:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b0b:	89 04 24             	mov    %eax,(%esp)
 b0e:	e8 ed fe ff ff       	call   a00 <morecore>
 b13:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b16:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b1a:	75 07                	jne    b23 <malloc+0xcb>
        return 0;
 b1c:	b8 00 00 00 00       	mov    $0x0,%eax
 b21:	eb 13                	jmp    b36 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b23:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b26:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b29:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b2c:	8b 00                	mov    (%eax),%eax
 b2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 b31:	e9 70 ff ff ff       	jmp    aa6 <malloc+0x4e>
}
 b36:	c9                   	leave  
 b37:	c3                   	ret    
