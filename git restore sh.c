[1mdiff --git a/sh.c b/sh.c[m
[1mdeleted file mode 100644[m
[1mindex fa4ce8e..0000000[m
[1m--- a/sh.c[m
[1m+++ /dev/null[m
[36m@@ -1,570 +0,0 @@[m
[31m-// Shell.[m
[31m-[m
[31m-#include "types.h"[m
[31m-#include "user.h"[m
[31m-#include "fcntl.h"[m
[31m-[m
[31m-// Parsed command representation[m
[31m-#define EXEC  1[m
[31m-#define REDIR 2[m
[31m-#define PIPE  3[m
[31m-#define LIST  4[m
[31m-#define BACK  5[m
[31m-[m
[31m-#define MAXARGS 10[m
[31m-[m
[31m-struct cmd {[m
[31m-  int type;[m
[31m-};[m
[31m-[m
[31m-struct execcmd {[m
[31m-  int type;[m
[31m-  char *argv[MAXARGS];[m
[31m-  char *eargv[MAXARGS];[m
[31m-};[m
[31m-[m
[31m-struct redircmd {[m
[31m-  int type;[m
[31m-  struct cmd *cmd;[m
[31m-  char *file;[m
[31m-  char *efile;[m
[31m-  int mode;[m
[31m-  int fd;[m
[31m-};[m
[31m-[m
[31m-struct pipecmd {[m
[31m-  int type;[m
[31m-  struct cmd *left;[m
[31m-  struct cmd *right;[m
[31m-};[m
[31m-[m
[31m-struct listcmd {[m
[31m-  int type;[m
[31m-  struct cmd *left;[m
[31m-  struct cmd *right;[m
[31m-};[m
[31m-[m
[31m-struct backcmd {[m
[31m-  int type;[m
[31m-  struct cmd *cmd;[m
[31m-};[m
[31m-[m
[31m-int fork1(void);  // Fork but panics on failure.[m
[31m-void panic(char*);[m
[31m-struct cmd *parsecmd(char*);[m
[31m-[m
[31m-char history[10][100];[m
[31m-// Execute cmd.  Never returns.[m
[31m-void[m
[31m-runcmd(struct cmd *cmd)[m
[31m-{[m
[31m-  int p[2];[m
[31m-  //struct backcmd *bcmd;[m
[31m-  struct execcmd *ecmd;[m
[31m-  struct listcmd *lcmd;[m
[31m-  struct pipecmd *pcmd;[m
[31m-  //struct redircmd *rcmd;[m
[31m-  [m
[31m-  if(cmd == 0)[m
[31m-    exit();[m
[31m-[m
[31m-  switch(cmd->type){[m
[31m-  default:[m
[31m-    panic("runcmd");[m
[31m-[m
[31m-  case EXEC:[m
[31m-    ecmd = (struct execcmd*)cmd;[m
[31m-    if (!strcmp(ecmd->argv[0], "hist")) { // all hist commands (print or num) handled here[m
[31m-      if(!strcmp(ecmd->argv[1], "print")) {[m
[31m-        for (int i = 0; i < 10; i++) {[m
[31m-          if (strcmp(history[i], "empty")) {[m
[31m-            printf(1, "%d. %s", i+1, history[i]);[m
[31m-          }[m
[31m-        }[m
[31m-        exit(); // process exits after printing[m
[31m-      } else {[m
[31m-        int historyIndex = atoi(ecmd->argv[1])-1; //hist <num> commands handled here, parsed like other commands[m
[31m-        if (historyIndex >= 0 && historyIndex <= 9) {[m
[31m-          runcmd(parsecmd(history[historyIndex]));[m
[31m-        } else {[m
[31m-          printf(2, "usage\n");[m
[31m-          break;[m
[31m-        }[m
[31m-      }[m
[31m-    }[m
[31m-    if(ecmd->argv[0] == 0)[m
[31m-      exit();[m
[31m-    exec(ecmd->argv[0], ecmd->argv);[m
[31m-    printf(2, "exec %s failed\n", ecmd->argv[0]);[m
[31m-    break;[m
[31m-[m
[31m-  case REDIR:[m
[31m-  {[m
[31m-    #ifndef STDOUT_FILENO[m
[31m-#define STDOUT_FILENO 1[m
[31m-#endif[m
[31m-[m
[31m-#ifndef STDIN_FILENO[m
[31m-#define STDIN_FILENO 0[m
[31m-#endif[m
[31m-    struct redircmd *rcmd = (struct redircmd*)cmd;[m
[31m-    int fd, mode = rcmd->mode;[m
[31m-    char *file = rcmd->file;[m
[31m-[m
[31m-    fd = open(file, mode);[m
[31m-    if (fd < 0) {[m
[31m-      printf(2, "open %s failed\n", file);[m
[31m-      exit();[m
[31m-    }[m
[31m-[m
[31m-    if (mode == O_WRONLY || mode == (O_WRONLY|O_CREATE)) {[m
[31m-      close(STDOUT_FILENO);[m
[31m-      dup(fd);[m
[31m-    } else if (mode == O_RDONLY) {[m
[31m-      close(STDIN_FILENO);[m
[31m-      dup(fd);[m
[31m-    } else {[m
[31m-      printf(2, "Unsupported redirection mode\n");[m
[31m-      exit();[m
[31m-    }[m
[31m-    close(fd);[m
[31m-[m
[31m-    runcmd(rcmd->cmd);[m
[31m-    break;[m
[31m-  }[m
[31m-[m
[31m-[m
[31m-  case LIST:[m
[31m-    lcmd = (struct listcmd*)cmd;[m
[31m-    int child_pid = fork();[m
[31m-    if (child_pid < 0) {[m
[31m-      printf(2, "fork failed\n");[m
[31m-      break;[m
[31m-    } else if (child_pid == 0) {[m
[31m-      runcmd(lcmd->left);[m
[31m-    } else {[m
[31m-      wait();[m
[31m-      runcmd(lcmd->right);[m
[31m-    }[m
[31m-    break;[m
[31m-[m
[31m-  case PIPE:[m
[31m-    pcmd = (struct pipecmd*)cmd;[m
[31m-    if (pipe(p) == -1) {[m
[31m-      printf(2, "pipe failed\n");[m
[31m-      break;[m
[31m-    }[m
[31m-[m
[31m-    int child_pid1 = fork();[m
[31m-    if (child_pid1 < 0) {[m
[31m-      printf(2, "fork failed\n");[m
[31m-      break;[m
[31m-    } else if (child_pid1 == 0) {[m
[31m-      close(1);[m
[31m-      dup(p[1]);[m
[31m-      close(p[0]);[m
[31m-      runcmd(pcmd->left);[m
[31m-    }[m
[31m-[m
[31m-    int child_pid2 = fork();[m
[31m-    if (child_pid2 < 0) {[m
[31m-      printf(2, "fork failed\n");[m
[31m-      break;[m
[31m-    } else if (child_pid2 == 0) {[m
[31m-      close(0);[m
[31m-      dup(p[0]);[m
[31m-      close(p[1]);[m
[31m-      runcmd(pcmd->right);[m
[31m-    }[m
[31m-[m
[31m-    close(p[0]);[m
[31m-    close(p[1]);[m
[31m-    wait();[m
[31m-    wait();[m
[31m-[m
[31m-    break;[m
[31m-[m
[31m-  case BACK:[m
[31m-    printf(2, "Backgrounding not implemented\n");[m
[31m-    break;[m
[31m-  }[m
[31m-  exit();[m
[31m-}[m
[31m-[m
[31m-int[m
[31m-getcmd(char *buf, int nbuf)[m
[31m-{[m
[31m-  printf(2, "$ ");[m
[31m-  memset(buf, 0, nbuf);[m
[31m-  gets(buf, nbuf);[m
[31m-  if(buf[0] == 0) // EOF[m
[31m-    return -1;[m
[31m-  return 0;[m
[31m-}[m
[31m-[m
[31m-void updateHist(char *buf) { // maintain history buffer[m
[31m-  for (int i = 9; i >= 1; i--) {[m
[31m-    strcpy(history[i], history[i-1]);[m
[31m-  }[m
[31m-  strcpy(history[0], buf);[m
[31m-}[m
[31m-int[m
[31m-main(void)[m
[31m-{[m
[31m-  static char buf[100];[m
[31m-  int fd;[m
[31m-  for (int i = 0; i < 10; i++) { // initialize the history buffer[m
[31m-    strcpy(history[i], "empty");[m
[31m-  }[m
[31m-[m
[31m-  // Ensure that three file descriptors are open.[m
[31m-  while((fd = open("console", O_RDWR)) >= 0){[m
[31m-    if(fd >= 3){[m
[31m-      close(fd);[m
[31m-      break;[m
[31m-    }[m
[31m-  }[m
[31m-[m
[31m-  // Read and run input commands.[m
[31m-  while(getcmd(buf, sizeof(buf)) >= 0){[m
[31m-    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){[m
[31m-      // Chdir must be called by the parent, not the child.[m
[31m-      buf[strlen(buf)-1] = 0;  // chop \n[m
[31m-      if(chdir(buf+3) < 0)[m
[31m-        printf(2, "cannot cd %s\n", buf+3);[m
[31m-      continue;[m
[31m-    }[m
[31m-    if (!strcmp(buf, "\n")) { // exclude empty lines from history (interferes with "hist print")[m
[31m-      continue;[m
[31m-    }[m
[31m-    // exclude hist commands from history buffer[m
[31m-    if (!(buf[0] == 'h' && buf[1] == 'i' && buf[2] == 's' && buf[3] == 't' && buf[4] == ' ')) {[m
[31m-      updateHist(buf); [m
[31m-    }[m
[31m-    if(fork1() == 0)[m
[31m-      runcmd(parsecmd(buf));[m
[31m-    wait();[m
[31m-  }[m
[31m-  exit();[m
[31m-}[m
[31m-[m
[31m-void[m
[31m-panic(char *s)[m
[31m-{[m
[31m-  printf(2, "%s\n", s);[m
[31m-  exit();[m
[31m-}[m
[31m-[m
[31m-int[m
[31m-fork1(void)[m
[31m-{[m
[31m-  int pid;[m
[31m-[m
[31m-  pid = fork();[m
[31m-  if(pid == -1)[m
[31m-    panic("fork");[m
[31m-  return pid;[m
[31m-}[m
[31m-[m
[31m-//PAGEBREAK![m
[31m-// Constructors[m
[31m-[m
[31m-struct cmd*[m
[31m-execcmd(void)[m
[31m-{[m
[31m-  struct execcmd *cmd;[m
[31m-[m
[31m-  cmd = malloc(sizeof(*cmd));[m
[31m-  memset(cmd, 0, sizeof(*cmd));[m
[31m-  cmd->type = EXEC;[m
[31m-  return (struct cmd*)cmd;[m
[31m-}[m
[31m-[m
[31m-struct cmd*[m
[31m-redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)[m
[31m-{[m
[31m-  struct redircmd *cmd;[m
[31m-[m
[31m-  cmd = malloc(sizeof(*cmd));[m
[31m-  memset(cmd, 0, sizeof(*cmd));[m
[31m-  cmd->type = REDIR;[m
[31m-  cmd->cmd