
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
  strcpy(history[0], buf);
}
int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	53                   	push   %ebx
       e:	bb a0 1c 00 00       	mov    $0x1ca0,%ebx
      13:	51                   	push   %ecx
      14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  static char buf[100];
  int fd;
  for (int i = 0; i < 10; i++) { // initialize the history buffer
    strcpy(history[i], "empty");
      18:	83 ec 08             	sub    $0x8,%esp
      1b:	68 8f 15 00 00       	push   $0x158f
      20:	53                   	push   %ebx
  for (int i = 0; i < 10; i++) { // initialize the history buffer
      21:	83 c3 64             	add    $0x64,%ebx
    strcpy(history[i], "empty");
      24:	e8 17 0e 00 00       	call   e40 <strcpy>
  for (int i = 0; i < 10; i++) { // initialize the history buffer
      29:	83 c4 10             	add    $0x10,%esp
      2c:	81 fb 88 20 00 00    	cmp    $0x2088,%ebx
      32:	75 e4                	jne    18 <main+0x18>
      34:	eb 13                	jmp    49 <main+0x49>
      36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      3d:	8d 76 00             	lea    0x0(%esi),%esi
  }

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      40:	83 f8 02             	cmp    $0x2,%eax
      43:	0f 8f 80 01 00 00    	jg     1c9 <main+0x1c9>
  while((fd = open("console", O_RDWR)) >= 0){
      49:	83 ec 08             	sub    $0x8,%esp
      4c:	6a 02                	push   $0x2
      4e:	68 fb 15 00 00       	push   $0x15fb
      53:	e8 6b 10 00 00       	call   10c3 <open>
      58:	83 c4 10             	add    $0x10,%esp
      5b:	85 c0                	test   %eax,%eax
      5d:	79 e1                	jns    40 <main+0x40>
      5f:	90                   	nop
  printf(2, "$ ");
      60:	83 ec 08             	sub    $0x8,%esp
      63:	68 08 15 00 00       	push   $0x1508
      68:	6a 02                	push   $0x2
      6a:	e8 71 11 00 00       	call   11e0 <printf>
  memset(buf, 0, nbuf);
      6f:	83 c4 0c             	add    $0xc,%esp
      72:	6a 64                	push   $0x64
      74:	6a 00                	push   $0x0
      76:	68 a0 20 00 00       	push   $0x20a0
      7b:	e8 80 0e 00 00       	call   f00 <memset>
  gets(buf, nbuf);
      80:	58                   	pop    %eax
      81:	5a                   	pop    %edx
      82:	6a 64                	push   $0x64
      84:	68 a0 20 00 00       	push   $0x20a0
      89:	e8 d2 0e 00 00       	call   f60 <gets>
  if(buf[0] == 0) // EOF
      8e:	0f b6 05 a0 20 00 00 	movzbl 0x20a0,%eax
      95:	83 c4 10             	add    $0x10,%esp
      98:	84 c0                	test   %al,%al
      9a:	0f 84 24 01 00 00    	je     1c4 <main+0x1c4>
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a0:	3c 63                	cmp    $0x63,%al
      a2:	75 0d                	jne    b1 <main+0xb1>
      a4:	80 3d a1 20 00 00 64 	cmpb   $0x64,0x20a1
      ab:	0f 84 8f 00 00 00    	je     140 <main+0x140>
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if (!strcmp(buf, "\n")) { // exclude empty lines from history (interferes with "hist print")
      b1:	83 ec 08             	sub    $0x8,%esp
      b4:	68 f9 15 00 00       	push   $0x15f9
      b9:	68 a0 20 00 00       	push   $0x20a0
      be:	e8 ad 0d 00 00       	call   e70 <strcmp>
      c3:	83 c4 10             	add    $0x10,%esp
      c6:	85 c0                	test   %eax,%eax
      c8:	74 96                	je     60 <main+0x60>
      continue;
    }
    // exclude hist commands from history buffer
    if (!(buf[0] == 'h' && buf[1] == 'i' && buf[2] == 's' && buf[3] == 't' && buf[4] == ' ')) {
      ca:	80 3d a0 20 00 00 68 	cmpb   $0x68,0x20a0
      d1:	75 0d                	jne    e0 <main+0xe0>
      d3:	80 3d a1 20 00 00 69 	cmpb   $0x69,0x20a1
      da:	0f 84 b8 00 00 00    	je     198 <main+0x198>
  for (int i = 9; i >= 1; i--) {
      e0:	bb 24 20 00 00       	mov    $0x2024,%ebx
      e5:	8d 76 00             	lea    0x0(%esi),%esi
    strcpy(history[i], history[i-1]);
      e8:	83 ec 08             	sub    $0x8,%esp
      eb:	89 d8                	mov    %ebx,%eax
      ed:	83 eb 64             	sub    $0x64,%ebx
      f0:	53                   	push   %ebx
      f1:	50                   	push   %eax
      f2:	e8 49 0d 00 00       	call   e40 <strcpy>
  for (int i = 9; i >= 1; i--) {
      f7:	83 c4 10             	add    $0x10,%esp
      fa:	81 fb a0 1c 00 00    	cmp    $0x1ca0,%ebx
     100:	75 e6                	jne    e8 <main+0xe8>
  strcpy(history[0], buf);
     102:	83 ec 08             	sub    $0x8,%esp
     105:	68 a0 20 00 00       	push   $0x20a0
     10a:	68 a0 1c 00 00       	push   $0x1ca0
     10f:	e8 2c 0d 00 00       	call   e40 <strcpy>
}
     114:	83 c4 10             	add    $0x10,%esp
int
fork1(void)
{
  int pid;

  pid = fork();
     117:	e8 5f 0f 00 00       	call   107b <fork>
  if(pid == -1)
     11c:	83 f8 ff             	cmp    $0xffffffff,%eax
     11f:	0f 84 ca 00 00 00    	je     1ef <main+0x1ef>
    if(fork1() == 0)
     125:	85 c0                	test   %eax,%eax
     127:	0f 84 ad 00 00 00    	je     1da <main+0x1da>
    wait();
     12d:	e8 59 0f 00 00       	call   108b <wait>
     132:	e9 29 ff ff ff       	jmp    60 <main+0x60>
     137:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     13e:	66 90                	xchg   %ax,%ax
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     140:	80 3d a2 20 00 00 20 	cmpb   $0x20,0x20a2
     147:	0f 85 64 ff ff ff    	jne    b1 <main+0xb1>
      buf[strlen(buf)-1] = 0;  // chop \n
     14d:	83 ec 0c             	sub    $0xc,%esp
     150:	68 a0 20 00 00       	push   $0x20a0
     155:	e8 76 0d 00 00       	call   ed0 <strlen>
      if(chdir(buf+3) < 0)
     15a:	c7 04 24 a3 20 00 00 	movl   $0x20a3,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
     161:	c6 80 9f 20 00 00 00 	movb   $0x0,0x209f(%eax)
      if(chdir(buf+3) < 0)
     168:	e8 86 0f 00 00       	call   10f3 <chdir>
     16d:	83 c4 10             	add    $0x10,%esp
     170:	85 c0                	test   %eax,%eax
     172:	0f 89 e8 fe ff ff    	jns    60 <main+0x60>
        printf(2, "cannot cd %s\n", buf+3);
     178:	51                   	push   %ecx
     179:	68 a3 20 00 00       	push   $0x20a3
     17e:	68 03 16 00 00       	push   $0x1603
     183:	6a 02                	push   $0x2
     185:	e8 56 10 00 00       	call   11e0 <printf>
     18a:	83 c4 10             	add    $0x10,%esp
     18d:	e9 ce fe ff ff       	jmp    60 <main+0x60>
     192:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (!(buf[0] == 'h' && buf[1] == 'i' && buf[2] == 's' && buf[3] == 't' && buf[4] == ' ')) {
     198:	80 3d a2 20 00 00 73 	cmpb   $0x73,0x20a2
     19f:	0f 85 3b ff ff ff    	jne    e0 <main+0xe0>
     1a5:	80 3d a3 20 00 00 74 	cmpb   $0x74,0x20a3
     1ac:	0f 85 2e ff ff ff    	jne    e0 <main+0xe0>
     1b2:	80 3d a4 20 00 00 20 	cmpb   $0x20,0x20a4
     1b9:	0f 85 21 ff ff ff    	jne    e0 <main+0xe0>
     1bf:	e9 53 ff ff ff       	jmp    117 <main+0x117>
  exit();
     1c4:	e8 ba 0e 00 00       	call   1083 <exit>
      close(fd);
     1c9:	83 ec 0c             	sub    $0xc,%esp
     1cc:	50                   	push   %eax
     1cd:	e8 d9 0e 00 00       	call   10ab <close>
      break;
     1d2:	83 c4 10             	add    $0x10,%esp
     1d5:	e9 86 fe ff ff       	jmp    60 <main+0x60>
      runcmd(parsecmd(buf));
     1da:	83 ec 0c             	sub    $0xc,%esp
     1dd:	68 a0 20 00 00       	push   $0x20a0
     1e2:	e8 09 09 00 00       	call   af0 <parsecmd>
     1e7:	89 04 24             	mov    %eax,(%esp)
     1ea:	e8 71 09 00 00       	call   b60 <runcmd>
    panic("fork");
     1ef:	83 ec 0c             	sub    $0xc,%esp
     1f2:	68 0b 15 00 00       	push   $0x150b
     1f7:	e8 94 00 00 00       	call   290 <panic>
     1fc:	66 90                	xchg   %ax,%ax
     1fe:	66 90                	xchg   %ax,%ax

00000200 <getcmd>:
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	56                   	push   %esi
     204:	53                   	push   %ebx
     205:	8b 5d 08             	mov    0x8(%ebp),%ebx
     208:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     20b:	83 ec 08             	sub    $0x8,%esp
     20e:	68 08 15 00 00       	push   $0x1508
     213:	6a 02                	push   $0x2
     215:	e8 c6 0f 00 00       	call   11e0 <printf>
  memset(buf, 0, nbuf);
     21a:	83 c4 0c             	add    $0xc,%esp
     21d:	56                   	push   %esi
     21e:	6a 00                	push   $0x0
     220:	53                   	push   %ebx
     221:	e8 da 0c 00 00       	call   f00 <memset>
  gets(buf, nbuf);
     226:	58                   	pop    %eax
     227:	5a                   	pop    %edx
     228:	56                   	push   %esi
     229:	53                   	push   %ebx
     22a:	e8 31 0d 00 00       	call   f60 <gets>
  if(buf[0] == 0) // EOF
     22f:	83 c4 10             	add    $0x10,%esp
     232:	80 3b 01             	cmpb   $0x1,(%ebx)
     235:	19 c0                	sbb    %eax,%eax
}
     237:	8d 65 f8             	lea    -0x8(%ebp),%esp
     23a:	5b                   	pop    %ebx
     23b:	5e                   	pop    %esi
     23c:	5d                   	pop    %ebp
     23d:	c3                   	ret
     23e:	66 90                	xchg   %ax,%ax

00000240 <updateHist>:
void updateHist(char *buf) { // maintain history buffer
     240:	55                   	push   %ebp
     241:	89 e5                	mov    %esp,%ebp
     243:	53                   	push   %ebx
     244:	bb 24 20 00 00       	mov    $0x2024,%ebx
     249:	83 ec 04             	sub    $0x4,%esp
     24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    strcpy(history[i], history[i-1]);
     250:	83 ec 08             	sub    $0x8,%esp
     253:	89 d8                	mov    %ebx,%eax
     255:	83 eb 64             	sub    $0x64,%ebx
     258:	53                   	push   %ebx
     259:	50                   	push   %eax
     25a:	e8 e1 0b 00 00       	call   e40 <strcpy>
  for (int i = 9; i >= 1; i--) {
     25f:	83 c4 10             	add    $0x10,%esp
     262:	81 fb a0 1c 00 00    	cmp    $0x1ca0,%ebx
     268:	75 e6                	jne    250 <updateHist+0x10>
  strcpy(history[0], buf);
     26a:	83 ec 08             	sub    $0x8,%esp
     26d:	ff 75 08             	push   0x8(%ebp)
     270:	68 a0 1c 00 00       	push   $0x1ca0
     275:	e8 c6 0b 00 00       	call   e40 <strcpy>
}
     27a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     27d:	83 c4 10             	add    $0x10,%esp
     280:	c9                   	leave
     281:	c3                   	ret
     282:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <panic>:
{
     290:	55                   	push   %ebp
     291:	89 e5                	mov    %esp,%ebp
     293:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     296:	ff 75 08             	push   0x8(%ebp)
     299:	68 79 15 00 00       	push   $0x1579
     29e:	6a 02                	push   $0x2
     2a0:	e8 3b 0f 00 00       	call   11e0 <printf>
  exit();
     2a5:	e8 d9 0d 00 00       	call   1083 <exit>
     2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002b0 <fork1>:
{
     2b0:	55                   	push   %ebp
     2b1:	89 e5                	mov    %esp,%ebp
     2b3:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     2b6:	e8 c0 0d 00 00       	call   107b <fork>
  if(pid == -1)
     2bb:	83 f8 ff             	cmp    $0xffffffff,%eax
     2be:	74 02                	je     2c2 <fork1+0x12>
  return pid;
}
     2c0:	c9                   	leave
     2c1:	c3                   	ret
    panic("fork");
     2c2:	83 ec 0c             	sub    $0xc,%esp
     2c5:	68 0b 15 00 00       	push   $0x150b
     2ca:	e8 c1 ff ff ff       	call   290 <panic>
     2cf:	90                   	nop

000002d0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     2d0:	55                   	push   %ebp
     2d1:	89 e5                	mov    %esp,%ebp
     2d3:	53                   	push   %ebx
     2d4:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2d7:	6a 54                	push   $0x54
     2d9:	e8 42 11 00 00       	call   1420 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     2de:	83 c4 0c             	add    $0xc,%esp
     2e1:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     2e3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     2e5:	6a 00                	push   $0x0
     2e7:	50                   	push   %eax
     2e8:	e8 13 0c 00 00       	call   f00 <memset>
  cmd->type = EXEC;
     2ed:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     2f3:	89 d8                	mov    %ebx,%eax
     2f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2f8:	c9                   	leave
     2f9:	c3                   	ret
     2fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000300 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     300:	55                   	push   %ebp
     301:	89 e5                	mov    %esp,%ebp
     303:	53                   	push   %ebx
     304:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     307:	6a 18                	push   $0x18
     309:	e8 12 11 00 00       	call   1420 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     30e:	83 c4 0c             	add    $0xc,%esp
     311:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     313:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     315:	6a 00                	push   $0x0
     317:	50                   	push   %eax
     318:	e8 e3 0b 00 00       	call   f00 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     31d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     320:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     326:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     329:	8b 45 0c             	mov    0xc(%ebp),%eax
     32c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     32f:	8b 45 10             	mov    0x10(%ebp),%eax
     332:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     335:	8b 45 14             	mov    0x14(%ebp),%eax
     338:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     33b:	8b 45 18             	mov    0x18(%ebp),%eax
     33e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     341:	89 d8                	mov    %ebx,%eax
     343:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     346:	c9                   	leave
     347:	c3                   	ret
     348:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     34f:	90                   	nop

00000350 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	53                   	push   %ebx
     354:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     357:	6a 0c                	push   $0xc
     359:	e8 c2 10 00 00       	call   1420 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     35e:	83 c4 0c             	add    $0xc,%esp
     361:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     363:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     365:	6a 00                	push   $0x0
     367:	50                   	push   %eax
     368:	e8 93 0b 00 00       	call   f00 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     36d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     370:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     376:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     379:	8b 45 0c             	mov    0xc(%ebp),%eax
     37c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     37f:	89 d8                	mov    %ebx,%eax
     381:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     384:	c9                   	leave
     385:	c3                   	ret
     386:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     38d:	8d 76 00             	lea    0x0(%esi),%esi

00000390 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     390:	55                   	push   %ebp
     391:	89 e5                	mov    %esp,%ebp
     393:	53                   	push   %ebx
     394:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     397:	6a 0c                	push   $0xc
     399:	e8 82 10 00 00       	call   1420 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     39e:	83 c4 0c             	add    $0xc,%esp
     3a1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3a3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3a5:	6a 00                	push   $0x0
     3a7:	50                   	push   %eax
     3a8:	e8 53 0b 00 00       	call   f00 <memset>
  cmd->type = LIST;
  cmd->left = left;
     3ad:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     3b0:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     3b6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3b9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3bc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3bf:	89 d8                	mov    %ebx,%eax
     3c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3c4:	c9                   	leave
     3c5:	c3                   	ret
     3c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3cd:	8d 76 00             	lea    0x0(%esi),%esi

000003d0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     3d0:	55                   	push   %ebp
     3d1:	89 e5                	mov    %esp,%ebp
     3d3:	53                   	push   %ebx
     3d4:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3d7:	6a 08                	push   $0x8
     3d9:	e8 42 10 00 00       	call   1420 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3de:	83 c4 0c             	add    $0xc,%esp
     3e1:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     3e3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3e5:	6a 00                	push   $0x0
     3e7:	50                   	push   %eax
     3e8:	e8 13 0b 00 00       	call   f00 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     3ed:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     3f0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     3f6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     3f9:	89 d8                	mov    %ebx,%eax
     3fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3fe:	c9                   	leave
     3ff:	c3                   	ret

00000400 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	57                   	push   %edi
     404:	56                   	push   %esi
     405:	53                   	push   %ebx
     406:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     409:	8b 45 08             	mov    0x8(%ebp),%eax
{
     40c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     40f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     412:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     414:	39 df                	cmp    %ebx,%edi
     416:	72 0f                	jb     427 <gettoken+0x27>
     418:	eb 25                	jmp    43f <gettoken+0x3f>
     41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     420:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     423:	39 fb                	cmp    %edi,%ebx
     425:	74 18                	je     43f <gettoken+0x3f>
     427:	0f be 07             	movsbl (%edi),%eax
     42a:	83 ec 08             	sub    $0x8,%esp
     42d:	50                   	push   %eax
     42e:	68 88 1c 00 00       	push   $0x1c88
     433:	e8 e8 0a 00 00       	call   f20 <strchr>
     438:	83 c4 10             	add    $0x10,%esp
     43b:	85 c0                	test   %eax,%eax
     43d:	75 e1                	jne    420 <gettoken+0x20>
  if(q)
     43f:	85 f6                	test   %esi,%esi
     441:	74 02                	je     445 <gettoken+0x45>
    *q = s;
     443:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     445:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     448:	3c 3c                	cmp    $0x3c,%al
     44a:	0f 8f d0 00 00 00    	jg     520 <gettoken+0x120>
     450:	3c 3a                	cmp    $0x3a,%al
     452:	0f 8f bc 00 00 00    	jg     514 <gettoken+0x114>
     458:	84 c0                	test   %al,%al
     45a:	75 44                	jne    4a0 <gettoken+0xa0>
     45c:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     45e:	8b 4d 14             	mov    0x14(%ebp),%ecx
     461:	85 c9                	test   %ecx,%ecx
     463:	74 05                	je     46a <gettoken+0x6a>
    *eq = s;
     465:	8b 45 14             	mov    0x14(%ebp),%eax
     468:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     46a:	39 df                	cmp    %ebx,%edi
     46c:	72 09                	jb     477 <gettoken+0x77>
     46e:	eb 1f                	jmp    48f <gettoken+0x8f>
    s++;
     470:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     473:	39 fb                	cmp    %edi,%ebx
     475:	74 18                	je     48f <gettoken+0x8f>
     477:	0f be 07             	movsbl (%edi),%eax
     47a:	83 ec 08             	sub    $0x8,%esp
     47d:	50                   	push   %eax
     47e:	68 88 1c 00 00       	push   $0x1c88
     483:	e8 98 0a 00 00       	call   f20 <strchr>
     488:	83 c4 10             	add    $0x10,%esp
     48b:	85 c0                	test   %eax,%eax
     48d:	75 e1                	jne    470 <gettoken+0x70>
  *ps = s;
     48f:	8b 45 08             	mov    0x8(%ebp),%eax
     492:	89 38                	mov    %edi,(%eax)
  return ret;
}
     494:	8d 65 f4             	lea    -0xc(%ebp),%esp
     497:	89 f0                	mov    %esi,%eax
     499:	5b                   	pop    %ebx
     49a:	5e                   	pop    %esi
     49b:	5f                   	pop    %edi
     49c:	5d                   	pop    %ebp
     49d:	c3                   	ret
     49e:	66 90                	xchg   %ax,%ax
  switch(*s){
     4a0:	79 66                	jns    508 <gettoken+0x108>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4a2:	39 df                	cmp    %ebx,%edi
     4a4:	72 39                	jb     4df <gettoken+0xdf>
  if(eq)
     4a6:	8b 55 14             	mov    0x14(%ebp),%edx
     4a9:	85 d2                	test   %edx,%edx
     4ab:	0f 84 b3 00 00 00    	je     564 <gettoken+0x164>
    *eq = s;
     4b1:	8b 45 14             	mov    0x14(%ebp),%eax
     4b4:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     4b6:	e9 a9 00 00 00       	jmp    564 <gettoken+0x164>
     4bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     4bf:	90                   	nop
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4c0:	0f be 07             	movsbl (%edi),%eax
     4c3:	83 ec 08             	sub    $0x8,%esp
     4c6:	50                   	push   %eax
     4c7:	68 80 1c 00 00       	push   $0x1c80
     4cc:	e8 4f 0a 00 00       	call   f20 <strchr>
     4d1:	83 c4 10             	add    $0x10,%esp
     4d4:	85 c0                	test   %eax,%eax
     4d6:	75 1f                	jne    4f7 <gettoken+0xf7>
      s++;
     4d8:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4db:	39 fb                	cmp    %edi,%ebx
     4dd:	74 77                	je     556 <gettoken+0x156>
     4df:	0f be 07             	movsbl (%edi),%eax
     4e2:	83 ec 08             	sub    $0x8,%esp
     4e5:	50                   	push   %eax
     4e6:	68 88 1c 00 00       	push   $0x1c88
     4eb:	e8 30 0a 00 00       	call   f20 <strchr>
     4f0:	83 c4 10             	add    $0x10,%esp
     4f3:	85 c0                	test   %eax,%eax
     4f5:	74 c9                	je     4c0 <gettoken+0xc0>
    ret = 'a';
     4f7:	be 61 00 00 00       	mov    $0x61,%esi
     4fc:	e9 5d ff ff ff       	jmp    45e <gettoken+0x5e>
     501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     508:	3c 26                	cmp    $0x26,%al
     50a:	74 08                	je     514 <gettoken+0x114>
     50c:	8d 48 d8             	lea    -0x28(%eax),%ecx
     50f:	80 f9 01             	cmp    $0x1,%cl
     512:	77 8e                	ja     4a2 <gettoken+0xa2>
  ret = *s;
     514:	0f be f0             	movsbl %al,%esi
    s++;
     517:	83 c7 01             	add    $0x1,%edi
    break;
     51a:	e9 3f ff ff ff       	jmp    45e <gettoken+0x5e>
     51f:	90                   	nop
  switch(*s){
     520:	3c 3e                	cmp    $0x3e,%al
     522:	75 1c                	jne    540 <gettoken+0x140>
    if(*s == '>'){
     524:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     528:	74 1f                	je     549 <gettoken+0x149>
    s++;
     52a:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     52d:	be 3e 00 00 00       	mov    $0x3e,%esi
     532:	e9 27 ff ff ff       	jmp    45e <gettoken+0x5e>
     537:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     53e:	66 90                	xchg   %ax,%ax
  switch(*s){
     540:	3c 7c                	cmp    $0x7c,%al
     542:	74 d0                	je     514 <gettoken+0x114>
     544:	e9 59 ff ff ff       	jmp    4a2 <gettoken+0xa2>
      s++;
     549:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     54c:	be 2b 00 00 00       	mov    $0x2b,%esi
     551:	e9 08 ff ff ff       	jmp    45e <gettoken+0x5e>
  if(eq)
     556:	8b 45 14             	mov    0x14(%ebp),%eax
     559:	85 c0                	test   %eax,%eax
     55b:	74 05                	je     562 <gettoken+0x162>
    *eq = s;
     55d:	8b 45 14             	mov    0x14(%ebp),%eax
     560:	89 18                	mov    %ebx,(%eax)
      s++;
     562:	89 df                	mov    %ebx,%edi
    ret = 'a';
     564:	be 61 00 00 00       	mov    $0x61,%esi
     569:	e9 21 ff ff ff       	jmp    48f <gettoken+0x8f>
     56e:	66 90                	xchg   %ax,%ax

00000570 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     570:	55                   	push   %ebp
     571:	89 e5                	mov    %esp,%ebp
     573:	57                   	push   %edi
     574:	56                   	push   %esi
     575:	53                   	push   %ebx
     576:	83 ec 0c             	sub    $0xc,%esp
     579:	8b 7d 08             	mov    0x8(%ebp),%edi
     57c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     57f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     581:	39 f3                	cmp    %esi,%ebx
     583:	72 12                	jb     597 <peek+0x27>
     585:	eb 28                	jmp    5af <peek+0x3f>
     587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     58e:	66 90                	xchg   %ax,%ax
    s++;
     590:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     593:	39 de                	cmp    %ebx,%esi
     595:	74 18                	je     5af <peek+0x3f>
     597:	0f be 03             	movsbl (%ebx),%eax
     59a:	83 ec 08             	sub    $0x8,%esp
     59d:	50                   	push   %eax
     59e:	68 88 1c 00 00       	push   $0x1c88
     5a3:	e8 78 09 00 00       	call   f20 <strchr>
     5a8:	83 c4 10             	add    $0x10,%esp
     5ab:	85 c0                	test   %eax,%eax
     5ad:	75 e1                	jne    590 <peek+0x20>
  *ps = s;
     5af:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     5b1:	0f be 03             	movsbl (%ebx),%eax
     5b4:	31 d2                	xor    %edx,%edx
     5b6:	84 c0                	test   %al,%al
     5b8:	75 0e                	jne    5c8 <peek+0x58>
}
     5ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5bd:	89 d0                	mov    %edx,%eax
     5bf:	5b                   	pop    %ebx
     5c0:	5e                   	pop    %esi
     5c1:	5f                   	pop    %edi
     5c2:	5d                   	pop    %ebp
     5c3:	c3                   	ret
     5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     5c8:	83 ec 08             	sub    $0x8,%esp
     5cb:	50                   	push   %eax
     5cc:	ff 75 10             	push   0x10(%ebp)
     5cf:	e8 4c 09 00 00       	call   f20 <strchr>
     5d4:	83 c4 10             	add    $0x10,%esp
     5d7:	31 d2                	xor    %edx,%edx
     5d9:	85 c0                	test   %eax,%eax
     5db:	0f 95 c2             	setne  %dl
}
     5de:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5e1:	5b                   	pop    %ebx
     5e2:	89 d0                	mov    %edx,%eax
     5e4:	5e                   	pop    %esi
     5e5:	5f                   	pop    %edi
     5e6:	5d                   	pop    %ebp
     5e7:	c3                   	ret
     5e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5ef:	90                   	nop

000005f0 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     5f0:	55                   	push   %ebp
     5f1:	89 e5                	mov    %esp,%ebp
     5f3:	57                   	push   %edi
     5f4:	56                   	push   %esi
     5f5:	53                   	push   %ebx
     5f6:	83 ec 2c             	sub    $0x2c,%esp
     5f9:	8b 75 0c             	mov    0xc(%ebp),%esi
     5fc:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     5ff:	90                   	nop
     600:	83 ec 04             	sub    $0x4,%esp
     603:	68 2d 15 00 00       	push   $0x152d
     608:	53                   	push   %ebx
     609:	56                   	push   %esi
     60a:	e8 61 ff ff ff       	call   570 <peek>
     60f:	83 c4 10             	add    $0x10,%esp
     612:	85 c0                	test   %eax,%eax
     614:	0f 84 f6 00 00 00    	je     710 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     61a:	6a 00                	push   $0x0
     61c:	6a 00                	push   $0x0
     61e:	53                   	push   %ebx
     61f:	56                   	push   %esi
     620:	e8 db fd ff ff       	call   400 <gettoken>
     625:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     627:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     62a:	50                   	push   %eax
     62b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     62e:	50                   	push   %eax
     62f:	53                   	push   %ebx
     630:	56                   	push   %esi
     631:	e8 ca fd ff ff       	call   400 <gettoken>
     636:	83 c4 20             	add    $0x20,%esp
     639:	83 f8 61             	cmp    $0x61,%eax
     63c:	0f 85 d9 00 00 00    	jne    71b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     642:	83 ff 3c             	cmp    $0x3c,%edi
     645:	74 69                	je     6b0 <parseredirs+0xc0>
     647:	83 ff 3e             	cmp    $0x3e,%edi
     64a:	74 05                	je     651 <parseredirs+0x61>
     64c:	83 ff 2b             	cmp    $0x2b,%edi
     64f:	75 af                	jne    600 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     651:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     654:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     657:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     65a:	89 55 d0             	mov    %edx,-0x30(%ebp)
     65d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     660:	6a 18                	push   $0x18
     662:	e8 b9 0d 00 00       	call   1420 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     667:	83 c4 0c             	add    $0xc,%esp
     66a:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     66c:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     66e:	6a 00                	push   $0x0
     670:	50                   	push   %eax
     671:	e8 8a 08 00 00       	call   f00 <memset>
  cmd->type = REDIR;
     676:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     67c:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     67f:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     682:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     685:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     688:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     68b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     68e:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     695:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     698:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     69f:	89 7d 08             	mov    %edi,0x8(%ebp)
     6a2:	e9 59 ff ff ff       	jmp    600 <parseredirs+0x10>
     6a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6ae:	66 90                	xchg   %ax,%ax
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6b0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6b3:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6b6:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6b9:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6bc:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6bf:	6a 18                	push   $0x18
     6c1:	e8 5a 0d 00 00       	call   1420 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6c6:	83 c4 0c             	add    $0xc,%esp
     6c9:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6cb:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6cd:	6a 00                	push   $0x0
     6cf:	50                   	push   %eax
     6d0:	e8 2b 08 00 00       	call   f00 <memset>
  cmd->cmd = subcmd;
     6d5:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     6d8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     6db:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     6de:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     6e1:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     6e7:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6ea:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6ed:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     6f0:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     6f3:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     6fa:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     701:	e9 fa fe ff ff       	jmp    600 <parseredirs+0x10>
     706:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     70d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     710:	8b 45 08             	mov    0x8(%ebp),%eax
     713:	8d 65 f4             	lea    -0xc(%ebp),%esp
     716:	5b                   	pop    %ebx
     717:	5e                   	pop    %esi
     718:	5f                   	pop    %edi
     719:	5d                   	pop    %ebp
     71a:	c3                   	ret
      panic("missing file for redirection");
     71b:	83 ec 0c             	sub    $0xc,%esp
     71e:	68 10 15 00 00       	push   $0x1510
     723:	e8 68 fb ff ff       	call   290 <panic>
     728:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     72f:	90                   	nop

00000730 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     730:	55                   	push   %ebp
     731:	89 e5                	mov    %esp,%ebp
     733:	57                   	push   %edi
     734:	56                   	push   %esi
     735:	53                   	push   %ebx
     736:	83 ec 30             	sub    $0x30,%esp
     739:	8b 5d 08             	mov    0x8(%ebp),%ebx
     73c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     73f:	68 30 15 00 00       	push   $0x1530
     744:	56                   	push   %esi
     745:	53                   	push   %ebx
     746:	e8 25 fe ff ff       	call   570 <peek>
     74b:	83 c4 10             	add    $0x10,%esp
     74e:	85 c0                	test   %eax,%eax
     750:	0f 85 aa 00 00 00    	jne    800 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     756:	83 ec 0c             	sub    $0xc,%esp
     759:	89 c7                	mov    %eax,%edi
     75b:	6a 54                	push   $0x54
     75d:	e8 be 0c 00 00       	call   1420 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     762:	83 c4 0c             	add    $0xc,%esp
     765:	6a 54                	push   $0x54
     767:	6a 00                	push   $0x0
     769:	89 45 d0             	mov    %eax,-0x30(%ebp)
     76c:	50                   	push   %eax
     76d:	e8 8e 07 00 00       	call   f00 <memset>
  cmd->type = EXEC;
     772:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     775:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     778:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     77e:	56                   	push   %esi
     77f:	53                   	push   %ebx
     780:	50                   	push   %eax
     781:	e8 6a fe ff ff       	call   5f0 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     786:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     789:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     78c:	eb 15                	jmp    7a3 <parseexec+0x73>
     78e:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     790:	83 ec 04             	sub    $0x4,%esp
     793:	56                   	push   %esi
     794:	53                   	push   %ebx
     795:	ff 75 d4             	push   -0x2c(%ebp)
     798:	e8 53 fe ff ff       	call   5f0 <parseredirs>
     79d:	83 c4 10             	add    $0x10,%esp
     7a0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7a3:	83 ec 04             	sub    $0x4,%esp
     7a6:	68 47 15 00 00       	push   $0x1547
     7ab:	56                   	push   %esi
     7ac:	53                   	push   %ebx
     7ad:	e8 be fd ff ff       	call   570 <peek>
     7b2:	83 c4 10             	add    $0x10,%esp
     7b5:	85 c0                	test   %eax,%eax
     7b7:	75 5f                	jne    818 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     7b9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7bc:	50                   	push   %eax
     7bd:	8d 45 e0             	lea    -0x20(%ebp),%eax
     7c0:	50                   	push   %eax
     7c1:	56                   	push   %esi
     7c2:	53                   	push   %ebx
     7c3:	e8 38 fc ff ff       	call   400 <gettoken>
     7c8:	83 c4 10             	add    $0x10,%esp
     7cb:	85 c0                	test   %eax,%eax
     7cd:	74 49                	je     818 <parseexec+0xe8>
    if(tok != 'a')
     7cf:	83 f8 61             	cmp    $0x61,%eax
     7d2:	75 62                	jne    836 <parseexec+0x106>
    cmd->argv[argc] = q;
     7d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
     7d7:	8b 55 d0             	mov    -0x30(%ebp),%edx
     7da:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     7de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7e1:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     7e5:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     7e8:	83 ff 0a             	cmp    $0xa,%edi
     7eb:	75 a3                	jne    790 <parseexec+0x60>
      panic("too many args");
     7ed:	83 ec 0c             	sub    $0xc,%esp
     7f0:	68 39 15 00 00       	push   $0x1539
     7f5:	e8 96 fa ff ff       	call   290 <panic>
     7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     800:	89 75 0c             	mov    %esi,0xc(%ebp)
     803:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     806:	8d 65 f4             	lea    -0xc(%ebp),%esp
     809:	5b                   	pop    %ebx
     80a:	5e                   	pop    %esi
     80b:	5f                   	pop    %edi
     80c:	5d                   	pop    %ebp
    return parseblock(ps, es);
     80d:	e9 ae 01 00 00       	jmp    9c0 <parseblock>
     812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     818:	8b 45 d0             	mov    -0x30(%ebp),%eax
     81b:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     822:	00 
  cmd->eargv[argc] = 0;
     823:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     82a:	00 
}
     82b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     82e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     831:	5b                   	pop    %ebx
     832:	5e                   	pop    %esi
     833:	5f                   	pop    %edi
     834:	5d                   	pop    %ebp
     835:	c3                   	ret
      panic("syntax");
     836:	83 ec 0c             	sub    $0xc,%esp
     839:	68 32 15 00 00       	push   $0x1532
     83e:	e8 4d fa ff ff       	call   290 <panic>
     843:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000850 <parsepipe>:
{
     850:	55                   	push   %ebp
     851:	89 e5                	mov    %esp,%ebp
     853:	57                   	push   %edi
     854:	56                   	push   %esi
     855:	53                   	push   %ebx
     856:	83 ec 14             	sub    $0x14,%esp
     859:	8b 75 08             	mov    0x8(%ebp),%esi
     85c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     85f:	57                   	push   %edi
     860:	56                   	push   %esi
     861:	e8 ca fe ff ff       	call   730 <parseexec>
  if(peek(ps, es, "|")){
     866:	83 c4 0c             	add    $0xc,%esp
     869:	68 4c 15 00 00       	push   $0x154c
  cmd = parseexec(ps, es);
     86e:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     870:	57                   	push   %edi
     871:	56                   	push   %esi
     872:	e8 f9 fc ff ff       	call   570 <peek>
     877:	83 c4 10             	add    $0x10,%esp
     87a:	85 c0                	test   %eax,%eax
     87c:	75 12                	jne    890 <parsepipe+0x40>
}
     87e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     881:	89 d8                	mov    %ebx,%eax
     883:	5b                   	pop    %ebx
     884:	5e                   	pop    %esi
     885:	5f                   	pop    %edi
     886:	5d                   	pop    %ebp
     887:	c3                   	ret
     888:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     88f:	90                   	nop
    gettoken(ps, es, 0, 0);
     890:	6a 00                	push   $0x0
     892:	6a 00                	push   $0x0
     894:	57                   	push   %edi
     895:	56                   	push   %esi
     896:	e8 65 fb ff ff       	call   400 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     89b:	58                   	pop    %eax
     89c:	5a                   	pop    %edx
     89d:	57                   	push   %edi
     89e:	56                   	push   %esi
     89f:	e8 ac ff ff ff       	call   850 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     8a4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8ab:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     8ad:	e8 6e 0b 00 00       	call   1420 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     8b2:	83 c4 0c             	add    $0xc,%esp
     8b5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     8b7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     8b9:	6a 00                	push   $0x0
     8bb:	50                   	push   %eax
     8bc:	e8 3f 06 00 00       	call   f00 <memset>
  cmd->left = left;
     8c1:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     8c4:	83 c4 10             	add    $0x10,%esp
     8c7:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     8c9:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     8cf:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     8d1:	89 7e 08             	mov    %edi,0x8(%esi)
}
     8d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8d7:	5b                   	pop    %ebx
     8d8:	5e                   	pop    %esi
     8d9:	5f                   	pop    %edi
     8da:	5d                   	pop    %ebp
     8db:	c3                   	ret
     8dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008e0 <parseline>:
{
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	57                   	push   %edi
     8e4:	56                   	push   %esi
     8e5:	53                   	push   %ebx
     8e6:	83 ec 24             	sub    $0x24,%esp
     8e9:	8b 75 08             	mov    0x8(%ebp),%esi
     8ec:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     8ef:	57                   	push   %edi
     8f0:	56                   	push   %esi
     8f1:	e8 5a ff ff ff       	call   850 <parsepipe>
  while(peek(ps, es, "&")){
     8f6:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     8f9:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     8fb:	eb 3b                	jmp    938 <parseline+0x58>
     8fd:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     900:	6a 00                	push   $0x0
     902:	6a 00                	push   $0x0
     904:	57                   	push   %edi
     905:	56                   	push   %esi
     906:	e8 f5 fa ff ff       	call   400 <gettoken>
  cmd = malloc(sizeof(*cmd));
     90b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     912:	e8 09 0b 00 00       	call   1420 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     917:	83 c4 0c             	add    $0xc,%esp
     91a:	6a 08                	push   $0x8
     91c:	6a 00                	push   $0x0
     91e:	50                   	push   %eax
     91f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     922:	e8 d9 05 00 00       	call   f00 <memset>
  cmd->type = BACK;
     927:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     92a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     92d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     933:	89 5a 04             	mov    %ebx,0x4(%edx)
     936:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     938:	83 ec 04             	sub    $0x4,%esp
     93b:	68 4e 15 00 00       	push   $0x154e
     940:	57                   	push   %edi
     941:	56                   	push   %esi
     942:	e8 29 fc ff ff       	call   570 <peek>
     947:	83 c4 10             	add    $0x10,%esp
     94a:	85 c0                	test   %eax,%eax
     94c:	75 b2                	jne    900 <parseline+0x20>
  if(peek(ps, es, ";")){
     94e:	83 ec 04             	sub    $0x4,%esp
     951:	68 4a 15 00 00       	push   $0x154a
     956:	57                   	push   %edi
     957:	56                   	push   %esi
     958:	e8 13 fc ff ff       	call   570 <peek>
     95d:	83 c4 10             	add    $0x10,%esp
     960:	85 c0                	test   %eax,%eax
     962:	75 0c                	jne    970 <parseline+0x90>
}
     964:	8d 65 f4             	lea    -0xc(%ebp),%esp
     967:	89 d8                	mov    %ebx,%eax
     969:	5b                   	pop    %ebx
     96a:	5e                   	pop    %esi
     96b:	5f                   	pop    %edi
     96c:	5d                   	pop    %ebp
     96d:	c3                   	ret
     96e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     970:	6a 00                	push   $0x0
     972:	6a 00                	push   $0x0
     974:	57                   	push   %edi
     975:	56                   	push   %esi
     976:	e8 85 fa ff ff       	call   400 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     97b:	58                   	pop    %eax
     97c:	5a                   	pop    %edx
     97d:	57                   	push   %edi
     97e:	56                   	push   %esi
     97f:	e8 5c ff ff ff       	call   8e0 <parseline>
  cmd = malloc(sizeof(*cmd));
     984:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     98b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     98d:	e8 8e 0a 00 00       	call   1420 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     992:	83 c4 0c             	add    $0xc,%esp
     995:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     997:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     999:	6a 00                	push   $0x0
     99b:	50                   	push   %eax
     99c:	e8 5f 05 00 00       	call   f00 <memset>
  cmd->left = left;
     9a1:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     9a4:	83 c4 10             	add    $0x10,%esp
     9a7:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     9a9:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     9af:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     9b1:	89 7e 08             	mov    %edi,0x8(%esi)
}
     9b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9b7:	5b                   	pop    %ebx
     9b8:	5e                   	pop    %esi
     9b9:	5f                   	pop    %edi
     9ba:	5d                   	pop    %ebp
     9bb:	c3                   	ret
     9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009c0 <parseblock>:
{
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	57                   	push   %edi
     9c4:	56                   	push   %esi
     9c5:	53                   	push   %ebx
     9c6:	83 ec 10             	sub    $0x10,%esp
     9c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     9cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     9cf:	68 30 15 00 00       	push   $0x1530
     9d4:	56                   	push   %esi
     9d5:	53                   	push   %ebx
     9d6:	e8 95 fb ff ff       	call   570 <peek>
     9db:	83 c4 10             	add    $0x10,%esp
     9de:	85 c0                	test   %eax,%eax
     9e0:	74 4a                	je     a2c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     9e2:	6a 00                	push   $0x0
     9e4:	6a 00                	push   $0x0
     9e6:	56                   	push   %esi
     9e7:	53                   	push   %ebx
     9e8:	e8 13 fa ff ff       	call   400 <gettoken>
  cmd = parseline(ps, es);
     9ed:	58                   	pop    %eax
     9ee:	5a                   	pop    %edx
     9ef:	56                   	push   %esi
     9f0:	53                   	push   %ebx
     9f1:	e8 ea fe ff ff       	call   8e0 <parseline>
  if(!peek(ps, es, ")"))
     9f6:	83 c4 0c             	add    $0xc,%esp
     9f9:	68 6c 15 00 00       	push   $0x156c
  cmd = parseline(ps, es);
     9fe:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a00:	56                   	push   %esi
     a01:	53                   	push   %ebx
     a02:	e8 69 fb ff ff       	call   570 <peek>
     a07:	83 c4 10             	add    $0x10,%esp
     a0a:	85 c0                	test   %eax,%eax
     a0c:	74 2b                	je     a39 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     a0e:	6a 00                	push   $0x0
     a10:	6a 00                	push   $0x0
     a12:	56                   	push   %esi
     a13:	53                   	push   %ebx
     a14:	e8 e7 f9 ff ff       	call   400 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a19:	83 c4 0c             	add    $0xc,%esp
     a1c:	56                   	push   %esi
     a1d:	53                   	push   %ebx
     a1e:	57                   	push   %edi
     a1f:	e8 cc fb ff ff       	call   5f0 <parseredirs>
}
     a24:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a27:	5b                   	pop    %ebx
     a28:	5e                   	pop    %esi
     a29:	5f                   	pop    %edi
     a2a:	5d                   	pop    %ebp
     a2b:	c3                   	ret
    panic("parseblock");
     a2c:	83 ec 0c             	sub    $0xc,%esp
     a2f:	68 50 15 00 00       	push   $0x1550
     a34:	e8 57 f8 ff ff       	call   290 <panic>
    panic("syntax - missing )");
     a39:	83 ec 0c             	sub    $0xc,%esp
     a3c:	68 5b 15 00 00       	push   $0x155b
     a41:	e8 4a f8 ff ff       	call   290 <panic>
     a46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a4d:	8d 76 00             	lea    0x0(%esi),%esi

00000a50 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a50:	55                   	push   %ebp
     a51:	89 e5                	mov    %esp,%ebp
     a53:	53                   	push   %ebx
     a54:	83 ec 04             	sub    $0x4,%esp
     a57:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a5a:	85 db                	test   %ebx,%ebx
     a5c:	0f 84 7e 00 00 00    	je     ae0 <nulterminate+0x90>
    return 0;

  switch(cmd->type){
     a62:	83 3b 05             	cmpl   $0x5,(%ebx)
     a65:	77 20                	ja     a87 <nulterminate+0x37>
     a67:	8b 03                	mov    (%ebx),%eax
     a69:	ff 24 85 14 16 00 00 	jmp    *0x1614(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     a70:	83 ec 0c             	sub    $0xc,%esp
     a73:	ff 73 04             	push   0x4(%ebx)
     a76:	e8 d5 ff ff ff       	call   a50 <nulterminate>
    nulterminate(lcmd->right);
     a7b:	58                   	pop    %eax
     a7c:	ff 73 08             	push   0x8(%ebx)
     a7f:	e8 cc ff ff ff       	call   a50 <nulterminate>
    break;
     a84:	83 c4 10             	add    $0x10,%esp
    return 0;
     a87:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a89:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a8c:	c9                   	leave
     a8d:	c3                   	ret
     a8e:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     a90:	83 ec 0c             	sub    $0xc,%esp
     a93:	ff 73 04             	push   0x4(%ebx)
     a96:	e8 b5 ff ff ff       	call   a50 <nulterminate>
    break;
     a9b:	83 c4 10             	add    $0x10,%esp
     a9e:	eb e7                	jmp    a87 <nulterminate+0x37>
    for(i=0; ecmd->argv[i]; i++)
     aa0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     aa3:	8d 43 08             	lea    0x8(%ebx),%eax
     aa6:	85 c9                	test   %ecx,%ecx
     aa8:	74 dd                	je     a87 <nulterminate+0x37>
     aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     ab0:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     ab3:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     ab6:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     ab9:	8b 50 fc             	mov    -0x4(%eax),%edx
     abc:	85 d2                	test   %edx,%edx
     abe:	75 f0                	jne    ab0 <nulterminate+0x60>
     ac0:	eb c5                	jmp    a87 <nulterminate+0x37>
     ac2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    nulterminate(rcmd->cmd);
     ac8:	83 ec 0c             	sub    $0xc,%esp
     acb:	ff 73 04             	push   0x4(%ebx)
     ace:	e8 7d ff ff ff       	call   a50 <nulterminate>
    *rcmd->efile = 0;
     ad3:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     ad6:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     ad9:	c6 00 00             	movb   $0x0,(%eax)
    break;
     adc:	eb a9                	jmp    a87 <nulterminate+0x37>
     ade:	66 90                	xchg   %ax,%ax
    return 0;
     ae0:	31 c0                	xor    %eax,%eax
     ae2:	eb a5                	jmp    a89 <nulterminate+0x39>
     ae4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     aeb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     aef:	90                   	nop

00000af0 <parsecmd>:
{
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	57                   	push   %edi
     af4:	56                   	push   %esi
  cmd = parseline(&s, es);
     af5:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     af8:	53                   	push   %ebx
     af9:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     afc:	8b 5d 08             	mov    0x8(%ebp),%ebx
     aff:	53                   	push   %ebx
     b00:	e8 cb 03 00 00       	call   ed0 <strlen>
  cmd = parseline(&s, es);
     b05:	59                   	pop    %ecx
     b06:	5e                   	pop    %esi
  es = s + strlen(s);
     b07:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b09:	53                   	push   %ebx
     b0a:	57                   	push   %edi
     b0b:	e8 d0 fd ff ff       	call   8e0 <parseline>
  peek(&s, es, "");
     b10:	83 c4 0c             	add    $0xc,%esp
     b13:	68 fa 15 00 00       	push   $0x15fa
  cmd = parseline(&s, es);
     b18:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b1a:	53                   	push   %ebx
     b1b:	57                   	push   %edi
     b1c:	e8 4f fa ff ff       	call   570 <peek>
  if(s != es){
     b21:	8b 45 08             	mov    0x8(%ebp),%eax
     b24:	83 c4 10             	add    $0x10,%esp
     b27:	39 d8                	cmp    %ebx,%eax
     b29:	75 13                	jne    b3e <parsecmd+0x4e>
  nulterminate(cmd);
     b2b:	83 ec 0c             	sub    $0xc,%esp
     b2e:	56                   	push   %esi
     b2f:	e8 1c ff ff ff       	call   a50 <nulterminate>
}
     b34:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b37:	89 f0                	mov    %esi,%eax
     b39:	5b                   	pop    %ebx
     b3a:	5e                   	pop    %esi
     b3b:	5f                   	pop    %edi
     b3c:	5d                   	pop    %ebp
     b3d:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     b3e:	52                   	push   %edx
     b3f:	50                   	push   %eax
     b40:	68 6e 15 00 00       	push   $0x156e
     b45:	6a 02                	push   $0x2
     b47:	e8 94 06 00 00       	call   11e0 <printf>
    panic("syntax");
     b4c:	c7 04 24 32 15 00 00 	movl   $0x1532,(%esp)
     b53:	e8 38 f7 ff ff       	call   290 <panic>
     b58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b5f:	90                   	nop

00000b60 <runcmd>:
{
     b60:	55                   	push   %ebp
     b61:	89 e5                	mov    %esp,%ebp
     b63:	57                   	push   %edi
     b64:	56                   	push   %esi
     b65:	53                   	push   %ebx
     b66:	83 ec 1c             	sub    $0x1c,%esp
     b69:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     b6c:	85 db                	test   %ebx,%ebx
     b6e:	74 20                	je     b90 <runcmd+0x30>
  switch(cmd->type){
     b70:	83 3b 05             	cmpl   $0x5,(%ebx)
     b73:	0f 87 44 01 00 00    	ja     cbd <runcmd+0x15d>
     b79:	8b 03                	mov    (%ebx),%eax
     b7b:	ff 24 85 2c 16 00 00 	jmp    *0x162c(,%eax,4)
      if(fork1()==0)
     b82:	e8 29 f7 ff ff       	call   2b0 <fork1>
     b87:	85 c0                	test   %eax,%eax
     b89:	0f 84 23 01 00 00    	je     cb2 <runcmd+0x152>
     b8f:	90                   	nop
    exit();
     b90:	e8 ee 04 00 00       	call   1083 <exit>
    if (!strcmp(ecmd->argv[0], "hist")) { // all hist commands (print or num) handled here
     b95:	50                   	push   %eax
     b96:	50                   	push   %eax
     b97:	68 84 15 00 00       	push   $0x1584
     b9c:	ff 73 04             	push   0x4(%ebx)
     b9f:	e8 cc 02 00 00       	call   e70 <strcmp>
     ba4:	83 c4 10             	add    $0x10,%esp
     ba7:	85 c0                	test   %eax,%eax
     ba9:	0f 84 d9 01 00 00    	je     d88 <runcmd+0x228>
    if(ecmd->argv[0] == 0)
     baf:	8b 43 04             	mov    0x4(%ebx),%eax
     bb2:	85 c0                	test   %eax,%eax
     bb4:	74 da                	je     b90 <runcmd+0x30>
    exec(ecmd->argv[0], ecmd->argv);
     bb6:	8d 53 04             	lea    0x4(%ebx),%edx
     bb9:	51                   	push   %ecx
     bba:	51                   	push   %ecx
     bbb:	52                   	push   %edx
     bbc:	50                   	push   %eax
     bbd:	e8 f9 04 00 00       	call   10bb <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     bc2:	83 c4 0c             	add    $0xc,%esp
     bc5:	ff 73 04             	push   0x4(%ebx)
     bc8:	68 a3 15 00 00       	push   $0x15a3
     bcd:	6a 02                	push   $0x2
     bcf:	e8 0c 06 00 00       	call   11e0 <printf>
    break;
     bd4:	83 c4 10             	add    $0x10,%esp
     bd7:	eb b7                	jmp    b90 <runcmd+0x30>
    if (pipe(p) == -1) {
     bd9:	83 ec 0c             	sub    $0xc,%esp
     bdc:	8d 45 e0             	lea    -0x20(%ebp),%eax
     bdf:	50                   	push   %eax
     be0:	e8 ae 04 00 00       	call   1093 <pipe>
     be5:	83 c4 10             	add    $0x10,%esp
     be8:	83 c0 01             	add    $0x1,%eax
     beb:	0f 84 4c 01 00 00    	je     d3d <runcmd+0x1dd>
    int child_pid1 = fork();
     bf1:	e8 85 04 00 00       	call   107b <fork>
    if (child_pid1 < 0) {
     bf6:	85 c0                	test   %eax,%eax
     bf8:	0f 88 cc 00 00 00    	js     cca <runcmd+0x16a>
    } else if (child_pid1 == 0) {
     bfe:	0f 84 ef 00 00 00    	je     cf3 <runcmd+0x193>
    int child_pid2 = fork();
     c04:	e8 72 04 00 00       	call   107b <fork>
    if (child_pid2 < 0) {
     c09:	85 c0                	test   %eax,%eax
     c0b:	0f 88 b9 00 00 00    	js     cca <runcmd+0x16a>
    } else if (child_pid2 == 0) {
     c11:	0f 84 01 01 00 00    	je     d18 <runcmd+0x1b8>
    close(p[0]);
     c17:	83 ec 0c             	sub    $0xc,%esp
     c1a:	ff 75 e0             	push   -0x20(%ebp)
     c1d:	e8 89 04 00 00       	call   10ab <close>
    close(p[1]);
     c22:	58                   	pop    %eax
     c23:	ff 75 e4             	push   -0x1c(%ebp)
     c26:	e8 80 04 00 00       	call   10ab <close>
    wait();
     c2b:	e8 5b 04 00 00       	call   108b <wait>
    wait();
     c30:	e8 56 04 00 00       	call   108b <wait>
    break;
     c35:	83 c4 10             	add    $0x10,%esp
     c38:	e9 53 ff ff ff       	jmp    b90 <runcmd+0x30>
    int child_pid = fork();
     c3d:	e8 39 04 00 00       	call   107b <fork>
    if (child_pid < 0) {
     c42:	85 c0                	test   %eax,%eax
     c44:	0f 88 80 00 00 00    	js     cca <runcmd+0x16a>
    } else if (child_pid == 0) {
     c4a:	74 66                	je     cb2 <runcmd+0x152>
      wait();
     c4c:	e8 3a 04 00 00       	call   108b <wait>
      runcmd(lcmd->right);
     c51:	83 ec 0c             	sub    $0xc,%esp
     c54:	ff 73 08             	push   0x8(%ebx)
     c57:	e8 04 ff ff ff       	call   b60 <runcmd>
    int fd, mode = rcmd->mode;
     c5c:	8b 73 10             	mov    0x10(%ebx),%esi
    char *file = rcmd->file;
     c5f:	8b 7b 08             	mov    0x8(%ebx),%edi
    if (mode == O_WRONLY || mode == (O_WRONLY|O_CREATE)) {
     c62:	89 f0                	mov    %esi,%eax
     c64:	80 e4 fd             	and    $0xfd,%ah
     c67:	83 e8 01             	sub    $0x1,%eax
     c6a:	0f 84 e3 00 00 00    	je     d53 <runcmd+0x1f3>
    } else if (mode == O_RDONLY) {
     c70:	85 f6                	test   %esi,%esi
     c72:	75 6c                	jne    ce0 <runcmd+0x180>
        fd = open(file, mode);
     c74:	56                   	push   %esi
     c75:	56                   	push   %esi
     c76:	6a 00                	push   $0x0
     c78:	57                   	push   %edi
     c79:	e8 45 04 00 00       	call   10c3 <open>
    if (fd < 0) {
     c7e:	83 c4 10             	add    $0x10,%esp
        fd = open(file, mode);
     c81:	89 c6                	mov    %eax,%esi
    if (fd < 0) {
     c83:	85 c0                	test   %eax,%eax
     c85:	0f 88 53 01 00 00    	js     dde <runcmd+0x27e>
        close(STDIN_FILENO);
     c8b:	83 ec 0c             	sub    $0xc,%esp
     c8e:	6a 00                	push   $0x0
     c90:	e8 16 04 00 00       	call   10ab <close>
        dup(fd);
     c95:	89 34 24             	mov    %esi,(%esp)
     c98:	e8 5e 04 00 00       	call   10fb <dup>
     c9d:	83 c4 10             	add    $0x10,%esp
    close(fd);
     ca0:	83 ec 0c             	sub    $0xc,%esp
     ca3:	56                   	push   %esi
     ca4:	e8 02 04 00 00       	call   10ab <close>
    runcmd(rcmd->cmd);
     ca9:	58                   	pop    %eax
     caa:	ff 73 04             	push   0x4(%ebx)
     cad:	e8 ae fe ff ff       	call   b60 <runcmd>
        runcmd(bcmd->cmd);
     cb2:	83 ec 0c             	sub    $0xc,%esp
     cb5:	ff 73 04             	push   0x4(%ebx)
     cb8:	e8 a3 fe ff ff       	call   b60 <runcmd>
    panic("runcmd");
     cbd:	83 ec 0c             	sub    $0xc,%esp
     cc0:	68 7d 15 00 00       	push   $0x157d
     cc5:	e8 c6 f5 ff ff       	call   290 <panic>
      printf(2, "fork failed\n");
     cca:	50                   	push   %eax
     ccb:	50                   	push   %eax
     ccc:	68 e1 15 00 00       	push   $0x15e1
     cd1:	6a 02                	push   $0x2
     cd3:	e8 08 05 00 00       	call   11e0 <printf>
      break;
     cd8:	83 c4 10             	add    $0x10,%esp
     cdb:	e9 b0 fe ff ff       	jmp    b90 <runcmd+0x30>
        printf(2, "Unsupported redirection mode\n");
     ce0:	51                   	push   %ecx
     ce1:	51                   	push   %ecx
     ce2:	68 b3 15 00 00       	push   $0x15b3
     ce7:	6a 02                	push   $0x2
     ce9:	e8 f2 04 00 00       	call   11e0 <printf>
        exit();
     cee:	e8 90 03 00 00       	call   1083 <exit>
      close(1);
     cf3:	83 ec 0c             	sub    $0xc,%esp
     cf6:	6a 01                	push   $0x1
     cf8:	e8 ae 03 00 00       	call   10ab <close>
      dup(p[1]);
     cfd:	5f                   	pop    %edi
     cfe:	ff 75 e4             	push   -0x1c(%ebp)
     d01:	e8 f5 03 00 00       	call   10fb <dup>
      close(p[0]);
     d06:	58                   	pop    %eax
     d07:	ff 75 e0             	push   -0x20(%ebp)
     d0a:	e8 9c 03 00 00       	call   10ab <close>
      runcmd(pcmd->left);
     d0f:	58                   	pop    %eax
     d10:	ff 73 04             	push   0x4(%ebx)
     d13:	e8 48 fe ff ff       	call   b60 <runcmd>
      close(0);
     d18:	83 ec 0c             	sub    $0xc,%esp
     d1b:	6a 00                	push   $0x0
     d1d:	e8 89 03 00 00       	call   10ab <close>
      dup(p[0]);
     d22:	5a                   	pop    %edx
     d23:	ff 75 e0             	push   -0x20(%ebp)
     d26:	e8 d0 03 00 00       	call   10fb <dup>
      close(p[1]);
     d2b:	59                   	pop    %ecx
     d2c:	ff 75 e4             	push   -0x1c(%ebp)
     d2f:	e8 77 03 00 00       	call   10ab <close>
      runcmd(pcmd->right);
     d34:	5e                   	pop    %esi
     d35:	ff 73 08             	push   0x8(%ebx)
     d38:	e8 23 fe ff ff       	call   b60 <runcmd>
      printf(2, "pipe failed\n");
     d3d:	50                   	push   %eax
     d3e:	50                   	push   %eax
     d3f:	68 ee 15 00 00       	push   $0x15ee
     d44:	6a 02                	push   $0x2
     d46:	e8 95 04 00 00       	call   11e0 <printf>
      break;
     d4b:	83 c4 10             	add    $0x10,%esp
     d4e:	e9 3d fe ff ff       	jmp    b90 <runcmd+0x30>
        unlink(file);
     d53:	83 ec 0c             	sub    $0xc,%esp
     d56:	57                   	push   %edi
     d57:	e8 77 03 00 00       	call   10d3 <unlink>
        fd = open(file, mode);
     d5c:	58                   	pop    %eax
     d5d:	5a                   	pop    %edx
     d5e:	56                   	push   %esi
     d5f:	57                   	push   %edi
     d60:	e8 5e 03 00 00       	call   10c3 <open>
    if (fd < 0) {
     d65:	83 c4 10             	add    $0x10,%esp
        fd = open(file, mode);
     d68:	89 c6                	mov    %eax,%esi
    if (fd < 0) {
     d6a:	85 c0                	test   %eax,%eax
     d6c:	78 70                	js     dde <runcmd+0x27e>
        close(STDOUT_FILENO);
     d6e:	83 ec 0c             	sub    $0xc,%esp
     d71:	6a 01                	push   $0x1
     d73:	e8 33 03 00 00       	call   10ab <close>
        dup(fd);
     d78:	89 34 24             	mov    %esi,(%esp)
     d7b:	e8 7b 03 00 00       	call   10fb <dup>
     d80:	83 c4 10             	add    $0x10,%esp
     d83:	e9 18 ff ff ff       	jmp    ca0 <runcmd+0x140>
      if(!strcmp(ecmd->argv[1], "print")) {
     d88:	50                   	push   %eax
     d89:	50                   	push   %eax
     d8a:	68 89 15 00 00       	push   $0x1589
     d8f:	ff 73 08             	push   0x8(%ebx)
     d92:	e8 d9 00 00 00       	call   e70 <strcmp>
     d97:	83 c4 10             	add    $0x10,%esp
     d9a:	89 c6                	mov    %eax,%esi
     d9c:	85 c0                	test   %eax,%eax
     d9e:	74 0b                	je     dab <runcmd+0x24b>
     da0:	eb 4f                	jmp    df1 <runcmd+0x291>
        for (int i = 0; i < 10; i++) {
     da2:	83 fe 0a             	cmp    $0xa,%esi
     da5:	0f 84 e5 fd ff ff    	je     b90 <runcmd+0x30>
          if (strcmp(history[i], "empty")) {
     dab:	6b de 64             	imul   $0x64,%esi,%ebx
     dae:	57                   	push   %edi
            printf(1, "%d. %s", i+1, history[i]);
     daf:	83 c6 01             	add    $0x1,%esi
          if (strcmp(history[i], "empty")) {
     db2:	57                   	push   %edi
     db3:	68 8f 15 00 00       	push   $0x158f
     db8:	81 c3 a0 1c 00 00    	add    $0x1ca0,%ebx
     dbe:	53                   	push   %ebx
     dbf:	e8 ac 00 00 00       	call   e70 <strcmp>
     dc4:	83 c4 10             	add    $0x10,%esp
     dc7:	85 c0                	test   %eax,%eax
     dc9:	74 d7                	je     da2 <runcmd+0x242>
            printf(1, "%d. %s", i+1, history[i]);
     dcb:	53                   	push   %ebx
     dcc:	56                   	push   %esi
     dcd:	68 95 15 00 00       	push   $0x1595
     dd2:	6a 01                	push   $0x1
     dd4:	e8 07 04 00 00       	call   11e0 <printf>
     dd9:	83 c4 10             	add    $0x10,%esp
     ddc:	eb c4                	jmp    da2 <runcmd+0x242>
        printf(2, "open %s failed\n", file);
     dde:	52                   	push   %edx
     ddf:	57                   	push   %edi
     de0:	68 d1 15 00 00       	push   $0x15d1
     de5:	6a 02                	push   $0x2
     de7:	e8 f4 03 00 00       	call   11e0 <printf>
        exit();
     dec:	e8 92 02 00 00       	call   1083 <exit>
        int historyIndex = atoi(ecmd->argv[1])-1; //hist <num> commands handled here, parsed like other commands
     df1:	83 ec 0c             	sub    $0xc,%esp
     df4:	ff 73 08             	push   0x8(%ebx)
     df7:	e8 14 02 00 00       	call   1010 <atoi>
        if (historyIndex >= 0 && historyIndex <= 9) {
     dfc:	83 c4 10             	add    $0x10,%esp
        int historyIndex = atoi(ecmd->argv[1])-1; //hist <num> commands handled here, parsed like other commands
     dff:	83 e8 01             	sub    $0x1,%eax
        if (historyIndex >= 0 && historyIndex <= 9) {
     e02:	83 f8 09             	cmp    $0x9,%eax
     e05:	77 19                	ja     e20 <runcmd+0x2c0>
          runcmd(parsecmd(history[historyIndex]));
     e07:	6b c0 64             	imul   $0x64,%eax,%eax
     e0a:	83 ec 0c             	sub    $0xc,%esp
     e0d:	05 a0 1c 00 00       	add    $0x1ca0,%eax
     e12:	50                   	push   %eax
     e13:	e8 d8 fc ff ff       	call   af0 <parsecmd>
     e18:	89 04 24             	mov    %eax,(%esp)
     e1b:	e8 40 fd ff ff       	call   b60 <runcmd>
          printf(2, "usage\n");
     e20:	53                   	push   %ebx
     e21:	53                   	push   %ebx
     e22:	68 9c 15 00 00       	push   $0x159c
     e27:	6a 02                	push   $0x2
     e29:	e8 b2 03 00 00       	call   11e0 <printf>
          break;
     e2e:	83 c4 10             	add    $0x10,%esp
     e31:	e9 5a fd ff ff       	jmp    b90 <runcmd+0x30>
     e36:	66 90                	xchg   %ax,%ax
     e38:	66 90                	xchg   %ax,%ax
     e3a:	66 90                	xchg   %ax,%ax
     e3c:	66 90                	xchg   %ax,%ax
     e3e:	66 90                	xchg   %ax,%ax

00000e40 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     e40:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     e41:	31 c0                	xor    %eax,%eax
{
     e43:	89 e5                	mov    %esp,%ebp
     e45:	53                   	push   %ebx
     e46:	8b 4d 08             	mov    0x8(%ebp),%ecx
     e49:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     e50:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     e54:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     e57:	83 c0 01             	add    $0x1,%eax
     e5a:	84 d2                	test   %dl,%dl
     e5c:	75 f2                	jne    e50 <strcpy+0x10>
    ;
  return os;
}
     e5e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e61:	89 c8                	mov    %ecx,%eax
     e63:	c9                   	leave
     e64:	c3                   	ret
     e65:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e70 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	53                   	push   %ebx
     e74:	8b 55 08             	mov    0x8(%ebp),%edx
     e77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     e7a:	0f b6 02             	movzbl (%edx),%eax
     e7d:	84 c0                	test   %al,%al
     e7f:	75 17                	jne    e98 <strcmp+0x28>
     e81:	eb 3a                	jmp    ebd <strcmp+0x4d>
     e83:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e87:	90                   	nop
     e88:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     e8c:	83 c2 01             	add    $0x1,%edx
     e8f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     e92:	84 c0                	test   %al,%al
     e94:	74 1a                	je     eb0 <strcmp+0x40>
    p++, q++;
     e96:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     e98:	0f b6 19             	movzbl (%ecx),%ebx
     e9b:	38 c3                	cmp    %al,%bl
     e9d:	74 e9                	je     e88 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     e9f:	29 d8                	sub    %ebx,%eax
}
     ea1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ea4:	c9                   	leave
     ea5:	c3                   	ret
     ea6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ead:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     eb0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     eb4:	31 c0                	xor    %eax,%eax
     eb6:	29 d8                	sub    %ebx,%eax
}
     eb8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ebb:	c9                   	leave
     ebc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     ebd:	0f b6 19             	movzbl (%ecx),%ebx
     ec0:	31 c0                	xor    %eax,%eax
     ec2:	eb db                	jmp    e9f <strcmp+0x2f>
     ec4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ecb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ecf:	90                   	nop

00000ed0 <strlen>:

uint
strlen(char *s)
{
     ed0:	55                   	push   %ebp
     ed1:	89 e5                	mov    %esp,%ebp
     ed3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     ed6:	80 3a 00             	cmpb   $0x0,(%edx)
     ed9:	74 15                	je     ef0 <strlen+0x20>
     edb:	31 c0                	xor    %eax,%eax
     edd:	8d 76 00             	lea    0x0(%esi),%esi
     ee0:	83 c0 01             	add    $0x1,%eax
     ee3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     ee7:	89 c1                	mov    %eax,%ecx
     ee9:	75 f5                	jne    ee0 <strlen+0x10>
    ;
  return n;
}
     eeb:	89 c8                	mov    %ecx,%eax
     eed:	5d                   	pop    %ebp
     eee:	c3                   	ret
     eef:	90                   	nop
  for(n = 0; s[n]; n++)
     ef0:	31 c9                	xor    %ecx,%ecx
}
     ef2:	5d                   	pop    %ebp
     ef3:	89 c8                	mov    %ecx,%eax
     ef5:	c3                   	ret
     ef6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     efd:	8d 76 00             	lea    0x0(%esi),%esi

00000f00 <memset>:

void*
memset(void *dst, int c, uint n)
{
     f00:	55                   	push   %ebp
     f01:	89 e5                	mov    %esp,%ebp
     f03:	57                   	push   %edi
     f04:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     f07:	8b 4d 10             	mov    0x10(%ebp),%ecx
     f0a:	8b 45 0c             	mov    0xc(%ebp),%eax
     f0d:	89 d7                	mov    %edx,%edi
     f0f:	fc                   	cld
     f10:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     f12:	8b 7d fc             	mov    -0x4(%ebp),%edi
     f15:	89 d0                	mov    %edx,%eax
     f17:	c9                   	leave
     f18:	c3                   	ret
     f19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f20 <strchr>:

char*
strchr(const char *s, char c)
{
     f20:	55                   	push   %ebp
     f21:	89 e5                	mov    %esp,%ebp
     f23:	8b 45 08             	mov    0x8(%ebp),%eax
     f26:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     f2a:	0f b6 10             	movzbl (%eax),%edx
     f2d:	84 d2                	test   %dl,%dl
     f2f:	75 12                	jne    f43 <strchr+0x23>
     f31:	eb 1d                	jmp    f50 <strchr+0x30>
     f33:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f37:	90                   	nop
     f38:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     f3c:	83 c0 01             	add    $0x1,%eax
     f3f:	84 d2                	test   %dl,%dl
     f41:	74 0d                	je     f50 <strchr+0x30>
    if(*s == c)
     f43:	38 d1                	cmp    %dl,%cl
     f45:	75 f1                	jne    f38 <strchr+0x18>
      return (char*)s;
  return 0;
}
     f47:	5d                   	pop    %ebp
     f48:	c3                   	ret
     f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     f50:	31 c0                	xor    %eax,%eax
}
     f52:	5d                   	pop    %ebp
     f53:	c3                   	ret
     f54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f5f:	90                   	nop

00000f60 <gets>:

char*
gets(char *buf, int max)
{
     f60:	55                   	push   %ebp
     f61:	89 e5                	mov    %esp,%ebp
     f63:	57                   	push   %edi
     f64:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     f65:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
     f68:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     f69:	31 db                	xor    %ebx,%ebx
{
     f6b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     f6e:	eb 27                	jmp    f97 <gets+0x37>
    cc = read(0, &c, 1);
     f70:	83 ec 04             	sub    $0x4,%esp
     f73:	6a 01                	push   $0x1
     f75:	56                   	push   %esi
     f76:	6a 00                	push   $0x0
     f78:	e8 1e 01 00 00       	call   109b <read>
    if(cc < 1)
     f7d:	83 c4 10             	add    $0x10,%esp
     f80:	85 c0                	test   %eax,%eax
     f82:	7e 1d                	jle    fa1 <gets+0x41>
      break;
    buf[i++] = c;
     f84:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     f88:	8b 55 08             	mov    0x8(%ebp),%edx
     f8b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     f8f:	3c 0a                	cmp    $0xa,%al
     f91:	74 10                	je     fa3 <gets+0x43>
     f93:	3c 0d                	cmp    $0xd,%al
     f95:	74 0c                	je     fa3 <gets+0x43>
  for(i=0; i+1 < max; ){
     f97:	89 df                	mov    %ebx,%edi
     f99:	83 c3 01             	add    $0x1,%ebx
     f9c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     f9f:	7c cf                	jl     f70 <gets+0x10>
     fa1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
     fa3:	8b 45 08             	mov    0x8(%ebp),%eax
     fa6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     faa:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fad:	5b                   	pop    %ebx
     fae:	5e                   	pop    %esi
     faf:	5f                   	pop    %edi
     fb0:	5d                   	pop    %ebp
     fb1:	c3                   	ret
     fb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000fc0 <stat>:

int
stat(char *n, struct stat *st)
{
     fc0:	55                   	push   %ebp
     fc1:	89 e5                	mov    %esp,%ebp
     fc3:	56                   	push   %esi
     fc4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     fc5:	83 ec 08             	sub    $0x8,%esp
     fc8:	6a 00                	push   $0x0
     fca:	ff 75 08             	push   0x8(%ebp)
     fcd:	e8 f1 00 00 00       	call   10c3 <open>
  if(fd < 0)
     fd2:	83 c4 10             	add    $0x10,%esp
     fd5:	85 c0                	test   %eax,%eax
     fd7:	78 27                	js     1000 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     fd9:	83 ec 08             	sub    $0x8,%esp
     fdc:	ff 75 0c             	push   0xc(%ebp)
     fdf:	89 c3                	mov    %eax,%ebx
     fe1:	50                   	push   %eax
     fe2:	e8 f4 00 00 00       	call   10db <fstat>
  close(fd);
     fe7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     fea:	89 c6                	mov    %eax,%esi
  close(fd);
     fec:	e8 ba 00 00 00       	call   10ab <close>
  return r;
     ff1:	83 c4 10             	add    $0x10,%esp
}
     ff4:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ff7:	89 f0                	mov    %esi,%eax
     ff9:	5b                   	pop    %ebx
     ffa:	5e                   	pop    %esi
     ffb:	5d                   	pop    %ebp
     ffc:	c3                   	ret
     ffd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1000:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1005:	eb ed                	jmp    ff4 <stat+0x34>
    1007:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    100e:	66 90                	xchg   %ax,%ax

00001010 <atoi>:

int
atoi(const char *s)
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	53                   	push   %ebx
    1014:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1017:	0f be 02             	movsbl (%edx),%eax
    101a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    101d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1020:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1025:	77 1e                	ja     1045 <atoi+0x35>
    1027:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    102e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1030:	83 c2 01             	add    $0x1,%edx
    1033:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1036:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    103a:	0f be 02             	movsbl (%edx),%eax
    103d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1040:	80 fb 09             	cmp    $0x9,%bl
    1043:	76 eb                	jbe    1030 <atoi+0x20>
  return n;
}
    1045:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1048:	89 c8                	mov    %ecx,%eax
    104a:	c9                   	leave
    104b:	c3                   	ret
    104c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001050 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	57                   	push   %edi
    1054:	56                   	push   %esi
    1055:	8b 45 10             	mov    0x10(%ebp),%eax
    1058:	8b 55 08             	mov    0x8(%ebp),%edx
    105b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    105e:	85 c0                	test   %eax,%eax
    1060:	7e 13                	jle    1075 <memmove+0x25>
    1062:	01 d0                	add    %edx,%eax
  dst = vdst;
    1064:	89 d7                	mov    %edx,%edi
    1066:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    106d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1070:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1071:	39 f8                	cmp    %edi,%eax
    1073:	75 fb                	jne    1070 <memmove+0x20>
  return vdst;
}
    1075:	5e                   	pop    %esi
    1076:	89 d0                	mov    %edx,%eax
    1078:	5f                   	pop    %edi
    1079:	5d                   	pop    %ebp
    107a:	c3                   	ret

0000107b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    107b:	b8 01 00 00 00       	mov    $0x1,%eax
    1080:	cd 40                	int    $0x40
    1082:	c3                   	ret

00001083 <exit>:
SYSCALL(exit)
    1083:	b8 02 00 00 00       	mov    $0x2,%eax
    1088:	cd 40                	int    $0x40
    108a:	c3                   	ret

0000108b <wait>:
SYSCALL(wait)
    108b:	b8 03 00 00 00       	mov    $0x3,%eax
    1090:	cd 40                	int    $0x40
    1092:	c3                   	ret

00001093 <pipe>:
SYSCALL(pipe)
    1093:	b8 04 00 00 00       	mov    $0x4,%eax
    1098:	cd 40                	int    $0x40
    109a:	c3                   	ret

0000109b <read>:
SYSCALL(read)
    109b:	b8 05 00 00 00       	mov    $0x5,%eax
    10a0:	cd 40                	int    $0x40
    10a2:	c3                   	ret

000010a3 <write>:
SYSCALL(write)
    10a3:	b8 10 00 00 00       	mov    $0x10,%eax
    10a8:	cd 40                	int    $0x40
    10aa:	c3                   	ret

000010ab <close>:
SYSCALL(close)
    10ab:	b8 15 00 00 00       	mov    $0x15,%eax
    10b0:	cd 40                	int    $0x40
    10b2:	c3                   	ret

000010b3 <kill>:
SYSCALL(kill)
    10b3:	b8 06 00 00 00       	mov    $0x6,%eax
    10b8:	cd 40                	int    $0x40
    10ba:	c3                   	ret

000010bb <exec>:
SYSCALL(exec)
    10bb:	b8 07 00 00 00       	mov    $0x7,%eax
    10c0:	cd 40                	int    $0x40
    10c2:	c3                   	ret

000010c3 <open>:
SYSCALL(open)
    10c3:	b8 0f 00 00 00       	mov    $0xf,%eax
    10c8:	cd 40                	int    $0x40
    10ca:	c3                   	ret

000010cb <mknod>:
SYSCALL(mknod)
    10cb:	b8 11 00 00 00       	mov    $0x11,%eax
    10d0:	cd 40                	int    $0x40
    10d2:	c3                   	ret

000010d3 <unlink>:
SYSCALL(unlink)
    10d3:	b8 12 00 00 00       	mov    $0x12,%eax
    10d8:	cd 40                	int    $0x40
    10da:	c3                   	ret

000010db <fstat>:
SYSCALL(fstat)
    10db:	b8 08 00 00 00       	mov    $0x8,%eax
    10e0:	cd 40                	int    $0x40
    10e2:	c3                   	ret

000010e3 <link>:
SYSCALL(link)
    10e3:	b8 13 00 00 00       	mov    $0x13,%eax
    10e8:	cd 40                	int    $0x40
    10ea:	c3                   	ret

000010eb <mkdir>:
SYSCALL(mkdir)
    10eb:	b8 14 00 00 00       	mov    $0x14,%eax
    10f0:	cd 40                	int    $0x40
    10f2:	c3                   	ret

000010f3 <chdir>:
SYSCALL(chdir)
    10f3:	b8 09 00 00 00       	mov    $0x9,%eax
    10f8:	cd 40                	int    $0x40
    10fa:	c3                   	ret

000010fb <dup>:
SYSCALL(dup)
    10fb:	b8 0a 00 00 00       	mov    $0xa,%eax
    1100:	cd 40                	int    $0x40
    1102:	c3                   	ret

00001103 <getpid>:
SYSCALL(getpid)
    1103:	b8 0b 00 00 00       	mov    $0xb,%eax
    1108:	cd 40                	int    $0x40
    110a:	c3                   	ret

0000110b <sbrk>:
SYSCALL(sbrk)
    110b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1110:	cd 40                	int    $0x40
    1112:	c3                   	ret

00001113 <sleep>:
SYSCALL(sleep)
    1113:	b8 0d 00 00 00       	mov    $0xd,%eax
    1118:	cd 40                	int    $0x40
    111a:	c3                   	ret

0000111b <uptime>:
SYSCALL(uptime)
    111b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1120:	cd 40                	int    $0x40
    1122:	c3                   	ret

00001123 <shutdown>:
SYSCALL(shutdown)
    1123:	b8 16 00 00 00       	mov    $0x16,%eax
    1128:	cd 40                	int    $0x40
    112a:	c3                   	ret

0000112b <cps>:
SYSCALL(cps)
    112b:	b8 17 00 00 00       	mov    $0x17,%eax
    1130:	cd 40                	int    $0x40
    1132:	c3                   	ret

00001133 <chpr>:
SYSCALL(chpr)
    1133:	b8 18 00 00 00       	mov    $0x18,%eax
    1138:	cd 40                	int    $0x40
    113a:	c3                   	ret
    113b:	66 90                	xchg   %ax,%ax
    113d:	66 90                	xchg   %ax,%ax
    113f:	90                   	nop

00001140 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	56                   	push   %esi
    1145:	53                   	push   %ebx
    1146:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    1148:	89 d1                	mov    %edx,%ecx
{
    114a:	83 ec 3c             	sub    $0x3c,%esp
    114d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
    1150:	85 d2                	test   %edx,%edx
    1152:	0f 89 80 00 00 00    	jns    11d8 <printint+0x98>
    1158:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    115c:	74 7a                	je     11d8 <printint+0x98>
    x = -xx;
    115e:	f7 d9                	neg    %ecx
    neg = 1;
    1160:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
    1165:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    1168:	31 f6                	xor    %esi,%esi
    116a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1170:	89 c8                	mov    %ecx,%eax
    1172:	31 d2                	xor    %edx,%edx
    1174:	89 f7                	mov    %esi,%edi
    1176:	f7 f3                	div    %ebx
    1178:	8d 76 01             	lea    0x1(%esi),%esi
    117b:	0f b6 92 a4 16 00 00 	movzbl 0x16a4(%edx),%edx
    1182:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
    1186:	89 ca                	mov    %ecx,%edx
    1188:	89 c1                	mov    %eax,%ecx
    118a:	39 da                	cmp    %ebx,%edx
    118c:	73 e2                	jae    1170 <printint+0x30>
  if(neg)
    118e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1191:	85 c0                	test   %eax,%eax
    1193:	74 07                	je     119c <printint+0x5c>
    buf[i++] = '-';
    1195:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
    119a:	89 f7                	mov    %esi,%edi
    119c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    119f:	8b 75 c0             	mov    -0x40(%ebp),%esi
    11a2:	01 df                	add    %ebx,%edi
    11a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
    11a8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
    11ab:	83 ec 04             	sub    $0x4,%esp
    11ae:	88 45 d7             	mov    %al,-0x29(%ebp)
    11b1:	8d 45 d7             	lea    -0x29(%ebp),%eax
    11b4:	6a 01                	push   $0x1
    11b6:	50                   	push   %eax
    11b7:	56                   	push   %esi
    11b8:	e8 e6 fe ff ff       	call   10a3 <write>
  while(--i >= 0)
    11bd:	89 f8                	mov    %edi,%eax
    11bf:	83 c4 10             	add    $0x10,%esp
    11c2:	83 ef 01             	sub    $0x1,%edi
    11c5:	39 d8                	cmp    %ebx,%eax
    11c7:	75 df                	jne    11a8 <printint+0x68>
}
    11c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11cc:	5b                   	pop    %ebx
    11cd:	5e                   	pop    %esi
    11ce:	5f                   	pop    %edi
    11cf:	5d                   	pop    %ebp
    11d0:	c3                   	ret
    11d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    11d8:	31 c0                	xor    %eax,%eax
    11da:	eb 89                	jmp    1165 <printint+0x25>
    11dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	57                   	push   %edi
    11e4:	56                   	push   %esi
    11e5:	53                   	push   %ebx
    11e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    11e9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    11ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    11ef:	0f b6 1e             	movzbl (%esi),%ebx
    11f2:	83 c6 01             	add    $0x1,%esi
    11f5:	84 db                	test   %bl,%bl
    11f7:	74 67                	je     1260 <printf+0x80>
    11f9:	8d 4d 10             	lea    0x10(%ebp),%ecx
    11fc:	31 d2                	xor    %edx,%edx
    11fe:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    1201:	eb 34                	jmp    1237 <printf+0x57>
    1203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1207:	90                   	nop
    1208:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    120b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1210:	83 f8 25             	cmp    $0x25,%eax
    1213:	74 18                	je     122d <printf+0x4d>
  write(fd, &c, 1);
    1215:	83 ec 04             	sub    $0x4,%esp
    1218:	8d 45 e7             	lea    -0x19(%ebp),%eax
    121b:	88 5d e7             	mov    %bl,-0x19(%ebp)
    121e:	6a 01                	push   $0x1
    1220:	50                   	push   %eax
    1221:	57                   	push   %edi
    1222:	e8 7c fe ff ff       	call   10a3 <write>
    1227:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    122a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    122d:	0f b6 1e             	movzbl (%esi),%ebx
    1230:	83 c6 01             	add    $0x1,%esi
    1233:	84 db                	test   %bl,%bl
    1235:	74 29                	je     1260 <printf+0x80>
    c = fmt[i] & 0xff;
    1237:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    123a:	85 d2                	test   %edx,%edx
    123c:	74 ca                	je     1208 <printf+0x28>
      }
    } else if(state == '%'){
    123e:	83 fa 25             	cmp    $0x25,%edx
    1241:	75 ea                	jne    122d <printf+0x4d>
      if(c == 'd'){
    1243:	83 f8 25             	cmp    $0x25,%eax
    1246:	0f 84 24 01 00 00    	je     1370 <printf+0x190>
    124c:	83 e8 63             	sub    $0x63,%eax
    124f:	83 f8 15             	cmp    $0x15,%eax
    1252:	77 1c                	ja     1270 <printf+0x90>
    1254:	ff 24 85 4c 16 00 00 	jmp    *0x164c(,%eax,4)
    125b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    125f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1260:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1263:	5b                   	pop    %ebx
    1264:	5e                   	pop    %esi
    1265:	5f                   	pop    %edi
    1266:	5d                   	pop    %ebp
    1267:	c3                   	ret
    1268:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    126f:	90                   	nop
  write(fd, &c, 1);
    1270:	83 ec 04             	sub    $0x4,%esp
    1273:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1276:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    127a:	6a 01                	push   $0x1
    127c:	52                   	push   %edx
    127d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    1280:	57                   	push   %edi
    1281:	e8 1d fe ff ff       	call   10a3 <write>
    1286:	83 c4 0c             	add    $0xc,%esp
    1289:	88 5d e7             	mov    %bl,-0x19(%ebp)
    128c:	6a 01                	push   $0x1
    128e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1291:	52                   	push   %edx
    1292:	57                   	push   %edi
    1293:	e8 0b fe ff ff       	call   10a3 <write>
        putc(fd, c);
    1298:	83 c4 10             	add    $0x10,%esp
      state = 0;
    129b:	31 d2                	xor    %edx,%edx
    129d:	eb 8e                	jmp    122d <printf+0x4d>
    129f:	90                   	nop
        printint(fd, *ap, 16, 0);
    12a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    12a3:	83 ec 0c             	sub    $0xc,%esp
    12a6:	b9 10 00 00 00       	mov    $0x10,%ecx
    12ab:	8b 13                	mov    (%ebx),%edx
    12ad:	6a 00                	push   $0x0
    12af:	89 f8                	mov    %edi,%eax
        ap++;
    12b1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
    12b4:	e8 87 fe ff ff       	call   1140 <printint>
        ap++;
    12b9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    12bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
    12bf:	31 d2                	xor    %edx,%edx
    12c1:	e9 67 ff ff ff       	jmp    122d <printf+0x4d>
    12c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12cd:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
    12d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    12d3:	8b 18                	mov    (%eax),%ebx
        ap++;
    12d5:	83 c0 04             	add    $0x4,%eax
    12d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    12db:	85 db                	test   %ebx,%ebx
    12dd:	0f 84 9d 00 00 00    	je     1380 <printf+0x1a0>
        while(*s != 0){
    12e3:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    12e6:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    12e8:	84 c0                	test   %al,%al
    12ea:	0f 84 3d ff ff ff    	je     122d <printf+0x4d>
    12f0:	8d 55 e7             	lea    -0x19(%ebp),%edx
    12f3:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    12f6:	89 de                	mov    %ebx,%esi
    12f8:	89 d3                	mov    %edx,%ebx
    12fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1300:	83 ec 04             	sub    $0x4,%esp
    1303:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    1306:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1309:	6a 01                	push   $0x1
    130b:	53                   	push   %ebx
    130c:	57                   	push   %edi
    130d:	e8 91 fd ff ff       	call   10a3 <write>
        while(*s != 0){
    1312:	0f b6 06             	movzbl (%esi),%eax
    1315:	83 c4 10             	add    $0x10,%esp
    1318:	84 c0                	test   %al,%al
    131a:	75 e4                	jne    1300 <printf+0x120>
      state = 0;
    131c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    131f:	31 d2                	xor    %edx,%edx
    1321:	e9 07 ff ff ff       	jmp    122d <printf+0x4d>
    1326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    132d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1330:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1333:	83 ec 0c             	sub    $0xc,%esp
    1336:	b9 0a 00 00 00       	mov    $0xa,%ecx
    133b:	8b 13                	mov    (%ebx),%edx
    133d:	6a 01                	push   $0x1
    133f:	e9 6b ff ff ff       	jmp    12af <printf+0xcf>
    1344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1348:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    134b:	83 ec 04             	sub    $0x4,%esp
    134e:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    1351:	8b 03                	mov    (%ebx),%eax
        ap++;
    1353:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    1356:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1359:	6a 01                	push   $0x1
    135b:	52                   	push   %edx
    135c:	57                   	push   %edi
    135d:	e8 41 fd ff ff       	call   10a3 <write>
        ap++;
    1362:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1365:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1368:	31 d2                	xor    %edx,%edx
    136a:	e9 be fe ff ff       	jmp    122d <printf+0x4d>
    136f:	90                   	nop
  write(fd, &c, 1);
    1370:	83 ec 04             	sub    $0x4,%esp
    1373:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1376:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1379:	6a 01                	push   $0x1
    137b:	e9 11 ff ff ff       	jmp    1291 <printf+0xb1>
    1380:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    1385:	bb 44 16 00 00       	mov    $0x1644,%ebx
    138a:	e9 61 ff ff ff       	jmp    12f0 <printf+0x110>
    138f:	90                   	nop

00001390 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1390:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1391:	a1 04 21 00 00       	mov    0x2104,%eax
{
    1396:	89 e5                	mov    %esp,%ebp
    1398:	57                   	push   %edi
    1399:	56                   	push   %esi
    139a:	53                   	push   %ebx
    139b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    139e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    13a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13a8:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13aa:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    13ac:	39 ca                	cmp    %ecx,%edx
    13ae:	73 30                	jae    13e0 <free+0x50>
    13b0:	39 c1                	cmp    %eax,%ecx
    13b2:	72 04                	jb     13b8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13b4:	39 c2                	cmp    %eax,%edx
    13b6:	72 f0                	jb     13a8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    13b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    13bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    13be:	39 f8                	cmp    %edi,%eax
    13c0:	74 2e                	je     13f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    13c2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    13c5:	8b 42 04             	mov    0x4(%edx),%eax
    13c8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    13cb:	39 f1                	cmp    %esi,%ecx
    13cd:	74 38                	je     1407 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    13cf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    13d1:	5b                   	pop    %ebx
  freep = p;
    13d2:	89 15 04 21 00 00    	mov    %edx,0x2104
}
    13d8:	5e                   	pop    %esi
    13d9:	5f                   	pop    %edi
    13da:	5d                   	pop    %ebp
    13db:	c3                   	ret
    13dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13e0:	39 c1                	cmp    %eax,%ecx
    13e2:	72 d0                	jb     13b4 <free+0x24>
    13e4:	eb c2                	jmp    13a8 <free+0x18>
    13e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ed:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
    13f0:	03 70 04             	add    0x4(%eax),%esi
    13f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    13f6:	8b 02                	mov    (%edx),%eax
    13f8:	8b 00                	mov    (%eax),%eax
    13fa:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    13fd:	8b 42 04             	mov    0x4(%edx),%eax
    1400:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1403:	39 f1                	cmp    %esi,%ecx
    1405:	75 c8                	jne    13cf <free+0x3f>
    p->s.size += bp->s.size;
    1407:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    140a:	89 15 04 21 00 00    	mov    %edx,0x2104
    p->s.size += bp->s.size;
    1410:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1413:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1416:	89 0a                	mov    %ecx,(%edx)
}
    1418:	5b                   	pop    %ebx
    1419:	5e                   	pop    %esi
    141a:	5f                   	pop    %edi
    141b:	5d                   	pop    %ebp
    141c:	c3                   	ret
    141d:	8d 76 00             	lea    0x0(%esi),%esi

00001420 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	57                   	push   %edi
    1424:	56                   	push   %esi
    1425:	53                   	push   %ebx
    1426:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1429:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    142c:	8b 15 04 21 00 00    	mov    0x2104,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1432:	8d 78 07             	lea    0x7(%eax),%edi
    1435:	c1 ef 03             	shr    $0x3,%edi
    1438:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    143b:	85 d2                	test   %edx,%edx
    143d:	0f 84 8d 00 00 00    	je     14d0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1443:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1445:	8b 48 04             	mov    0x4(%eax),%ecx
    1448:	39 f9                	cmp    %edi,%ecx
    144a:	73 64                	jae    14b0 <malloc+0x90>
  if(nu < 4096)
    144c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1451:	39 df                	cmp    %ebx,%edi
    1453:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1456:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    145d:	eb 0a                	jmp    1469 <malloc+0x49>
    145f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1460:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1462:	8b 48 04             	mov    0x4(%eax),%ecx
    1465:	39 f9                	cmp    %edi,%ecx
    1467:	73 47                	jae    14b0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1469:	89 c2                	mov    %eax,%edx
    146b:	39 05 04 21 00 00    	cmp    %eax,0x2104
    1471:	75 ed                	jne    1460 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    1473:	83 ec 0c             	sub    $0xc,%esp
    1476:	56                   	push   %esi
    1477:	e8 8f fc ff ff       	call   110b <sbrk>
  if(p == (char*)-1)
    147c:	83 c4 10             	add    $0x10,%esp
    147f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1482:	74 1c                	je     14a0 <malloc+0x80>
  hp->s.size = nu;
    1484:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1487:	83 ec 0c             	sub    $0xc,%esp
    148a:	83 c0 08             	add    $0x8,%eax
    148d:	50                   	push   %eax
    148e:	e8 fd fe ff ff       	call   1390 <free>
  return freep;
    1493:	8b 15 04 21 00 00    	mov    0x2104,%edx
      if((p = morecore(nunits)) == 0)
    1499:	83 c4 10             	add    $0x10,%esp
    149c:	85 d2                	test   %edx,%edx
    149e:	75 c0                	jne    1460 <malloc+0x40>
        return 0;
  }
}
    14a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    14a3:	31 c0                	xor    %eax,%eax
}
    14a5:	5b                   	pop    %ebx
    14a6:	5e                   	pop    %esi
    14a7:	5f                   	pop    %edi
    14a8:	5d                   	pop    %ebp
    14a9:	c3                   	ret
    14aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    14b0:	39 cf                	cmp    %ecx,%edi
    14b2:	74 4c                	je     1500 <malloc+0xe0>
        p->s.size -= nunits;
    14b4:	29 f9                	sub    %edi,%ecx
    14b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    14b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    14bc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    14bf:	89 15 04 21 00 00    	mov    %edx,0x2104
}
    14c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    14c8:	83 c0 08             	add    $0x8,%eax
}
    14cb:	5b                   	pop    %ebx
    14cc:	5e                   	pop    %esi
    14cd:	5f                   	pop    %edi
    14ce:	5d                   	pop    %ebp
    14cf:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    14d0:	c7 05 04 21 00 00 08 	movl   $0x2108,0x2104
    14d7:	21 00 00 
    base.s.size = 0;
    14da:	b8 08 21 00 00       	mov    $0x2108,%eax
    base.s.ptr = freep = prevp = &base;
    14df:	c7 05 08 21 00 00 08 	movl   $0x2108,0x2108
    14e6:	21 00 00 
    base.s.size = 0;
    14e9:	c7 05 0c 21 00 00 00 	movl   $0x0,0x210c
    14f0:	00 00 00 
    if(p->s.size >= nunits){
    14f3:	e9 54 ff ff ff       	jmp    144c <malloc+0x2c>
    14f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ff:	90                   	nop
        prevp->s.ptr = p->s.ptr;
    1500:	8b 08                	mov    (%eax),%ecx
    1502:	89 0a                	mov    %ecx,(%edx)
    1504:	eb b9                	jmp    14bf <malloc+0x9f>
