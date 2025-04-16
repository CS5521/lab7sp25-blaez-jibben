#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "pstat.h"
#include "stat.h"
#include "syscall.h"


int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}


// prototype for my sys get pinfo and set tickets
extern void fillpstat(pstatTable *);
extern int setTicket(int pid, int tickets);


int
sys_getpinfo(void)
{
  //pstat table obj
  pstatTable* p;

  // use argptr to get the value o the pstat table object
  if(argptr(0, (void*) &p, sizeof(pstatTable)) < 0) { // fetches pointer
    return -1;                                        // if < 0 we know it failed
  }
  
  // else it didnt fail
  fillpstat(p); // fill table

  // ** print items from table ** //
  int i;

  cprintf("PID\tTKTS\tTCKS\tSTAT\tNAME\n");

  for(i = 0; i < NPROC; i++) {
    if((*p)[i].inuse == 0) {        // process not in use
      continue; 
    }
    cprintf("%d\t%d\t%d\t%s\t%s\n", 
      (*p)[i].pid,
      (*p)[i].tickets,
      (*p)[i].ticks,
      &(*p)[i].state, 
      (*p)[i].name);
  }
  return 0;
}

int 
sys_settickets(void) {
  int n;

  if(argint(0, &n) < 0) { // if arg 0 fails
    return -1;            // failed ptr
  }

  if(n < 10) { // number less than 10
    return -1;
  }

  int pid = sys_getpid(); // get process id
  setTicket(pid, n);      // set ticket
  return 0;
}