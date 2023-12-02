
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
       e:	bb 00 1e 00 00       	mov    $0x1e00,%ebx
      13:	51                   	push   %ecx
      14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  static char buf[100];
  int fd;
  for (int i = 0; i < 10; i++) { // initialize the history buffer
    strcpy(history[i], "empty");
      18:	83 ec 08             	sub    $0x8,%esp
      1b:	68 6f 16 00 00       	push   $0x166f
      20:	53                   	push   %ebx
  for (int i = 0; i < 10; i++) { // initialize the history buffer
      21:	83 c3 64             	add    $0x64,%ebx
    strcpy(history[i], "empty");
      24:	e8 f7 0e 00 00       	call   f20 <strcpy>
  for (int i = 0; i < 10; i++) { // initialize the history buffer
      29:	83 c4 10             	add    $0x10,%esp
      2c:	81 fb e8 21 00 00    	cmp    $0x21e8,%ebx
      32:	75 e4                	jne    18 <main+0x18>
      34:	eb 13                	jmp    49 <main+0x49>
      36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      3d:	8d 76 00             	lea    0x0(%esi),%esi
  }

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      40:	83 f8 02             	cmp    $0x2,%eax
      43:	0f 8f 9b 01 00 00    	jg     1e4 <main+0x1e4>
  while((fd = open("console", O_RDWR)) >= 0){
      49:	83 ec 08             	sub    $0x8,%esp
      4c:	6a 02                	push   $0x2
      4e:	68 db 16 00 00       	push   $0x16db
      53:	e8 4b 11 00 00       	call   11a3 <open>
      58:	83 c4 10             	add    $0x10,%esp
      5b:	85 c0                	test   %eax,%eax
      5d:	79 e1                	jns    40 <main+0x40>
      5f:	90                   	nop
  printf(2, "$ ");
      60:	83 ec 08             	sub    $0x8,%esp
      63:	68 e8 15 00 00       	push   $0x15e8
      68:	6a 02                	push   $0x2
      6a:	e8 51 12 00 00       	call   12c0 <printf>
  memset(buf, 0, nbuf);
      6f:	83 c4 0c             	add    $0xc,%esp
      72:	6a 64                	push   $0x64
      74:	6a 00                	push   $0x0
      76:	68 00 22 00 00       	push   $0x2200
      7b:	e8 60 0f 00 00       	call   fe0 <memset>
  gets(buf, nbuf);
      80:	58                   	pop    %eax
      81:	5a                   	pop    %edx
      82:	6a 64                	push   $0x64
      84:	68 00 22 00 00       	push   $0x2200
      89:	e8 b2 0f 00 00       	call   1040 <gets>
  if(buf[0] == 0) // EOF
      8e:	0f b6 05 00 22 00 00 	movzbl 0x2200,%eax
      95:	83 c4 10             	add    $0x10,%esp
      98:	84 c0                	test   %al,%al
      9a:	0f 84 10 01 00 00    	je     1b0 <main+0x1b0>
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a0:	3c 63                	cmp    $0x63,%al
      a2:	75 0d                	jne    b1 <main+0xb1>
      a4:	80 3d 01 22 00 00 64 	cmpb   $0x64,0x2201
      ab:	0f 84 a7 00 00 00    	je     158 <main+0x158>
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if (!strcmp(buf, "\n")) { // exclude empty lines from history (interferes with "hist print")
      b1:	83 ec 08             	sub    $0x8,%esp
      b4:	68 d9 16 00 00       	push   $0x16d9
      b9:	68 00 22 00 00       	push   $0x2200
      be:	e8 8d 0e 00 00       	call   f50 <strcmp>
      c3:	83 c4 10             	add    $0x10,%esp
      c6:	85 c0                	test   %eax,%eax
      c8:	74 96                	je     60 <main+0x60>
      continue;
    }
    // exclude hist commands from history buffer
    if (!(buf[0] == 'h' && buf[1] == 'i' && buf[2] == 's' && buf[3] == 't' && buf[4] == ' ')) {
      ca:	80 3d 00 22 00 00 68 	cmpb   $0x68,0x2200
      d1:	75 0d                	jne    e0 <main+0xe0>
      d3:	80 3d 01 22 00 00 69 	cmpb   $0x69,0x2201
      da:	0f 84 d8 00 00 00    	je     1b8 <main+0x1b8>
  for (int i = 9; i >= 1; i--) {
      e0:	bb 84 21 00 00       	mov    $0x2184,%ebx
      e5:	8d 76 00             	lea    0x0(%esi),%esi
    strcpy(history[i], history[i-1]);
      e8:	83 ec 08             	sub    $0x8,%esp
      eb:	89 d8                	mov    %ebx,%eax
      ed:	83 eb 64             	sub    $0x64,%ebx
      f0:	53                   	push   %ebx
      f1:	50                   	push   %eax
      f2:	e8 29 0e 00 00       	call   f20 <strcpy>
  for (int i = 9; i >= 1; i--) {
      f7:	83 c4 10             	add    $0x10,%esp
      fa:	81 fb 00 1e 00 00    	cmp    $0x1e00,%ebx
     100:	75 e6                	jne    e8 <main+0xe8>
  strcpy(history[0], buf);
     102:	83 ec 08             	sub    $0x8,%esp
     105:	68 00 22 00 00       	push   $0x2200
     10a:	68 00 1e 00 00       	push   $0x1e00
     10f:	e8 0c 0e 00 00       	call   f20 <strcpy>
}
     114:	83 c4 10             	add    $0x10,%esp
int
fork1(void)
{
  int pid;

  pid = fork();
     117:	e8 3f 10 00 00       	call   115b <fork>
  if(pid == -1)
     11c:	83 f8 ff             	cmp    $0xffffffff,%eax
     11f:	0f 84 d0 00 00 00    	je     1f5 <main+0x1f5>
    if(fork1() == 0)
     125:	85 c0                	test   %eax,%eax
     127:	74 0f                	je     138 <main+0x138>
    wait();
     129:	e8 3d 10 00 00       	call   116b <wait>
     12e:	e9 2d ff ff ff       	jmp    60 <main+0x60>
     133:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     137:	90                   	nop
      runcmd(parsecmd(buf));
     138:	83 ec 0c             	sub    $0xc,%esp
     13b:	68 00 22 00 00       	push   $0x2200
     140:	e8 bb 09 00 00       	call   b00 <parsecmd>
     145:	89 04 24             	mov    %eax,(%esp)
     148:	e8 23 0a 00 00       	call   b70 <runcmd>
     14d:	83 c4 10             	add    $0x10,%esp
     150:	eb d7                	jmp    129 <main+0x129>
     152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     158:	80 3d 02 22 00 00 20 	cmpb   $0x20,0x2202
     15f:	0f 85 4c ff ff ff    	jne    b1 <main+0xb1>
      buf[strlen(buf)-1] = 0;  // chop \n
     165:	83 ec 0c             	sub    $0xc,%esp
     168:	68 00 22 00 00       	push   $0x2200
     16d:	e8 3e 0e 00 00       	call   fb0 <strlen>
      if(chdir(buf+3) < 0)
     172:	c7 04 24 03 22 00 00 	movl   $0x2203,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
     179:	c6 80 ff 21 00 00 00 	movb   $0x0,0x21ff(%eax)
      if(chdir(buf+3) < 0)
     180:	e8 4e 10 00 00       	call   11d3 <chdir>
     185:	83 c4 10             	add    $0x10,%esp
     188:	85 c0                	test   %eax,%eax
     18a:	0f 89 d0 fe ff ff    	jns    60 <main+0x60>
        printf(2, "cannot cd %s\n", buf+3);
     190:	51                   	push   %ecx
     191:	68 03 22 00 00       	push   $0x2203
     196:	68 e3 16 00 00       	push   $0x16e3
     19b:	6a 02                	push   $0x2
     19d:	e8 1e 11 00 00       	call   12c0 <printf>
     1a2:	83 c4 10             	add    $0x10,%esp
     1a5:	e9 b6 fe ff ff       	jmp    60 <main+0x60>
     1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  exit();
     1b0:	e8 ae 0f 00 00       	call   1163 <exit>
     1b5:	8d 76 00             	lea    0x0(%esi),%esi
    if (!(buf[0] == 'h' && buf[1] == 'i' && buf[2] == 's' && buf[3] == 't' && buf[4] == ' ')) {
     1b8:	80 3d 02 22 00 00 73 	cmpb   $0x73,0x2202
     1bf:	0f 85 1b ff ff ff    	jne    e0 <main+0xe0>
     1c5:	80 3d 03 22 00 00 74 	cmpb   $0x74,0x2203
     1cc:	0f 85 0e ff ff ff    	jne    e0 <main+0xe0>
     1d2:	80 3d 04 22 00 00 20 	cmpb   $0x20,0x2204
     1d9:	0f 85 01 ff ff ff    	jne    e0 <main+0xe0>
     1df:	e9 33 ff ff ff       	jmp    117 <main+0x117>
      close(fd);
     1e4:	83 ec 0c             	sub    $0xc,%esp
     1e7:	50                   	push   %eax
     1e8:	e8 9e 0f 00 00       	call   118b <close>
      break;
     1ed:	83 c4 10             	add    $0x10,%esp
     1f0:	e9 6b fe ff ff       	jmp    60 <main+0x60>
    panic("fork");
     1f5:	83 ec 0c             	sub    $0xc,%esp
     1f8:	68 eb 15 00 00       	push   $0x15eb
     1fd:	e8 9e 00 00 00       	call   2a0 <panic>
     202:	66 90                	xchg   %ax,%ax
     204:	66 90                	xchg   %ax,%ax
     206:	66 90                	xchg   %ax,%ax
     208:	66 90                	xchg   %ax,%ax
     20a:	66 90                	xchg   %ax,%ax
     20c:	66 90                	xchg   %ax,%ax
     20e:	66 90                	xchg   %ax,%ax

00000210 <getcmd>:
{
     210:	55                   	push   %ebp
     211:	89 e5                	mov    %esp,%ebp
     213:	56                   	push   %esi
     214:	53                   	push   %ebx
     215:	8b 5d 08             	mov    0x8(%ebp),%ebx
     218:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     21b:	83 ec 08             	sub    $0x8,%esp
     21e:	68 e8 15 00 00       	push   $0x15e8
     223:	6a 02                	push   $0x2
     225:	e8 96 10 00 00       	call   12c0 <printf>
  memset(buf, 0, nbuf);
     22a:	83 c4 0c             	add    $0xc,%esp
     22d:	56                   	push   %esi
     22e:	6a 00                	push   $0x0
     230:	53                   	push   %ebx
     231:	e8 aa 0d 00 00       	call   fe0 <memset>
  gets(buf, nbuf);
     236:	58                   	pop    %eax
     237:	5a                   	pop    %edx
     238:	56                   	push   %esi
     239:	53                   	push   %ebx
     23a:	e8 01 0e 00 00       	call   1040 <gets>
  if(buf[0] == 0) // EOF
     23f:	83 c4 10             	add    $0x10,%esp
     242:	80 3b 01             	cmpb   $0x1,(%ebx)
     245:	19 c0                	sbb    %eax,%eax
}
     247:	8d 65 f8             	lea    -0x8(%ebp),%esp
     24a:	5b                   	pop    %ebx
     24b:	5e                   	pop    %esi
     24c:	5d                   	pop    %ebp
     24d:	c3                   	ret
     24e:	66 90                	xchg   %ax,%ax

00000250 <updateHist>:
void updateHist(char *buf) { // maintain history buffer
     250:	55                   	push   %ebp
     251:	89 e5                	mov    %esp,%ebp
     253:	53                   	push   %ebx
     254:	bb 84 21 00 00       	mov    $0x2184,%ebx
     259:	83 ec 04             	sub    $0x4,%esp
     25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    strcpy(history[i], history[i-1]);
     260:	83 ec 08             	sub    $0x8,%esp
     263:	89 d8                	mov    %ebx,%eax
     265:	83 eb 64             	sub    $0x64,%ebx
     268:	53                   	push   %ebx
     269:	50                   	push   %eax
     26a:	e8 b1 0c 00 00       	call   f20 <strcpy>
  for (int i = 9; i >= 1; i--) {
     26f:	83 c4 10             	add    $0x10,%esp
     272:	81 fb 00 1e 00 00    	cmp    $0x1e00,%ebx
     278:	75 e6                	jne    260 <updateHist+0x10>
  strcpy(history[0], buf);
     27a:	83 ec 08             	sub    $0x8,%esp
     27d:	ff 75 08             	push   0x8(%ebp)
     280:	68 00 1e 00 00       	push   $0x1e00
     285:	e8 96 0c 00 00       	call   f20 <strcpy>
}
     28a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     28d:	83 c4 10             	add    $0x10,%esp
     290:	c9                   	leave
     291:	c3                   	ret
     292:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <panic>:
{
     2a0:	55                   	push   %ebp
     2a1:	89 e5                	mov    %esp,%ebp
     2a3:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     2a6:	ff 75 08             	push   0x8(%ebp)
     2a9:	68 59 16 00 00       	push   $0x1659
     2ae:	6a 02                	push   $0x2
     2b0:	e8 0b 10 00 00       	call   12c0 <printf>
  exit();
     2b5:	e8 a9 0e 00 00       	call   1163 <exit>
     2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002c0 <fork1>:
{
     2c0:	55                   	push   %ebp
     2c1:	89 e5                	mov    %esp,%ebp
     2c3:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     2c6:	e8 90 0e 00 00       	call   115b <fork>
  if(pid == -1)
     2cb:	83 f8 ff             	cmp    $0xffffffff,%eax
     2ce:	74 02                	je     2d2 <fork1+0x12>
  return pid;
}
     2d0:	c9                   	leave
     2d1:	c3                   	ret
    panic("fork");
     2d2:	83 ec 0c             	sub    $0xc,%esp
     2d5:	68 eb 15 00 00       	push   $0x15eb
     2da:	e8 c1 ff ff ff       	call   2a0 <panic>
     2df:	90                   	nop

000002e0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     2e0:	55                   	push   %ebp
     2e1:	89 e5                	mov    %esp,%ebp
     2e3:	53                   	push   %ebx
     2e4:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2e7:	6a 54                	push   $0x54
     2e9:	e8 12 12 00 00       	call   1500 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     2ee:	83 c4 0c             	add    $0xc,%esp
     2f1:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     2f3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     2f5:	6a 00                	push   $0x0
     2f7:	50                   	push   %eax
     2f8:	e8 e3 0c 00 00       	call   fe0 <memset>
  cmd->type = EXEC;
     2fd:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     303:	89 d8                	mov    %ebx,%eax
     305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     308:	c9                   	leave
     309:	c3                   	ret
     30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	53                   	push   %ebx
     314:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     317:	6a 18                	push   $0x18
     319:	e8 e2 11 00 00       	call   1500 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     31e:	83 c4 0c             	add    $0xc,%esp
     321:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     323:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     325:	6a 00                	push   $0x0
     327:	50                   	push   %eax
     328:	e8 b3 0c 00 00       	call   fe0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     32d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     330:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     336:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     339:	8b 45 0c             	mov    0xc(%ebp),%eax
     33c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     33f:	8b 45 10             	mov    0x10(%ebp),%eax
     342:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     345:	8b 45 14             	mov    0x14(%ebp),%eax
     348:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     34b:	8b 45 18             	mov    0x18(%ebp),%eax
     34e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     351:	89 d8                	mov    %ebx,%eax
     353:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     356:	c9                   	leave
     357:	c3                   	ret
     358:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     35f:	90                   	nop

00000360 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	53                   	push   %ebx
     364:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     367:	6a 0c                	push   $0xc
     369:	e8 92 11 00 00       	call   1500 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     36e:	83 c4 0c             	add    $0xc,%esp
     371:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     373:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     375:	6a 00                	push   $0x0
     377:	50                   	push   %eax
     378:	e8 63 0c 00 00       	call   fe0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     37d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     380:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     386:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     389:	8b 45 0c             	mov    0xc(%ebp),%eax
     38c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     38f:	89 d8                	mov    %ebx,%eax
     391:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     394:	c9                   	leave
     395:	c3                   	ret
     396:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     39d:	8d 76 00             	lea    0x0(%esi),%esi

000003a0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	53                   	push   %ebx
     3a4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3a7:	6a 0c                	push   $0xc
     3a9:	e8 52 11 00 00       	call   1500 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ae:	83 c4 0c             	add    $0xc,%esp
     3b1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3b3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3b5:	6a 00                	push   $0x0
     3b7:	50                   	push   %eax
     3b8:	e8 23 0c 00 00       	call   fe0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     3bd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     3c0:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     3c6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3c9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3cc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3cf:	89 d8                	mov    %ebx,%eax
     3d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3d4:	c9                   	leave
     3d5:	c3                   	ret
     3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3dd:	8d 76 00             	lea    0x0(%esi),%esi

000003e0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     3e0:	55                   	push   %ebp
     3e1:	89 e5                	mov    %esp,%ebp
     3e3:	53                   	push   %ebx
     3e4:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e7:	6a 08                	push   $0x8
     3e9:	e8 12 11 00 00       	call   1500 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ee:	83 c4 0c             	add    $0xc,%esp
     3f1:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     3f3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3f5:	6a 00                	push   $0x0
     3f7:	50                   	push   %eax
     3f8:	e8 e3 0b 00 00       	call   fe0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     3fd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     400:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     406:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     409:	89 d8                	mov    %ebx,%eax
     40b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     40e:	c9                   	leave
     40f:	c3                   	ret

00000410 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	57                   	push   %edi
     414:	56                   	push   %esi
     415:	53                   	push   %ebx
     416:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     419:	8b 45 08             	mov    0x8(%ebp),%eax
{
     41c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     41f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     422:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     424:	39 df                	cmp    %ebx,%edi
     426:	72 0f                	jb     437 <gettoken+0x27>
     428:	eb 25                	jmp    44f <gettoken+0x3f>
     42a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     430:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     433:	39 fb                	cmp    %edi,%ebx
     435:	74 18                	je     44f <gettoken+0x3f>
     437:	0f be 07             	movsbl (%edi),%eax
     43a:	83 ec 08             	sub    $0x8,%esp
     43d:	50                   	push   %eax
     43e:	68 e0 1d 00 00       	push   $0x1de0
     443:	e8 b8 0b 00 00       	call   1000 <strchr>
     448:	83 c4 10             	add    $0x10,%esp
     44b:	85 c0                	test   %eax,%eax
     44d:	75 e1                	jne    430 <gettoken+0x20>
  if(q)
     44f:	85 f6                	test   %esi,%esi
     451:	74 02                	je     455 <gettoken+0x45>
    *q = s;
     453:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     455:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     458:	3c 3c                	cmp    $0x3c,%al
     45a:	0f 8f d0 00 00 00    	jg     530 <gettoken+0x120>
     460:	3c 3a                	cmp    $0x3a,%al
     462:	0f 8f bc 00 00 00    	jg     524 <gettoken+0x114>
     468:	84 c0                	test   %al,%al
     46a:	75 44                	jne    4b0 <gettoken+0xa0>
     46c:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     46e:	8b 4d 14             	mov    0x14(%ebp),%ecx
     471:	85 c9                	test   %ecx,%ecx
     473:	74 05                	je     47a <gettoken+0x6a>
    *eq = s;
     475:	8b 45 14             	mov    0x14(%ebp),%eax
     478:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     47a:	39 df                	cmp    %ebx,%edi
     47c:	72 09                	jb     487 <gettoken+0x77>
     47e:	eb 1f                	jmp    49f <gettoken+0x8f>
    s++;
     480:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     483:	39 fb                	cmp    %edi,%ebx
     485:	74 18                	je     49f <gettoken+0x8f>
     487:	0f be 07             	movsbl (%edi),%eax
     48a:	83 ec 08             	sub    $0x8,%esp
     48d:	50                   	push   %eax
     48e:	68 e0 1d 00 00       	push   $0x1de0
     493:	e8 68 0b 00 00       	call   1000 <strchr>
     498:	83 c4 10             	add    $0x10,%esp
     49b:	85 c0                	test   %eax,%eax
     49d:	75 e1                	jne    480 <gettoken+0x70>
  *ps = s;
     49f:	8b 45 08             	mov    0x8(%ebp),%eax
     4a2:	89 38                	mov    %edi,(%eax)
  return ret;
}
     4a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4a7:	89 f0                	mov    %esi,%eax
     4a9:	5b                   	pop    %ebx
     4aa:	5e                   	pop    %esi
     4ab:	5f                   	pop    %edi
     4ac:	5d                   	pop    %ebp
     4ad:	c3                   	ret
     4ae:	66 90                	xchg   %ax,%ax
  switch(*s){
     4b0:	79 66                	jns    518 <gettoken+0x108>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4b2:	39 df                	cmp    %ebx,%edi
     4b4:	72 39                	jb     4ef <gettoken+0xdf>
  if(eq)
     4b6:	8b 55 14             	mov    0x14(%ebp),%edx
     4b9:	85 d2                	test   %edx,%edx
     4bb:	0f 84 b3 00 00 00    	je     574 <gettoken+0x164>
    *eq = s;
     4c1:	8b 45 14             	mov    0x14(%ebp),%eax
     4c4:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     4c6:	e9 a9 00 00 00       	jmp    574 <gettoken+0x164>
     4cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     4cf:	90                   	nop
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4d0:	0f be 07             	movsbl (%edi),%eax
     4d3:	83 ec 08             	sub    $0x8,%esp
     4d6:	50                   	push   %eax
     4d7:	68 d8 1d 00 00       	push   $0x1dd8
     4dc:	e8 1f 0b 00 00       	call   1000 <strchr>
     4e1:	83 c4 10             	add    $0x10,%esp
     4e4:	85 c0                	test   %eax,%eax
     4e6:	75 1f                	jne    507 <gettoken+0xf7>
      s++;
     4e8:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4eb:	39 fb                	cmp    %edi,%ebx
     4ed:	74 77                	je     566 <gettoken+0x156>
     4ef:	0f be 07             	movsbl (%edi),%eax
     4f2:	83 ec 08             	sub    $0x8,%esp
     4f5:	50                   	push   %eax
     4f6:	68 e0 1d 00 00       	push   $0x1de0
     4fb:	e8 00 0b 00 00       	call   1000 <strchr>
     500:	83 c4 10             	add    $0x10,%esp
     503:	85 c0                	test   %eax,%eax
     505:	74 c9                	je     4d0 <gettoken+0xc0>
    ret = 'a';
     507:	be 61 00 00 00       	mov    $0x61,%esi
     50c:	e9 5d ff ff ff       	jmp    46e <gettoken+0x5e>
     511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     518:	3c 26                	cmp    $0x26,%al
     51a:	74 08                	je     524 <gettoken+0x114>
     51c:	8d 48 d8             	lea    -0x28(%eax),%ecx
     51f:	80 f9 01             	cmp    $0x1,%cl
     522:	77 8e                	ja     4b2 <gettoken+0xa2>
  ret = *s;
     524:	0f be f0             	movsbl %al,%esi
    s++;
     527:	83 c7 01             	add    $0x1,%edi
    break;
     52a:	e9 3f ff ff ff       	jmp    46e <gettoken+0x5e>
     52f:	90                   	nop
  switch(*s){
     530:	3c 3e                	cmp    $0x3e,%al
     532:	75 1c                	jne    550 <gettoken+0x140>
    if(*s == '>'){
     534:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     538:	74 1f                	je     559 <gettoken+0x149>
    s++;
     53a:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     53d:	be 3e 00 00 00       	mov    $0x3e,%esi
     542:	e9 27 ff ff ff       	jmp    46e <gettoken+0x5e>
     547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     54e:	66 90                	xchg   %ax,%ax
  switch(*s){
     550:	3c 7c                	cmp    $0x7c,%al
     552:	74 d0                	je     524 <gettoken+0x114>
     554:	e9 59 ff ff ff       	jmp    4b2 <gettoken+0xa2>
      s++;
     559:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     55c:	be 2b 00 00 00       	mov    $0x2b,%esi
     561:	e9 08 ff ff ff       	jmp    46e <gettoken+0x5e>
  if(eq)
     566:	8b 45 14             	mov    0x14(%ebp),%eax
     569:	85 c0                	test   %eax,%eax
     56b:	74 05                	je     572 <gettoken+0x162>
    *eq = s;
     56d:	8b 45 14             	mov    0x14(%ebp),%eax
     570:	89 18                	mov    %ebx,(%eax)
      s++;
     572:	89 df                	mov    %ebx,%edi
    ret = 'a';
     574:	be 61 00 00 00       	mov    $0x61,%esi
     579:	e9 21 ff ff ff       	jmp    49f <gettoken+0x8f>
     57e:	66 90                	xchg   %ax,%ax

00000580 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     580:	55                   	push   %ebp
     581:	89 e5                	mov    %esp,%ebp
     583:	57                   	push   %edi
     584:	56                   	push   %esi
     585:	53                   	push   %ebx
     586:	83 ec 0c             	sub    $0xc,%esp
     589:	8b 7d 08             	mov    0x8(%ebp),%edi
     58c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     58f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     591:	39 f3                	cmp    %esi,%ebx
     593:	72 12                	jb     5a7 <peek+0x27>
     595:	eb 28                	jmp    5bf <peek+0x3f>
     597:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     59e:	66 90                	xchg   %ax,%ax
    s++;
     5a0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     5a3:	39 de                	cmp    %ebx,%esi
     5a5:	74 18                	je     5bf <peek+0x3f>
     5a7:	0f be 03             	movsbl (%ebx),%eax
     5aa:	83 ec 08             	sub    $0x8,%esp
     5ad:	50                   	push   %eax
     5ae:	68 e0 1d 00 00       	push   $0x1de0
     5b3:	e8 48 0a 00 00       	call   1000 <strchr>
     5b8:	83 c4 10             	add    $0x10,%esp
     5bb:	85 c0                	test   %eax,%eax
     5bd:	75 e1                	jne    5a0 <peek+0x20>
  *ps = s;
     5bf:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     5c1:	0f be 03             	movsbl (%ebx),%eax
     5c4:	31 d2                	xor    %edx,%edx
     5c6:	84 c0                	test   %al,%al
     5c8:	75 0e                	jne    5d8 <peek+0x58>
}
     5ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5cd:	89 d0                	mov    %edx,%eax
     5cf:	5b                   	pop    %ebx
     5d0:	5e                   	pop    %esi
     5d1:	5f                   	pop    %edi
     5d2:	5d                   	pop    %ebp
     5d3:	c3                   	ret
     5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     5d8:	83 ec 08             	sub    $0x8,%esp
     5db:	50                   	push   %eax
     5dc:	ff 75 10             	push   0x10(%ebp)
     5df:	e8 1c 0a 00 00       	call   1000 <strchr>
     5e4:	83 c4 10             	add    $0x10,%esp
     5e7:	31 d2                	xor    %edx,%edx
     5e9:	85 c0                	test   %eax,%eax
     5eb:	0f 95 c2             	setne  %dl
}
     5ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5f1:	5b                   	pop    %ebx
     5f2:	89 d0                	mov    %edx,%eax
     5f4:	5e                   	pop    %esi
     5f5:	5f                   	pop    %edi
     5f6:	5d                   	pop    %ebp
     5f7:	c3                   	ret
     5f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5ff:	90                   	nop

00000600 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     600:	55                   	push   %ebp
     601:	89 e5                	mov    %esp,%ebp
     603:	57                   	push   %edi
     604:	56                   	push   %esi
     605:	53                   	push   %ebx
     606:	83 ec 2c             	sub    $0x2c,%esp
     609:	8b 75 0c             	mov    0xc(%ebp),%esi
     60c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     60f:	90                   	nop
     610:	83 ec 04             	sub    $0x4,%esp
     613:	68 0d 16 00 00       	push   $0x160d
     618:	53                   	push   %ebx
     619:	56                   	push   %esi
     61a:	e8 61 ff ff ff       	call   580 <peek>
     61f:	83 c4 10             	add    $0x10,%esp
     622:	85 c0                	test   %eax,%eax
     624:	0f 84 f6 00 00 00    	je     720 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     62a:	6a 00                	push   $0x0
     62c:	6a 00                	push   $0x0
     62e:	53                   	push   %ebx
     62f:	56                   	push   %esi
     630:	e8 db fd ff ff       	call   410 <gettoken>
     635:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     637:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     63a:	50                   	push   %eax
     63b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     63e:	50                   	push   %eax
     63f:	53                   	push   %ebx
     640:	56                   	push   %esi
     641:	e8 ca fd ff ff       	call   410 <gettoken>
     646:	83 c4 20             	add    $0x20,%esp
     649:	83 f8 61             	cmp    $0x61,%eax
     64c:	0f 85 d9 00 00 00    	jne    72b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     652:	83 ff 3c             	cmp    $0x3c,%edi
     655:	74 69                	je     6c0 <parseredirs+0xc0>
     657:	83 ff 3e             	cmp    $0x3e,%edi
     65a:	74 05                	je     661 <parseredirs+0x61>
     65c:	83 ff 2b             	cmp    $0x2b,%edi
     65f:	75 af                	jne    610 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     661:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     664:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     667:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     66a:	89 55 d0             	mov    %edx,-0x30(%ebp)
     66d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     670:	6a 18                	push   $0x18
     672:	e8 89 0e 00 00       	call   1500 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     677:	83 c4 0c             	add    $0xc,%esp
     67a:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     67c:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     67e:	6a 00                	push   $0x0
     680:	50                   	push   %eax
     681:	e8 5a 09 00 00       	call   fe0 <memset>
  cmd->type = REDIR;
     686:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     68c:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     68f:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     692:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     695:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     698:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     69b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     69e:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     6a5:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     6a8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     6af:	89 7d 08             	mov    %edi,0x8(%ebp)
     6b2:	e9 59 ff ff ff       	jmp    610 <parseredirs+0x10>
     6b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6be:	66 90                	xchg   %ax,%ax
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6c0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6c3:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6c6:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6c9:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6cc:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6cf:	6a 18                	push   $0x18
     6d1:	e8 2a 0e 00 00       	call   1500 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6d6:	83 c4 0c             	add    $0xc,%esp
     6d9:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6db:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6dd:	6a 00                	push   $0x0
     6df:	50                   	push   %eax
     6e0:	e8 fb 08 00 00       	call   fe0 <memset>
  cmd->cmd = subcmd;
     6e5:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     6e8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     6eb:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     6ee:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     6f1:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     6f7:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6fa:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6fd:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     700:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     703:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     70a:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     711:	e9 fa fe ff ff       	jmp    610 <parseredirs+0x10>
     716:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     71d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     720:	8b 45 08             	mov    0x8(%ebp),%eax
     723:	8d 65 f4             	lea    -0xc(%ebp),%esp
     726:	5b                   	pop    %ebx
     727:	5e                   	pop    %esi
     728:	5f                   	pop    %edi
     729:	5d                   	pop    %ebp
     72a:	c3                   	ret
      panic("missing file for redirection");
     72b:	83 ec 0c             	sub    $0xc,%esp
     72e:	68 f0 15 00 00       	push   $0x15f0
     733:	e8 68 fb ff ff       	call   2a0 <panic>
     738:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     73f:	90                   	nop

00000740 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     740:	55                   	push   %ebp
     741:	89 e5                	mov    %esp,%ebp
     743:	57                   	push   %edi
     744:	56                   	push   %esi
     745:	53                   	push   %ebx
     746:	83 ec 30             	sub    $0x30,%esp
     749:	8b 5d 08             	mov    0x8(%ebp),%ebx
     74c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     74f:	68 10 16 00 00       	push   $0x1610
     754:	56                   	push   %esi
     755:	53                   	push   %ebx
     756:	e8 25 fe ff ff       	call   580 <peek>
     75b:	83 c4 10             	add    $0x10,%esp
     75e:	85 c0                	test   %eax,%eax
     760:	0f 85 aa 00 00 00    	jne    810 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     766:	83 ec 0c             	sub    $0xc,%esp
     769:	89 c7                	mov    %eax,%edi
     76b:	6a 54                	push   $0x54
     76d:	e8 8e 0d 00 00       	call   1500 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     772:	83 c4 0c             	add    $0xc,%esp
     775:	6a 54                	push   $0x54
     777:	6a 00                	push   $0x0
     779:	89 45 d0             	mov    %eax,-0x30(%ebp)
     77c:	50                   	push   %eax
     77d:	e8 5e 08 00 00       	call   fe0 <memset>
  cmd->type = EXEC;
     782:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     785:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     788:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     78e:	56                   	push   %esi
     78f:	53                   	push   %ebx
     790:	50                   	push   %eax
     791:	e8 6a fe ff ff       	call   600 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     796:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     799:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     79c:	eb 15                	jmp    7b3 <parseexec+0x73>
     79e:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7a0:	83 ec 04             	sub    $0x4,%esp
     7a3:	56                   	push   %esi
     7a4:	53                   	push   %ebx
     7a5:	ff 75 d4             	push   -0x2c(%ebp)
     7a8:	e8 53 fe ff ff       	call   600 <parseredirs>
     7ad:	83 c4 10             	add    $0x10,%esp
     7b0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7b3:	83 ec 04             	sub    $0x4,%esp
     7b6:	68 27 16 00 00       	push   $0x1627
     7bb:	56                   	push   %esi
     7bc:	53                   	push   %ebx
     7bd:	e8 be fd ff ff       	call   580 <peek>
     7c2:	83 c4 10             	add    $0x10,%esp
     7c5:	85 c0                	test   %eax,%eax
     7c7:	75 5f                	jne    828 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     7c9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7cc:	50                   	push   %eax
     7cd:	8d 45 e0             	lea    -0x20(%ebp),%eax
     7d0:	50                   	push   %eax
     7d1:	56                   	push   %esi
     7d2:	53                   	push   %ebx
     7d3:	e8 38 fc ff ff       	call   410 <gettoken>
     7d8:	83 c4 10             	add    $0x10,%esp
     7db:	85 c0                	test   %eax,%eax
     7dd:	74 49                	je     828 <parseexec+0xe8>
    if(tok != 'a')
     7df:	83 f8 61             	cmp    $0x61,%eax
     7e2:	75 62                	jne    846 <parseexec+0x106>
    cmd->argv[argc] = q;
     7e4:	8b 45 e0             	mov    -0x20(%ebp),%eax
     7e7:	8b 55 d0             	mov    -0x30(%ebp),%edx
     7ea:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     7ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7f1:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     7f5:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     7f8:	83 ff 0a             	cmp    $0xa,%edi
     7fb:	75 a3                	jne    7a0 <parseexec+0x60>
      panic("too many args");
     7fd:	83 ec 0c             	sub    $0xc,%esp
     800:	68 19 16 00 00       	push   $0x1619
     805:	e8 96 fa ff ff       	call   2a0 <panic>
     80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     810:	89 75 0c             	mov    %esi,0xc(%ebp)
     813:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     816:	8d 65 f4             	lea    -0xc(%ebp),%esp
     819:	5b                   	pop    %ebx
     81a:	5e                   	pop    %esi
     81b:	5f                   	pop    %edi
     81c:	5d                   	pop    %ebp
    return parseblock(ps, es);
     81d:	e9 ae 01 00 00       	jmp    9d0 <parseblock>
     822:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     828:	8b 45 d0             	mov    -0x30(%ebp),%eax
     82b:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     832:	00 
  cmd->eargv[argc] = 0;
     833:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     83a:	00 
}
     83b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     83e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     841:	5b                   	pop    %ebx
     842:	5e                   	pop    %esi
     843:	5f                   	pop    %edi
     844:	5d                   	pop    %ebp
     845:	c3                   	ret
      panic("syntax");
     846:	83 ec 0c             	sub    $0xc,%esp
     849:	68 12 16 00 00       	push   $0x1612
     84e:	e8 4d fa ff ff       	call   2a0 <panic>
     853:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000860 <parsepipe>:
{
     860:	55                   	push   %ebp
     861:	89 e5                	mov    %esp,%ebp
     863:	57                   	push   %edi
     864:	56                   	push   %esi
     865:	53                   	push   %ebx
     866:	83 ec 14             	sub    $0x14,%esp
     869:	8b 75 08             	mov    0x8(%ebp),%esi
     86c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     86f:	57                   	push   %edi
     870:	56                   	push   %esi
     871:	e8 ca fe ff ff       	call   740 <parseexec>
  if(peek(ps, es, "|")){
     876:	83 c4 0c             	add    $0xc,%esp
     879:	68 2c 16 00 00       	push   $0x162c
  cmd = parseexec(ps, es);
     87e:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     880:	57                   	push   %edi
     881:	56                   	push   %esi
     882:	e8 f9 fc ff ff       	call   580 <peek>
     887:	83 c4 10             	add    $0x10,%esp
     88a:	85 c0                	test   %eax,%eax
     88c:	75 12                	jne    8a0 <parsepipe+0x40>
}
     88e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     891:	89 d8                	mov    %ebx,%eax
     893:	5b                   	pop    %ebx
     894:	5e                   	pop    %esi
     895:	5f                   	pop    %edi
     896:	5d                   	pop    %ebp
     897:	c3                   	ret
     898:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     89f:	90                   	nop
    gettoken(ps, es, 0, 0);
     8a0:	6a 00                	push   $0x0
     8a2:	6a 00                	push   $0x0
     8a4:	57                   	push   %edi
     8a5:	56                   	push   %esi
     8a6:	e8 65 fb ff ff       	call   410 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8ab:	58                   	pop    %eax
     8ac:	5a                   	pop    %edx
     8ad:	57                   	push   %edi
     8ae:	56                   	push   %esi
     8af:	e8 ac ff ff ff       	call   860 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     8b4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8bb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     8bd:	e8 3e 0c 00 00       	call   1500 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     8c2:	83 c4 0c             	add    $0xc,%esp
     8c5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     8c7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     8c9:	6a 00                	push   $0x0
     8cb:	50                   	push   %eax
     8cc:	e8 0f 07 00 00       	call   fe0 <memset>
  cmd->left = left;
     8d1:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     8d4:	83 c4 10             	add    $0x10,%esp
     8d7:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     8d9:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     8df:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     8e1:	89 7e 08             	mov    %edi,0x8(%esi)
}
     8e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8e7:	5b                   	pop    %ebx
     8e8:	5e                   	pop    %esi
     8e9:	5f                   	pop    %edi
     8ea:	5d                   	pop    %ebp
     8eb:	c3                   	ret
     8ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008f0 <parseline>:
{
     8f0:	55                   	push   %ebp
     8f1:	89 e5                	mov    %esp,%ebp
     8f3:	57                   	push   %edi
     8f4:	56                   	push   %esi
     8f5:	53                   	push   %ebx
     8f6:	83 ec 24             	sub    $0x24,%esp
     8f9:	8b 75 08             	mov    0x8(%ebp),%esi
     8fc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     8ff:	57                   	push   %edi
     900:	56                   	push   %esi
     901:	e8 5a ff ff ff       	call   860 <parsepipe>
  while(peek(ps, es, "&")){
     906:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     909:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     90b:	eb 3b                	jmp    948 <parseline+0x58>
     90d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     910:	6a 00                	push   $0x0
     912:	6a 00                	push   $0x0
     914:	57                   	push   %edi
     915:	56                   	push   %esi
     916:	e8 f5 fa ff ff       	call   410 <gettoken>
  cmd = malloc(sizeof(*cmd));
     91b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     922:	e8 d9 0b 00 00       	call   1500 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     927:	83 c4 0c             	add    $0xc,%esp
     92a:	6a 08                	push   $0x8
     92c:	6a 00                	push   $0x0
     92e:	50                   	push   %eax
     92f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     932:	e8 a9 06 00 00       	call   fe0 <memset>
  cmd->type = BACK;
     937:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     93a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     93d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     943:	89 5a 04             	mov    %ebx,0x4(%edx)
     946:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     948:	83 ec 04             	sub    $0x4,%esp
     94b:	68 2e 16 00 00       	push   $0x162e
     950:	57                   	push   %edi
     951:	56                   	push   %esi
     952:	e8 29 fc ff ff       	call   580 <peek>
     957:	83 c4 10             	add    $0x10,%esp
     95a:	85 c0                	test   %eax,%eax
     95c:	75 b2                	jne    910 <parseline+0x20>
  if(peek(ps, es, ";")){
     95e:	83 ec 04             	sub    $0x4,%esp
     961:	68 2a 16 00 00       	push   $0x162a
     966:	57                   	push   %edi
     967:	56                   	push   %esi
     968:	e8 13 fc ff ff       	call   580 <peek>
     96d:	83 c4 10             	add    $0x10,%esp
     970:	85 c0                	test   %eax,%eax
     972:	75 0c                	jne    980 <parseline+0x90>
}
     974:	8d 65 f4             	lea    -0xc(%ebp),%esp
     977:	89 d8                	mov    %ebx,%eax
     979:	5b                   	pop    %ebx
     97a:	5e                   	pop    %esi
     97b:	5f                   	pop    %edi
     97c:	5d                   	pop    %ebp
     97d:	c3                   	ret
     97e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     980:	6a 00                	push   $0x0
     982:	6a 00                	push   $0x0
     984:	57                   	push   %edi
     985:	56                   	push   %esi
     986:	e8 85 fa ff ff       	call   410 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     98b:	58                   	pop    %eax
     98c:	5a                   	pop    %edx
     98d:	57                   	push   %edi
     98e:	56                   	push   %esi
     98f:	e8 5c ff ff ff       	call   8f0 <parseline>
  cmd = malloc(sizeof(*cmd));
     994:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     99b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     99d:	e8 5e 0b 00 00       	call   1500 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     9a2:	83 c4 0c             	add    $0xc,%esp
     9a5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     9a7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     9a9:	6a 00                	push   $0x0
     9ab:	50                   	push   %eax
     9ac:	e8 2f 06 00 00       	call   fe0 <memset>
  cmd->left = left;
     9b1:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     9b4:	83 c4 10             	add    $0x10,%esp
     9b7:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     9b9:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     9bf:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     9c1:	89 7e 08             	mov    %edi,0x8(%esi)
}
     9c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c7:	5b                   	pop    %ebx
     9c8:	5e                   	pop    %esi
     9c9:	5f                   	pop    %edi
     9ca:	5d                   	pop    %ebp
     9cb:	c3                   	ret
     9cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009d0 <parseblock>:
{
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	57                   	push   %edi
     9d4:	56                   	push   %esi
     9d5:	53                   	push   %ebx
     9d6:	83 ec 10             	sub    $0x10,%esp
     9d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     9dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     9df:	68 10 16 00 00       	push   $0x1610
     9e4:	56                   	push   %esi
     9e5:	53                   	push   %ebx
     9e6:	e8 95 fb ff ff       	call   580 <peek>
     9eb:	83 c4 10             	add    $0x10,%esp
     9ee:	85 c0                	test   %eax,%eax
     9f0:	74 4a                	je     a3c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     9f2:	6a 00                	push   $0x0
     9f4:	6a 00                	push   $0x0
     9f6:	56                   	push   %esi
     9f7:	53                   	push   %ebx
     9f8:	e8 13 fa ff ff       	call   410 <gettoken>
  cmd = parseline(ps, es);
     9fd:	58                   	pop    %eax
     9fe:	5a                   	pop    %edx
     9ff:	56                   	push   %esi
     a00:	53                   	push   %ebx
     a01:	e8 ea fe ff ff       	call   8f0 <parseline>
  if(!peek(ps, es, ")"))
     a06:	83 c4 0c             	add    $0xc,%esp
     a09:	68 4c 16 00 00       	push   $0x164c
  cmd = parseline(ps, es);
     a0e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a10:	56                   	push   %esi
     a11:	53                   	push   %ebx
     a12:	e8 69 fb ff ff       	call   580 <peek>
     a17:	83 c4 10             	add    $0x10,%esp
     a1a:	85 c0                	test   %eax,%eax
     a1c:	74 2b                	je     a49 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     a1e:	6a 00                	push   $0x0
     a20:	6a 00                	push   $0x0
     a22:	56                   	push   %esi
     a23:	53                   	push   %ebx
     a24:	e8 e7 f9 ff ff       	call   410 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a29:	83 c4 0c             	add    $0xc,%esp
     a2c:	56                   	push   %esi
     a2d:	53                   	push   %ebx
     a2e:	57                   	push   %edi
     a2f:	e8 cc fb ff ff       	call   600 <parseredirs>
}
     a34:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a37:	5b                   	pop    %ebx
     a38:	5e                   	pop    %esi
     a39:	5f                   	pop    %edi
     a3a:	5d                   	pop    %ebp
     a3b:	c3                   	ret
    panic("parseblock");
     a3c:	83 ec 0c             	sub    $0xc,%esp
     a3f:	68 30 16 00 00       	push   $0x1630
     a44:	e8 57 f8 ff ff       	call   2a0 <panic>
    panic("syntax - missing )");
     a49:	83 ec 0c             	sub    $0xc,%esp
     a4c:	68 3b 16 00 00       	push   $0x163b
     a51:	e8 4a f8 ff ff       	call   2a0 <panic>
     a56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a5d:	8d 76 00             	lea    0x0(%esi),%esi

00000a60 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a60:	55                   	push   %ebp
     a61:	89 e5                	mov    %esp,%ebp
     a63:	53                   	push   %ebx
     a64:	83 ec 04             	sub    $0x4,%esp
     a67:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a6a:	85 db                	test   %ebx,%ebx
     a6c:	0f 84 7e 00 00 00    	je     af0 <nulterminate+0x90>
    return 0;

  switch(cmd->type){
     a72:	83 3b 05             	cmpl   $0x5,(%ebx)
     a75:	77 20                	ja     a97 <nulterminate+0x37>
     a77:	8b 03                	mov    (%ebx),%eax
     a79:	ff 24 85 f4 16 00 00 	jmp    *0x16f4(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     a80:	83 ec 0c             	sub    $0xc,%esp
     a83:	ff 73 04             	push   0x4(%ebx)
     a86:	e8 d5 ff ff ff       	call   a60 <nulterminate>
    nulterminate(lcmd->right);
     a8b:	58                   	pop    %eax
     a8c:	ff 73 08             	push   0x8(%ebx)
     a8f:	e8 cc ff ff ff       	call   a60 <nulterminate>
    break;
     a94:	83 c4 10             	add    $0x10,%esp
    return 0;
     a97:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a99:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a9c:	c9                   	leave
     a9d:	c3                   	ret
     a9e:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     aa0:	83 ec 0c             	sub    $0xc,%esp
     aa3:	ff 73 04             	push   0x4(%ebx)
     aa6:	e8 b5 ff ff ff       	call   a60 <nulterminate>
    break;
     aab:	83 c4 10             	add    $0x10,%esp
     aae:	eb e7                	jmp    a97 <nulterminate+0x37>
    for(i=0; ecmd->argv[i]; i++)
     ab0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     ab3:	8d 43 08             	lea    0x8(%ebx),%eax
     ab6:	85 c9                	test   %ecx,%ecx
     ab8:	74 dd                	je     a97 <nulterminate+0x37>
     aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     ac0:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     ac3:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     ac6:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     ac9:	8b 50 fc             	mov    -0x4(%eax),%edx
     acc:	85 d2                	test   %edx,%edx
     ace:	75 f0                	jne    ac0 <nulterminate+0x60>
     ad0:	eb c5                	jmp    a97 <nulterminate+0x37>
     ad2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    nulterminate(rcmd->cmd);
     ad8:	83 ec 0c             	sub    $0xc,%esp
     adb:	ff 73 04             	push   0x4(%ebx)
     ade:	e8 7d ff ff ff       	call   a60 <nulterminate>
    *rcmd->efile = 0;
     ae3:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     ae6:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     ae9:	c6 00 00             	movb   $0x0,(%eax)
    break;
     aec:	eb a9                	jmp    a97 <nulterminate+0x37>
     aee:	66 90                	xchg   %ax,%ax
    return 0;
     af0:	31 c0                	xor    %eax,%eax
     af2:	eb a5                	jmp    a99 <nulterminate+0x39>
     af4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     afb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     aff:	90                   	nop

00000b00 <parsecmd>:
{
     b00:	55                   	push   %ebp
     b01:	89 e5                	mov    %esp,%ebp
     b03:	57                   	push   %edi
     b04:	56                   	push   %esi
  cmd = parseline(&s, es);
     b05:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     b08:	53                   	push   %ebx
     b09:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     b0c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b0f:	53                   	push   %ebx
     b10:	e8 9b 04 00 00       	call   fb0 <strlen>
  cmd = parseline(&s, es);
     b15:	59                   	pop    %ecx
     b16:	5e                   	pop    %esi
  es = s + strlen(s);
     b17:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b19:	53                   	push   %ebx
     b1a:	57                   	push   %edi
     b1b:	e8 d0 fd ff ff       	call   8f0 <parseline>
  peek(&s, es, "");
     b20:	83 c4 0c             	add    $0xc,%esp
     b23:	68 da 16 00 00       	push   $0x16da
  cmd = parseline(&s, es);
     b28:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b2a:	53                   	push   %ebx
     b2b:	57                   	push   %edi
     b2c:	e8 4f fa ff ff       	call   580 <peek>
  if(s != es){
     b31:	8b 45 08             	mov    0x8(%ebp),%eax
     b34:	83 c4 10             	add    $0x10,%esp
     b37:	39 d8                	cmp    %ebx,%eax
     b39:	75 13                	jne    b4e <parsecmd+0x4e>
  nulterminate(cmd);
     b3b:	83 ec 0c             	sub    $0xc,%esp
     b3e:	56                   	push   %esi
     b3f:	e8 1c ff ff ff       	call   a60 <nulterminate>
}
     b44:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b47:	89 f0                	mov    %esi,%eax
     b49:	5b                   	pop    %ebx
     b4a:	5e                   	pop    %esi
     b4b:	5f                   	pop    %edi
     b4c:	5d                   	pop    %ebp
     b4d:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     b4e:	52                   	push   %edx
     b4f:	50                   	push   %eax
     b50:	68 4e 16 00 00       	push   $0x164e
     b55:	6a 02                	push   $0x2
     b57:	e8 64 07 00 00       	call   12c0 <printf>
    panic("syntax");
     b5c:	c7 04 24 12 16 00 00 	movl   $0x1612,(%esp)
     b63:	e8 38 f7 ff ff       	call   2a0 <panic>
     b68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b6f:	90                   	nop

00000b70 <runcmd>:
{
     b70:	55                   	push   %ebp
     b71:	89 e5                	mov    %esp,%ebp
     b73:	57                   	push   %edi
     b74:	56                   	push   %esi
     b75:	53                   	push   %ebx
     b76:	83 ec 1c             	sub    $0x1c,%esp
     b79:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     b7c:	85 db                	test   %ebx,%ebx
     b7e:	74 5a                	je     bda <runcmd+0x6a>
  switch(cmd->type){
     b80:	83 3b 05             	cmpl   $0x5,(%ebx)
     b83:	0f 87 54 03 00 00    	ja     edd <runcmd+0x36d>
     b89:	8b 03                	mov    (%ebx),%eax
     b8b:	ff 24 85 0c 17 00 00 	jmp    *0x170c(,%eax,4)
     b92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ecmd = (struct execcmd*)bcmd->cmd;
     b98:	8b 5b 04             	mov    0x4(%ebx),%ebx
  pid = fork();
     b9b:	e8 bb 05 00 00       	call   115b <fork>
  if(pid == -1)
     ba0:	83 f8 ff             	cmp    $0xffffffff,%eax
     ba3:	0f 84 67 03 00 00    	je     f10 <runcmd+0x3a0>
      if(pid==0){
     ba9:	85 c0                	test   %eax,%eax
     bab:	0f 84 8f 01 00 00    	je     d40 <runcmd+0x1d0>
}
     bb1:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bb4:	5b                   	pop    %ebx
     bb5:	5e                   	pop    %esi
     bb6:	5f                   	pop    %edi
     bb7:	5d                   	pop    %ebp
     bb8:	c3                   	ret
     bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    int child_pid = fork();
     bc0:	e8 96 05 00 00       	call   115b <fork>
    if (child_pid < 0) {
     bc5:	85 c0                	test   %eax,%eax
     bc7:	0f 88 33 01 00 00    	js     d00 <runcmd+0x190>
    } else if (child_pid == 0) {
     bcd:	0f 85 3d 02 00 00    	jne    e10 <runcmd+0x2a0>
      runcmd(lcmd->left);
     bd3:	8b 5b 04             	mov    0x4(%ebx),%ebx
  if(cmd == 0)
     bd6:	85 db                	test   %ebx,%ebx
     bd8:	75 a6                	jne    b80 <runcmd+0x10>
    exit();
     bda:	e8 84 05 00 00       	call   1163 <exit>
     bdf:	90                   	nop
    if (pipe(p) == -1) {
     be0:	83 ec 0c             	sub    $0xc,%esp
     be3:	8d 45 e0             	lea    -0x20(%ebp),%eax
     be6:	50                   	push   %eax
     be7:	e8 87 05 00 00       	call   1173 <pipe>
     bec:	83 c4 10             	add    $0x10,%esp
     bef:	83 f8 ff             	cmp    $0xffffffff,%eax
     bf2:	0f 84 28 01 00 00    	je     d20 <runcmd+0x1b0>
    int child_pid1 = fork();
     bf8:	e8 5e 05 00 00       	call   115b <fork>
    if (child_pid1 < 0) {
     bfd:	85 c0                	test   %eax,%eax
     bff:	0f 88 fb 00 00 00    	js     d00 <runcmd+0x190>
    } else if (child_pid1 == 0) {
     c05:	0f 84 35 02 00 00    	je     e40 <runcmd+0x2d0>
    int child_pid2 = fork();
     c0b:	e8 4b 05 00 00       	call   115b <fork>
    if (child_pid2 < 0) {
     c10:	85 c0                	test   %eax,%eax
     c12:	0f 88 e8 00 00 00    	js     d00 <runcmd+0x190>
    } else if (child_pid2 == 0) {
     c18:	0f 84 92 02 00 00    	je     eb0 <runcmd+0x340>
    close(p[0]);
     c1e:	83 ec 0c             	sub    $0xc,%esp
     c21:	ff 75 e0             	push   -0x20(%ebp)
     c24:	e8 62 05 00 00       	call   118b <close>
    close(p[1]);
     c29:	58                   	pop    %eax
     c2a:	ff 75 e4             	push   -0x1c(%ebp)
     c2d:	e8 59 05 00 00       	call   118b <close>
    wait();
     c32:	e8 34 05 00 00       	call   116b <wait>
    wait();
     c37:	e8 2f 05 00 00       	call   116b <wait>
    break;
     c3c:	83 c4 10             	add    $0x10,%esp
}
     c3f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c42:	5b                   	pop    %ebx
     c43:	5e                   	pop    %esi
     c44:	5f                   	pop    %edi
     c45:	5d                   	pop    %ebp
     c46:	c3                   	ret
     c47:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c4e:	66 90                	xchg   %ax,%ax
    int fd, mode = rcmd->mode;
     c50:	8b 73 10             	mov    0x10(%ebx),%esi
    char *file = rcmd->file;
     c53:	8b 7b 08             	mov    0x8(%ebx),%edi
    if (mode == O_WRONLY || mode == (O_WRONLY|O_CREATE)) {
     c56:	89 f0                	mov    %esi,%eax
     c58:	80 e4 fd             	and    $0xfd,%ah
     c5b:	83 f8 01             	cmp    $0x1,%eax
     c5e:	0f 84 64 01 00 00    	je     dc8 <runcmd+0x258>
    } else if (mode == O_RDONLY) {
     c64:	85 f6                	test   %esi,%esi
     c66:	0f 85 91 02 00 00    	jne    efd <runcmd+0x38d>
        fd = open(file, mode);
     c6c:	83 ec 08             	sub    $0x8,%esp
     c6f:	6a 00                	push   $0x0
     c71:	57                   	push   %edi
     c72:	e8 2c 05 00 00       	call   11a3 <open>
    if (fd < 0) {
     c77:	83 c4 10             	add    $0x10,%esp
        fd = open(file, mode);
     c7a:	89 c6                	mov    %eax,%esi
    if (fd < 0) {
     c7c:	85 c0                	test   %eax,%eax
     c7e:	0f 88 66 02 00 00    	js     eea <runcmd+0x37a>
        close(STDIN_FILENO);
     c84:	83 ec 0c             	sub    $0xc,%esp
     c87:	6a 00                	push   $0x0
     c89:	e8 fd 04 00 00       	call   118b <close>
        dup(fd);
     c8e:	89 34 24             	mov    %esi,(%esp)
     c91:	e8 45 05 00 00       	call   11db <dup>
     c96:	83 c4 10             	add    $0x10,%esp
    close(fd);
     c99:	83 ec 0c             	sub    $0xc,%esp
     c9c:	56                   	push   %esi
     c9d:	e8 e9 04 00 00       	call   118b <close>
    runcmd(rcmd->cmd);
     ca2:	8b 5b 04             	mov    0x4(%ebx),%ebx
    break;
     ca5:	83 c4 10             	add    $0x10,%esp
     ca8:	e9 29 ff ff ff       	jmp    bd6 <runcmd+0x66>
     cad:	8d 76 00             	lea    0x0(%esi),%esi
    if (!strcmp(ecmd->argv[0], "hist")) { // all hist commands (print or num) handled here
     cb0:	83 ec 08             	sub    $0x8,%esp
     cb3:	68 64 16 00 00       	push   $0x1664
     cb8:	ff 73 04             	push   0x4(%ebx)
     cbb:	e8 90 02 00 00       	call   f50 <strcmp>
     cc0:	83 c4 10             	add    $0x10,%esp
     cc3:	85 c0                	test   %eax,%eax
     cc5:	0f 84 a5 00 00 00    	je     d70 <runcmd+0x200>
    if(ecmd->argv[0] == 0)
     ccb:	8b 43 04             	mov    0x4(%ebx),%eax
     cce:	85 c0                	test   %eax,%eax
     cd0:	0f 84 04 ff ff ff    	je     bda <runcmd+0x6a>
    exec(ecmd->argv[0], ecmd->argv);
     cd6:	83 ec 08             	sub    $0x8,%esp
     cd9:	8d 53 04             	lea    0x4(%ebx),%edx
     cdc:	52                   	push   %edx
     cdd:	50                   	push   %eax
     cde:	e8 b8 04 00 00       	call   119b <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     ce3:	83 c4 0c             	add    $0xc,%esp
     ce6:	ff 73 04             	push   0x4(%ebx)
     ce9:	68 83 16 00 00       	push   $0x1683
     cee:	6a 02                	push   $0x2
     cf0:	e8 cb 05 00 00       	call   12c0 <printf>
    break;
     cf5:	83 c4 10             	add    $0x10,%esp
}
     cf8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cfb:	5b                   	pop    %ebx
     cfc:	5e                   	pop    %esi
     cfd:	5f                   	pop    %edi
     cfe:	5d                   	pop    %ebp
     cff:	c3                   	ret
      printf(2, "fork failed\n");
     d00:	83 ec 08             	sub    $0x8,%esp
     d03:	68 c1 16 00 00       	push   $0x16c1
     d08:	6a 02                	push   $0x2
     d0a:	e8 b1 05 00 00       	call   12c0 <printf>
      break;
     d0f:	83 c4 10             	add    $0x10,%esp
}
     d12:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d15:	5b                   	pop    %ebx
     d16:	5e                   	pop    %esi
     d17:	5f                   	pop    %edi
     d18:	5d                   	pop    %ebp
     d19:	c3                   	ret
     d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(2, "pipe failed\n");
     d20:	83 ec 08             	sub    $0x8,%esp
     d23:	68 ce 16 00 00       	push   $0x16ce
     d28:	6a 02                	push   $0x2
     d2a:	e8 91 05 00 00       	call   12c0 <printf>
      break;
     d2f:	83 c4 10             	add    $0x10,%esp
}
     d32:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d35:	5b                   	pop    %ebx
     d36:	5e                   	pop    %esi
     d37:	5f                   	pop    %edi
     d38:	5d                   	pop    %ebp
     d39:	c3                   	ret
     d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        exec(ecmd->argv[0],ecmd->argv);
     d40:	83 ec 08             	sub    $0x8,%esp
     d43:	8d 43 04             	lea    0x4(%ebx),%eax
     d46:	50                   	push   %eax
     d47:	ff 73 04             	push   0x4(%ebx)
     d4a:	e8 4c 04 00 00       	call   119b <exec>
        printf(2, "Backgrounding not implemented\n",ecmd->argv[0]);
     d4f:	83 c4 0c             	add    $0xc,%esp
     d52:	ff 73 04             	push   0x4(%ebx)
     d55:	68 24 17 00 00       	push   $0x1724
     d5a:	6a 02                	push   $0x2
     d5c:	e8 5f 05 00 00       	call   12c0 <printf>
     d61:	83 c4 10             	add    $0x10,%esp
}
     d64:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d67:	5b                   	pop    %ebx
     d68:	5e                   	pop    %esi
     d69:	5f                   	pop    %edi
     d6a:	5d                   	pop    %ebp
     d6b:	c3                   	ret
     d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(!strcmp(ecmd->argv[1], "print")) {
     d70:	83 ec 08             	sub    $0x8,%esp
     d73:	68 69 16 00 00       	push   $0x1669
     d78:	ff 73 08             	push   0x8(%ebx)
     d7b:	e8 d0 01 00 00       	call   f50 <strcmp>
     d80:	83 c4 10             	add    $0x10,%esp
     d83:	89 c6                	mov    %eax,%esi
     d85:	85 c0                	test   %eax,%eax
     d87:	0f 84 fa 00 00 00    	je     e87 <runcmd+0x317>
        int historyIndex = atoi(ecmd->argv[1])-1; //hist <num> commands handled here, parsed like other commands
     d8d:	83 ec 0c             	sub    $0xc,%esp
     d90:	ff 73 08             	push   0x8(%ebx)
     d93:	e8 58 03 00 00       	call   10f0 <atoi>
        if (historyIndex >= 0 && historyIndex <= 9) {
     d98:	83 c4 10             	add    $0x10,%esp
        int historyIndex = atoi(ecmd->argv[1])-1; //hist <num> commands handled here, parsed like other commands
     d9b:	83 e8 01             	sub    $0x1,%eax
        if (historyIndex >= 0 && historyIndex <= 9) {
     d9e:	83 f8 09             	cmp    $0x9,%eax
     da1:	77 7d                	ja     e20 <runcmd+0x2b0>
          runcmd(parsecmd(history[historyIndex]));
     da3:	6b c0 64             	imul   $0x64,%eax,%eax
     da6:	83 ec 0c             	sub    $0xc,%esp
     da9:	05 00 1e 00 00       	add    $0x1e00,%eax
     dae:	50                   	push   %eax
     daf:	e8 4c fd ff ff       	call   b00 <parsecmd>
     db4:	89 04 24             	mov    %eax,(%esp)
     db7:	e8 b4 fd ff ff       	call   b70 <runcmd>
     dbc:	83 c4 10             	add    $0x10,%esp
     dbf:	e9 07 ff ff ff       	jmp    ccb <runcmd+0x15b>
     dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        unlink(file);
     dc8:	83 ec 0c             	sub    $0xc,%esp
     dcb:	57                   	push   %edi
     dcc:	e8 e2 03 00 00       	call   11b3 <unlink>
        fd = open(file, mode);
     dd1:	58                   	pop    %eax
     dd2:	5a                   	pop    %edx
     dd3:	56                   	push   %esi
     dd4:	57                   	push   %edi
     dd5:	e8 c9 03 00 00       	call   11a3 <open>
    if (fd < 0) {
     dda:	83 c4 10             	add    $0x10,%esp
        fd = open(file, mode);
     ddd:	89 c6                	mov    %eax,%esi
    if (fd < 0) {
     ddf:	85 c0                	test   %eax,%eax
     de1:	0f 88 03 01 00 00    	js     eea <runcmd+0x37a>
        close(STDOUT_FILENO);
     de7:	83 ec 0c             	sub    $0xc,%esp
     dea:	6a 01                	push   $0x1
     dec:	e8 9a 03 00 00       	call   118b <close>
        dup(fd);
     df1:	89 34 24             	mov    %esi,(%esp)
     df4:	e8 e2 03 00 00       	call   11db <dup>
     df9:	83 c4 10             	add    $0x10,%esp
    close(fd);
     dfc:	83 ec 0c             	sub    $0xc,%esp
     dff:	56                   	push   %esi
     e00:	e8 86 03 00 00       	call   118b <close>
    runcmd(rcmd->cmd);
     e05:	8b 5b 04             	mov    0x4(%ebx),%ebx
    break;
     e08:	83 c4 10             	add    $0x10,%esp
     e0b:	e9 c6 fd ff ff       	jmp    bd6 <runcmd+0x66>
      wait();
     e10:	e8 56 03 00 00       	call   116b <wait>
      runcmd(lcmd->right);
     e15:	8b 5b 08             	mov    0x8(%ebx),%ebx
     e18:	e9 b9 fd ff ff       	jmp    bd6 <runcmd+0x66>
     e1d:	8d 76 00             	lea    0x0(%esi),%esi
          printf(2, "usage\n");
     e20:	83 ec 08             	sub    $0x8,%esp
     e23:	68 7c 16 00 00       	push   $0x167c
     e28:	6a 02                	push   $0x2
     e2a:	e8 91 04 00 00       	call   12c0 <printf>
          break;
     e2f:	83 c4 10             	add    $0x10,%esp
     e32:	e9 7a fd ff ff       	jmp    bb1 <runcmd+0x41>
     e37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e3e:	66 90                	xchg   %ax,%ax
      close(1);
     e40:	83 ec 0c             	sub    $0xc,%esp
     e43:	6a 01                	push   $0x1
     e45:	e8 41 03 00 00       	call   118b <close>
      dup(p[1]);
     e4a:	5f                   	pop    %edi
     e4b:	ff 75 e4             	push   -0x1c(%ebp)
     e4e:	e8 88 03 00 00       	call   11db <dup>
      close(p[0]);
     e53:	58                   	pop    %eax
     e54:	ff 75 e0             	push   -0x20(%ebp)
     e57:	e8 2f 03 00 00       	call   118b <close>
      runcmd(pcmd->left);
     e5c:	58                   	pop    %eax
     e5d:	ff 73 04             	push   0x4(%ebx)
     e60:	e8 0b fd ff ff       	call   b70 <runcmd>
     e65:	83 c4 10             	add    $0x10,%esp
     e68:	e9 9e fd ff ff       	jmp    c0b <runcmd+0x9b>
            printf(1, "%d. %s", i+1, history[i]);
     e6d:	53                   	push   %ebx
     e6e:	56                   	push   %esi
     e6f:	68 75 16 00 00       	push   $0x1675
     e74:	6a 01                	push   $0x1
     e76:	e8 45 04 00 00       	call   12c0 <printf>
     e7b:	83 c4 10             	add    $0x10,%esp
        for (int i = 0; i < 10; i++) {
     e7e:	83 fe 0a             	cmp    $0xa,%esi
     e81:	0f 84 53 fd ff ff    	je     bda <runcmd+0x6a>
          if (strcmp(history[i], "empty")) {
     e87:	6b de 64             	imul   $0x64,%esi,%ebx
     e8a:	51                   	push   %ecx
            printf(1, "%d. %s", i+1, history[i]);
     e8b:	83 c6 01             	add    $0x1,%esi
          if (strcmp(history[i], "empty")) {
     e8e:	51                   	push   %ecx
     e8f:	68 6f 16 00 00       	push   $0x166f
     e94:	81 c3 00 1e 00 00    	add    $0x1e00,%ebx
     e9a:	53                   	push   %ebx
     e9b:	e8 b0 00 00 00       	call   f50 <strcmp>
     ea0:	83 c4 10             	add    $0x10,%esp
     ea3:	85 c0                	test   %eax,%eax
     ea5:	74 d7                	je     e7e <runcmd+0x30e>
     ea7:	eb c4                	jmp    e6d <runcmd+0x2fd>
     ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      close(0);
     eb0:	83 ec 0c             	sub    $0xc,%esp
     eb3:	6a 00                	push   $0x0
     eb5:	e8 d1 02 00 00       	call   118b <close>
      dup(p[0]);
     eba:	5a                   	pop    %edx
     ebb:	ff 75 e0             	push   -0x20(%ebp)
     ebe:	e8 18 03 00 00       	call   11db <dup>
      close(p[1]);
     ec3:	59                   	pop    %ecx
     ec4:	ff 75 e4             	push   -0x1c(%ebp)
     ec7:	e8 bf 02 00 00       	call   118b <close>
      runcmd(pcmd->right);
     ecc:	5e                   	pop    %esi
     ecd:	ff 73 08             	push   0x8(%ebx)
     ed0:	e8 9b fc ff ff       	call   b70 <runcmd>
     ed5:	83 c4 10             	add    $0x10,%esp
     ed8:	e9 41 fd ff ff       	jmp    c1e <runcmd+0xae>
    panic("runcmd");
     edd:	83 ec 0c             	sub    $0xc,%esp
     ee0:	68 5d 16 00 00       	push   $0x165d
     ee5:	e8 b6 f3 ff ff       	call   2a0 <panic>
        printf(2, "open %s failed\n", file);
     eea:	50                   	push   %eax
     eeb:	57                   	push   %edi
     eec:	68 b1 16 00 00       	push   $0x16b1
     ef1:	6a 02                	push   $0x2
     ef3:	e8 c8 03 00 00       	call   12c0 <printf>
        exit();
     ef8:	e8 66 02 00 00       	call   1163 <exit>
        printf(2, "Unsupported redirection mode\n");
     efd:	50                   	push   %eax
     efe:	50                   	push   %eax
     eff:	68 93 16 00 00       	push   $0x1693
     f04:	6a 02                	push   $0x2
     f06:	e8 b5 03 00 00       	call   12c0 <printf>
        exit();
     f0b:	e8 53 02 00 00       	call   1163 <exit>
    panic("fork");
     f10:	83 ec 0c             	sub    $0xc,%esp
     f13:	68 eb 15 00 00       	push   $0x15eb
     f18:	e8 83 f3 ff ff       	call   2a0 <panic>
     f1d:	66 90                	xchg   %ax,%ax
     f1f:	90                   	nop

00000f20 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     f20:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     f21:	31 c0                	xor    %eax,%eax
{
     f23:	89 e5                	mov    %esp,%ebp
     f25:	53                   	push   %ebx
     f26:	8b 4d 08             	mov    0x8(%ebp),%ecx
     f29:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     f30:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     f34:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     f37:	83 c0 01             	add    $0x1,%eax
     f3a:	84 d2                	test   %dl,%dl
     f3c:	75 f2                	jne    f30 <strcpy+0x10>
    ;
  return os;
}
     f3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f41:	89 c8                	mov    %ecx,%eax
     f43:	c9                   	leave
     f44:	c3                   	ret
     f45:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000f50 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     f50:	55                   	push   %ebp
     f51:	89 e5                	mov    %esp,%ebp
     f53:	53                   	push   %ebx
     f54:	8b 55 08             	mov    0x8(%ebp),%edx
     f57:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     f5a:	0f b6 02             	movzbl (%edx),%eax
     f5d:	84 c0                	test   %al,%al
     f5f:	75 17                	jne    f78 <strcmp+0x28>
     f61:	eb 3a                	jmp    f9d <strcmp+0x4d>
     f63:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f67:	90                   	nop
     f68:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     f6c:	83 c2 01             	add    $0x1,%edx
     f6f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     f72:	84 c0                	test   %al,%al
     f74:	74 1a                	je     f90 <strcmp+0x40>
    p++, q++;
     f76:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     f78:	0f b6 19             	movzbl (%ecx),%ebx
     f7b:	38 c3                	cmp    %al,%bl
     f7d:	74 e9                	je     f68 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     f7f:	29 d8                	sub    %ebx,%eax
}
     f81:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f84:	c9                   	leave
     f85:	c3                   	ret
     f86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f8d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     f90:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     f94:	31 c0                	xor    %eax,%eax
     f96:	29 d8                	sub    %ebx,%eax
}
     f98:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f9b:	c9                   	leave
     f9c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     f9d:	0f b6 19             	movzbl (%ecx),%ebx
     fa0:	31 c0                	xor    %eax,%eax
     fa2:	eb db                	jmp    f7f <strcmp+0x2f>
     fa4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     faf:	90                   	nop

00000fb0 <strlen>:

uint
strlen(char *s)
{
     fb0:	55                   	push   %ebp
     fb1:	89 e5                	mov    %esp,%ebp
     fb3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     fb6:	80 3a 00             	cmpb   $0x0,(%edx)
     fb9:	74 15                	je     fd0 <strlen+0x20>
     fbb:	31 c0                	xor    %eax,%eax
     fbd:	8d 76 00             	lea    0x0(%esi),%esi
     fc0:	83 c0 01             	add    $0x1,%eax
     fc3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     fc7:	89 c1                	mov    %eax,%ecx
     fc9:	75 f5                	jne    fc0 <strlen+0x10>
    ;
  return n;
}
     fcb:	89 c8                	mov    %ecx,%eax
     fcd:	5d                   	pop    %ebp
     fce:	c3                   	ret
     fcf:	90                   	nop
  for(n = 0; s[n]; n++)
     fd0:	31 c9                	xor    %ecx,%ecx
}
     fd2:	5d                   	pop    %ebp
     fd3:	89 c8                	mov    %ecx,%eax
     fd5:	c3                   	ret
     fd6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fdd:	8d 76 00             	lea    0x0(%esi),%esi

00000fe0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     fe0:	55                   	push   %ebp
     fe1:	89 e5                	mov    %esp,%ebp
     fe3:	57                   	push   %edi
     fe4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     fe7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     fea:	8b 45 0c             	mov    0xc(%ebp),%eax
     fed:	89 d7                	mov    %edx,%edi
     fef:	fc                   	cld
     ff0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     ff2:	8b 7d fc             	mov    -0x4(%ebp),%edi
     ff5:	89 d0                	mov    %edx,%eax
     ff7:	c9                   	leave
     ff8:	c3                   	ret
     ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001000 <strchr>:

char*
strchr(const char *s, char c)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	8b 45 08             	mov    0x8(%ebp),%eax
    1006:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    100a:	0f b6 10             	movzbl (%eax),%edx
    100d:	84 d2                	test   %dl,%dl
    100f:	75 12                	jne    1023 <strchr+0x23>
    1011:	eb 1d                	jmp    1030 <strchr+0x30>
    1013:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1017:	90                   	nop
    1018:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    101c:	83 c0 01             	add    $0x1,%eax
    101f:	84 d2                	test   %dl,%dl
    1021:	74 0d                	je     1030 <strchr+0x30>
    if(*s == c)
    1023:	38 d1                	cmp    %dl,%cl
    1025:	75 f1                	jne    1018 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1027:	5d                   	pop    %ebp
    1028:	c3                   	ret
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1030:	31 c0                	xor    %eax,%eax
}
    1032:	5d                   	pop    %ebp
    1033:	c3                   	ret
    1034:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    103b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    103f:	90                   	nop

00001040 <gets>:

char*
gets(char *buf, int max)
{
    1040:	55                   	push   %ebp
    1041:	89 e5                	mov    %esp,%ebp
    1043:	57                   	push   %edi
    1044:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1045:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
    1048:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1049:	31 db                	xor    %ebx,%ebx
{
    104b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    104e:	eb 27                	jmp    1077 <gets+0x37>
    cc = read(0, &c, 1);
    1050:	83 ec 04             	sub    $0x4,%esp
    1053:	6a 01                	push   $0x1
    1055:	56                   	push   %esi
    1056:	6a 00                	push   $0x0
    1058:	e8 1e 01 00 00       	call   117b <read>
    if(cc < 1)
    105d:	83 c4 10             	add    $0x10,%esp
    1060:	85 c0                	test   %eax,%eax
    1062:	7e 1d                	jle    1081 <gets+0x41>
      break;
    buf[i++] = c;
    1064:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1068:	8b 55 08             	mov    0x8(%ebp),%edx
    106b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    106f:	3c 0a                	cmp    $0xa,%al
    1071:	74 10                	je     1083 <gets+0x43>
    1073:	3c 0d                	cmp    $0xd,%al
    1075:	74 0c                	je     1083 <gets+0x43>
  for(i=0; i+1 < max; ){
    1077:	89 df                	mov    %ebx,%edi
    1079:	83 c3 01             	add    $0x1,%ebx
    107c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    107f:	7c cf                	jl     1050 <gets+0x10>
    1081:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
    1083:	8b 45 08             	mov    0x8(%ebp),%eax
    1086:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
    108a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    108d:	5b                   	pop    %ebx
    108e:	5e                   	pop    %esi
    108f:	5f                   	pop    %edi
    1090:	5d                   	pop    %ebp
    1091:	c3                   	ret
    1092:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000010a0 <stat>:

int
stat(char *n, struct stat *st)
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	56                   	push   %esi
    10a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    10a5:	83 ec 08             	sub    $0x8,%esp
    10a8:	6a 00                	push   $0x0
    10aa:	ff 75 08             	push   0x8(%ebp)
    10ad:	e8 f1 00 00 00       	call   11a3 <open>
  if(fd < 0)
    10b2:	83 c4 10             	add    $0x10,%esp
    10b5:	85 c0                	test   %eax,%eax
    10b7:	78 27                	js     10e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    10b9:	83 ec 08             	sub    $0x8,%esp
    10bc:	ff 75 0c             	push   0xc(%ebp)
    10bf:	89 c3                	mov    %eax,%ebx
    10c1:	50                   	push   %eax
    10c2:	e8 f4 00 00 00       	call   11bb <fstat>
  close(fd);
    10c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    10ca:	89 c6                	mov    %eax,%esi
  close(fd);
    10cc:	e8 ba 00 00 00       	call   118b <close>
  return r;
    10d1:	83 c4 10             	add    $0x10,%esp
}
    10d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10d7:	89 f0                	mov    %esi,%eax
    10d9:	5b                   	pop    %ebx
    10da:	5e                   	pop    %esi
    10db:	5d                   	pop    %ebp
    10dc:	c3                   	ret
    10dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    10e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    10e5:	eb ed                	jmp    10d4 <stat+0x34>
    10e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ee:	66 90                	xchg   %ax,%ax

000010f0 <atoi>:

int
atoi(const char *s)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	53                   	push   %ebx
    10f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    10f7:	0f be 02             	movsbl (%edx),%eax
    10fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
    10fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1100:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1105:	77 1e                	ja     1125 <atoi+0x35>
    1107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    110e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1110:	83 c2 01             	add    $0x1,%edx
    1113:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1116:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    111a:	0f be 02             	movsbl (%edx),%eax
    111d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1120:	80 fb 09             	cmp    $0x9,%bl
    1123:	76 eb                	jbe    1110 <atoi+0x20>
  return n;
}
    1125:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1128:	89 c8                	mov    %ecx,%eax
    112a:	c9                   	leave
    112b:	c3                   	ret
    112c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001130 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	57                   	push   %edi
    1134:	56                   	push   %esi
    1135:	8b 45 10             	mov    0x10(%ebp),%eax
    1138:	8b 55 08             	mov    0x8(%ebp),%edx
    113b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    113e:	85 c0                	test   %eax,%eax
    1140:	7e 13                	jle    1155 <memmove+0x25>
    1142:	01 d0                	add    %edx,%eax
  dst = vdst;
    1144:	89 d7                	mov    %edx,%edi
    1146:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    114d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1150:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1151:	39 f8                	cmp    %edi,%eax
    1153:	75 fb                	jne    1150 <memmove+0x20>
  return vdst;
}
    1155:	5e                   	pop    %esi
    1156:	89 d0                	mov    %edx,%eax
    1158:	5f                   	pop    %edi
    1159:	5d                   	pop    %ebp
    115a:	c3                   	ret

0000115b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    115b:	b8 01 00 00 00       	mov    $0x1,%eax
    1160:	cd 40                	int    $0x40
    1162:	c3                   	ret

00001163 <exit>:
SYSCALL(exit)
    1163:	b8 02 00 00 00       	mov    $0x2,%eax
    1168:	cd 40                	int    $0x40
    116a:	c3                   	ret

0000116b <wait>:
SYSCALL(wait)
    116b:	b8 03 00 00 00       	mov    $0x3,%eax
    1170:	cd 40                	int    $0x40
    1172:	c3                   	ret

00001173 <pipe>:
SYSCALL(pipe)
    1173:	b8 04 00 00 00       	mov    $0x4,%eax
    1178:	cd 40                	int    $0x40
    117a:	c3                   	ret

0000117b <read>:
SYSCALL(read)
    117b:	b8 05 00 00 00       	mov    $0x5,%eax
    1180:	cd 40                	int    $0x40
    1182:	c3                   	ret

00001183 <write>:
SYSCALL(write)
    1183:	b8 10 00 00 00       	mov    $0x10,%eax
    1188:	cd 40                	int    $0x40
    118a:	c3                   	ret

0000118b <close>:
SYSCALL(close)
    118b:	b8 15 00 00 00       	mov    $0x15,%eax
    1190:	cd 40                	int    $0x40
    1192:	c3                   	ret

00001193 <kill>:
SYSCALL(kill)
    1193:	b8 06 00 00 00       	mov    $0x6,%eax
    1198:	cd 40                	int    $0x40
    119a:	c3                   	ret

0000119b <exec>:
SYSCALL(exec)
    119b:	b8 07 00 00 00       	mov    $0x7,%eax
    11a0:	cd 40                	int    $0x40
    11a2:	c3                   	ret

000011a3 <open>:
SYSCALL(open)
    11a3:	b8 0f 00 00 00       	mov    $0xf,%eax
    11a8:	cd 40                	int    $0x40
    11aa:	c3                   	ret

000011ab <mknod>:
SYSCALL(mknod)
    11ab:	b8 11 00 00 00       	mov    $0x11,%eax
    11b0:	cd 40                	int    $0x40
    11b2:	c3                   	ret

000011b3 <unlink>:
SYSCALL(unlink)
    11b3:	b8 12 00 00 00       	mov    $0x12,%eax
    11b8:	cd 40                	int    $0x40
    11ba:	c3                   	ret

000011bb <fstat>:
SYSCALL(fstat)
    11bb:	b8 08 00 00 00       	mov    $0x8,%eax
    11c0:	cd 40                	int    $0x40
    11c2:	c3                   	ret

000011c3 <link>:
SYSCALL(link)
    11c3:	b8 13 00 00 00       	mov    $0x13,%eax
    11c8:	cd 40                	int    $0x40
    11ca:	c3                   	ret

000011cb <mkdir>:
SYSCALL(mkdir)
    11cb:	b8 14 00 00 00       	mov    $0x14,%eax
    11d0:	cd 40                	int    $0x40
    11d2:	c3                   	ret

000011d3 <chdir>:
SYSCALL(chdir)
    11d3:	b8 09 00 00 00       	mov    $0x9,%eax
    11d8:	cd 40                	int    $0x40
    11da:	c3                   	ret

000011db <dup>:
SYSCALL(dup)
    11db:	b8 0a 00 00 00       	mov    $0xa,%eax
    11e0:	cd 40                	int    $0x40
    11e2:	c3                   	ret

000011e3 <getpid>:
SYSCALL(getpid)
    11e3:	b8 0b 00 00 00       	mov    $0xb,%eax
    11e8:	cd 40                	int    $0x40
    11ea:	c3                   	ret

000011eb <sbrk>:
SYSCALL(sbrk)
    11eb:	b8 0c 00 00 00       	mov    $0xc,%eax
    11f0:	cd 40                	int    $0x40
    11f2:	c3                   	ret

000011f3 <sleep>:
SYSCALL(sleep)
    11f3:	b8 0d 00 00 00       	mov    $0xd,%eax
    11f8:	cd 40                	int    $0x40
    11fa:	c3                   	ret

000011fb <uptime>:
SYSCALL(uptime)
    11fb:	b8 0e 00 00 00       	mov    $0xe,%eax
    1200:	cd 40                	int    $0x40
    1202:	c3                   	ret

00001203 <shutdown>:
SYSCALL(shutdown)
    1203:	b8 16 00 00 00       	mov    $0x16,%eax
    1208:	cd 40                	int    $0x40
    120a:	c3                   	ret

0000120b <cps>:
SYSCALL(cps)
    120b:	b8 17 00 00 00       	mov    $0x17,%eax
    1210:	cd 40                	int    $0x40
    1212:	c3                   	ret

00001213 <chpr>:
SYSCALL(chpr)
    1213:	b8 18 00 00 00       	mov    $0x18,%eax
    1218:	cd 40                	int    $0x40
    121a:	c3                   	ret
    121b:	66 90                	xchg   %ax,%ax
    121d:	66 90                	xchg   %ax,%ax
    121f:	90                   	nop

00001220 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	57                   	push   %edi
    1224:	56                   	push   %esi
    1225:	53                   	push   %ebx
    1226:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    1228:	89 d1                	mov    %edx,%ecx
{
    122a:	83 ec 3c             	sub    $0x3c,%esp
    122d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
    1230:	85 d2                	test   %edx,%edx
    1232:	0f 89 80 00 00 00    	jns    12b8 <printint+0x98>
    1238:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    123c:	74 7a                	je     12b8 <printint+0x98>
    x = -xx;
    123e:	f7 d9                	neg    %ecx
    neg = 1;
    1240:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
    1245:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    1248:	31 f6                	xor    %esi,%esi
    124a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1250:	89 c8                	mov    %ecx,%eax
    1252:	31 d2                	xor    %edx,%edx
    1254:	89 f7                	mov    %esi,%edi
    1256:	f7 f3                	div    %ebx
    1258:	8d 76 01             	lea    0x1(%esi),%esi
    125b:	0f b6 92 a4 17 00 00 	movzbl 0x17a4(%edx),%edx
    1262:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
    1266:	89 ca                	mov    %ecx,%edx
    1268:	89 c1                	mov    %eax,%ecx
    126a:	39 da                	cmp    %ebx,%edx
    126c:	73 e2                	jae    1250 <printint+0x30>
  if(neg)
    126e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1271:	85 c0                	test   %eax,%eax
    1273:	74 07                	je     127c <printint+0x5c>
    buf[i++] = '-';
    1275:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
    127a:	89 f7                	mov    %esi,%edi
    127c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    127f:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1282:	01 df                	add    %ebx,%edi
    1284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
    1288:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
    128b:	83 ec 04             	sub    $0x4,%esp
    128e:	88 45 d7             	mov    %al,-0x29(%ebp)
    1291:	8d 45 d7             	lea    -0x29(%ebp),%eax
    1294:	6a 01                	push   $0x1
    1296:	50                   	push   %eax
    1297:	56                   	push   %esi
    1298:	e8 e6 fe ff ff       	call   1183 <write>
  while(--i >= 0)
    129d:	89 f8                	mov    %edi,%eax
    129f:	83 c4 10             	add    $0x10,%esp
    12a2:	83 ef 01             	sub    $0x1,%edi
    12a5:	39 d8                	cmp    %ebx,%eax
    12a7:	75 df                	jne    1288 <printint+0x68>
}
    12a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12ac:	5b                   	pop    %ebx
    12ad:	5e                   	pop    %esi
    12ae:	5f                   	pop    %edi
    12af:	5d                   	pop    %ebp
    12b0:	c3                   	ret
    12b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    12b8:	31 c0                	xor    %eax,%eax
    12ba:	eb 89                	jmp    1245 <printint+0x25>
    12bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    12c0:	55                   	push   %ebp
    12c1:	89 e5                	mov    %esp,%ebp
    12c3:	57                   	push   %edi
    12c4:	56                   	push   %esi
    12c5:	53                   	push   %ebx
    12c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    12c9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    12cc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    12cf:	0f b6 1e             	movzbl (%esi),%ebx
    12d2:	83 c6 01             	add    $0x1,%esi
    12d5:	84 db                	test   %bl,%bl
    12d7:	74 67                	je     1340 <printf+0x80>
    12d9:	8d 4d 10             	lea    0x10(%ebp),%ecx
    12dc:	31 d2                	xor    %edx,%edx
    12de:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    12e1:	eb 34                	jmp    1317 <printf+0x57>
    12e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12e7:	90                   	nop
    12e8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    12eb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    12f0:	83 f8 25             	cmp    $0x25,%eax
    12f3:	74 18                	je     130d <printf+0x4d>
  write(fd, &c, 1);
    12f5:	83 ec 04             	sub    $0x4,%esp
    12f8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    12fb:	88 5d e7             	mov    %bl,-0x19(%ebp)
    12fe:	6a 01                	push   $0x1
    1300:	50                   	push   %eax
    1301:	57                   	push   %edi
    1302:	e8 7c fe ff ff       	call   1183 <write>
    1307:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    130a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    130d:	0f b6 1e             	movzbl (%esi),%ebx
    1310:	83 c6 01             	add    $0x1,%esi
    1313:	84 db                	test   %bl,%bl
    1315:	74 29                	je     1340 <printf+0x80>
    c = fmt[i] & 0xff;
    1317:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    131a:	85 d2                	test   %edx,%edx
    131c:	74 ca                	je     12e8 <printf+0x28>
      }
    } else if(state == '%'){
    131e:	83 fa 25             	cmp    $0x25,%edx
    1321:	75 ea                	jne    130d <printf+0x4d>
      if(c == 'd'){
    1323:	83 f8 25             	cmp    $0x25,%eax
    1326:	0f 84 24 01 00 00    	je     1450 <printf+0x190>
    132c:	83 e8 63             	sub    $0x63,%eax
    132f:	83 f8 15             	cmp    $0x15,%eax
    1332:	77 1c                	ja     1350 <printf+0x90>
    1334:	ff 24 85 4c 17 00 00 	jmp    *0x174c(,%eax,4)
    133b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    133f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1340:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1343:	5b                   	pop    %ebx
    1344:	5e                   	pop    %esi
    1345:	5f                   	pop    %edi
    1346:	5d                   	pop    %ebp
    1347:	c3                   	ret
    1348:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    134f:	90                   	nop
  write(fd, &c, 1);
    1350:	83 ec 04             	sub    $0x4,%esp
    1353:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1356:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    135a:	6a 01                	push   $0x1
    135c:	52                   	push   %edx
    135d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    1360:	57                   	push   %edi
    1361:	e8 1d fe ff ff       	call   1183 <write>
    1366:	83 c4 0c             	add    $0xc,%esp
    1369:	88 5d e7             	mov    %bl,-0x19(%ebp)
    136c:	6a 01                	push   $0x1
    136e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1371:	52                   	push   %edx
    1372:	57                   	push   %edi
    1373:	e8 0b fe ff ff       	call   1183 <write>
        putc(fd, c);
    1378:	83 c4 10             	add    $0x10,%esp
      state = 0;
    137b:	31 d2                	xor    %edx,%edx
    137d:	eb 8e                	jmp    130d <printf+0x4d>
    137f:	90                   	nop
        printint(fd, *ap, 16, 0);
    1380:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1383:	83 ec 0c             	sub    $0xc,%esp
    1386:	b9 10 00 00 00       	mov    $0x10,%ecx
    138b:	8b 13                	mov    (%ebx),%edx
    138d:	6a 00                	push   $0x0
    138f:	89 f8                	mov    %edi,%eax
        ap++;
    1391:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
    1394:	e8 87 fe ff ff       	call   1220 <printint>
        ap++;
    1399:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    139c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    139f:	31 d2                	xor    %edx,%edx
    13a1:	e9 67 ff ff ff       	jmp    130d <printf+0x4d>
    13a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ad:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
    13b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    13b3:	8b 18                	mov    (%eax),%ebx
        ap++;
    13b5:	83 c0 04             	add    $0x4,%eax
    13b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    13bb:	85 db                	test   %ebx,%ebx
    13bd:	0f 84 9d 00 00 00    	je     1460 <printf+0x1a0>
        while(*s != 0){
    13c3:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    13c6:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    13c8:	84 c0                	test   %al,%al
    13ca:	0f 84 3d ff ff ff    	je     130d <printf+0x4d>
    13d0:	8d 55 e7             	lea    -0x19(%ebp),%edx
    13d3:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    13d6:	89 de                	mov    %ebx,%esi
    13d8:	89 d3                	mov    %edx,%ebx
    13da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    13e0:	83 ec 04             	sub    $0x4,%esp
    13e3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    13e6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    13e9:	6a 01                	push   $0x1
    13eb:	53                   	push   %ebx
    13ec:	57                   	push   %edi
    13ed:	e8 91 fd ff ff       	call   1183 <write>
        while(*s != 0){
    13f2:	0f b6 06             	movzbl (%esi),%eax
    13f5:	83 c4 10             	add    $0x10,%esp
    13f8:	84 c0                	test   %al,%al
    13fa:	75 e4                	jne    13e0 <printf+0x120>
      state = 0;
    13fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    13ff:	31 d2                	xor    %edx,%edx
    1401:	e9 07 ff ff ff       	jmp    130d <printf+0x4d>
    1406:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    140d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1410:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1413:	83 ec 0c             	sub    $0xc,%esp
    1416:	b9 0a 00 00 00       	mov    $0xa,%ecx
    141b:	8b 13                	mov    (%ebx),%edx
    141d:	6a 01                	push   $0x1
    141f:	e9 6b ff ff ff       	jmp    138f <printf+0xcf>
    1424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1428:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    142b:	83 ec 04             	sub    $0x4,%esp
    142e:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    1431:	8b 03                	mov    (%ebx),%eax
        ap++;
    1433:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    1436:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1439:	6a 01                	push   $0x1
    143b:	52                   	push   %edx
    143c:	57                   	push   %edi
    143d:	e8 41 fd ff ff       	call   1183 <write>
        ap++;
    1442:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1445:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1448:	31 d2                	xor    %edx,%edx
    144a:	e9 be fe ff ff       	jmp    130d <printf+0x4d>
    144f:	90                   	nop
  write(fd, &c, 1);
    1450:	83 ec 04             	sub    $0x4,%esp
    1453:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1456:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1459:	6a 01                	push   $0x1
    145b:	e9 11 ff ff ff       	jmp    1371 <printf+0xb1>
    1460:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    1465:	bb 43 17 00 00       	mov    $0x1743,%ebx
    146a:	e9 61 ff ff ff       	jmp    13d0 <printf+0x110>
    146f:	90                   	nop

00001470 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1470:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1471:	a1 64 22 00 00       	mov    0x2264,%eax
{
    1476:	89 e5                	mov    %esp,%ebp
    1478:	57                   	push   %edi
    1479:	56                   	push   %esi
    147a:	53                   	push   %ebx
    147b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    147e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1488:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    148a:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    148c:	39 ca                	cmp    %ecx,%edx
    148e:	73 30                	jae    14c0 <free+0x50>
    1490:	39 c1                	cmp    %eax,%ecx
    1492:	72 04                	jb     1498 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1494:	39 c2                	cmp    %eax,%edx
    1496:	72 f0                	jb     1488 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1498:	8b 73 fc             	mov    -0x4(%ebx),%esi
    149b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    149e:	39 f8                	cmp    %edi,%eax
    14a0:	74 2e                	je     14d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    14a2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    14a5:	8b 42 04             	mov    0x4(%edx),%eax
    14a8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    14ab:	39 f1                	cmp    %esi,%ecx
    14ad:	74 38                	je     14e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    14af:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    14b1:	5b                   	pop    %ebx
  freep = p;
    14b2:	89 15 64 22 00 00    	mov    %edx,0x2264
}
    14b8:	5e                   	pop    %esi
    14b9:	5f                   	pop    %edi
    14ba:	5d                   	pop    %ebp
    14bb:	c3                   	ret
    14bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    14c0:	39 c1                	cmp    %eax,%ecx
    14c2:	72 d0                	jb     1494 <free+0x24>
    14c4:	eb c2                	jmp    1488 <free+0x18>
    14c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14cd:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
    14d0:	03 70 04             	add    0x4(%eax),%esi
    14d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    14d6:	8b 02                	mov    (%edx),%eax
    14d8:	8b 00                	mov    (%eax),%eax
    14da:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    14dd:	8b 42 04             	mov    0x4(%edx),%eax
    14e0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    14e3:	39 f1                	cmp    %esi,%ecx
    14e5:	75 c8                	jne    14af <free+0x3f>
    p->s.size += bp->s.size;
    14e7:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    14ea:	89 15 64 22 00 00    	mov    %edx,0x2264
    p->s.size += bp->s.size;
    14f0:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    14f3:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    14f6:	89 0a                	mov    %ecx,(%edx)
}
    14f8:	5b                   	pop    %ebx
    14f9:	5e                   	pop    %esi
    14fa:	5f                   	pop    %edi
    14fb:	5d                   	pop    %ebp
    14fc:	c3                   	ret
    14fd:	8d 76 00             	lea    0x0(%esi),%esi

00001500 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1500:	55                   	push   %ebp
    1501:	89 e5                	mov    %esp,%ebp
    1503:	57                   	push   %edi
    1504:	56                   	push   %esi
    1505:	53                   	push   %ebx
    1506:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1509:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    150c:	8b 15 64 22 00 00    	mov    0x2264,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1512:	8d 78 07             	lea    0x7(%eax),%edi
    1515:	c1 ef 03             	shr    $0x3,%edi
    1518:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    151b:	85 d2                	test   %edx,%edx
    151d:	0f 84 8d 00 00 00    	je     15b0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1523:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1525:	8b 48 04             	mov    0x4(%eax),%ecx
    1528:	39 f9                	cmp    %edi,%ecx
    152a:	73 64                	jae    1590 <malloc+0x90>
  if(nu < 4096)
    152c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1531:	39 df                	cmp    %ebx,%edi
    1533:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1536:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    153d:	eb 0a                	jmp    1549 <malloc+0x49>
    153f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1540:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1542:	8b 48 04             	mov    0x4(%eax),%ecx
    1545:	39 f9                	cmp    %edi,%ecx
    1547:	73 47                	jae    1590 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1549:	89 c2                	mov    %eax,%edx
    154b:	39 05 64 22 00 00    	cmp    %eax,0x2264
    1551:	75 ed                	jne    1540 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    1553:	83 ec 0c             	sub    $0xc,%esp
    1556:	56                   	push   %esi
    1557:	e8 8f fc ff ff       	call   11eb <sbrk>
  if(p == (char*)-1)
    155c:	83 c4 10             	add    $0x10,%esp
    155f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1562:	74 1c                	je     1580 <malloc+0x80>
  hp->s.size = nu;
    1564:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1567:	83 ec 0c             	sub    $0xc,%esp
    156a:	83 c0 08             	add    $0x8,%eax
    156d:	50                   	push   %eax
    156e:	e8 fd fe ff ff       	call   1470 <free>
  return freep;
    1573:	8b 15 64 22 00 00    	mov    0x2264,%edx
      if((p = morecore(nunits)) == 0)
    1579:	83 c4 10             	add    $0x10,%esp
    157c:	85 d2                	test   %edx,%edx
    157e:	75 c0                	jne    1540 <malloc+0x40>
        return 0;
  }
}
    1580:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1583:	31 c0                	xor    %eax,%eax
}
    1585:	5b                   	pop    %ebx
    1586:	5e                   	pop    %esi
    1587:	5f                   	pop    %edi
    1588:	5d                   	pop    %ebp
    1589:	c3                   	ret
    158a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1590:	39 cf                	cmp    %ecx,%edi
    1592:	74 4c                	je     15e0 <malloc+0xe0>
        p->s.size -= nunits;
    1594:	29 f9                	sub    %edi,%ecx
    1596:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1599:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    159c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    159f:	89 15 64 22 00 00    	mov    %edx,0x2264
}
    15a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    15a8:	83 c0 08             	add    $0x8,%eax
}
    15ab:	5b                   	pop    %ebx
    15ac:	5e                   	pop    %esi
    15ad:	5f                   	pop    %edi
    15ae:	5d                   	pop    %ebp
    15af:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    15b0:	c7 05 64 22 00 00 68 	movl   $0x2268,0x2264
    15b7:	22 00 00 
    base.s.size = 0;
    15ba:	b8 68 22 00 00       	mov    $0x2268,%eax
    base.s.ptr = freep = prevp = &base;
    15bf:	c7 05 68 22 00 00 68 	movl   $0x2268,0x2268
    15c6:	22 00 00 
    base.s.size = 0;
    15c9:	c7 05 6c 22 00 00 00 	movl   $0x0,0x226c
    15d0:	00 00 00 
    if(p->s.size >= nunits){
    15d3:	e9 54 ff ff ff       	jmp    152c <malloc+0x2c>
    15d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15df:	90                   	nop
        prevp->s.ptr = p->s.ptr;
    15e0:	8b 08                	mov    (%eax),%ecx
    15e2:	89 0a                	mov    %ecx,(%edx)
    15e4:	eb b9                	jmp    159f <malloc+0x9f>
