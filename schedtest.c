#include "types.h"
#include "user.h"

#define startingArg 2

int
main(int argc, char *argv[])
{
    // case 1 no or not enough args
    if(argc <= 2) {
         printf(1, "usage: schedtest loops tickets 1 [ tickets2 ... ticketsN ]\n \
        loops must be greater than 0\n \
        tickets must be greater than or equal to 10\n \
        up to 7 tickets can be provided\n");

        exit();
    }

    int i = 0;
    int numOfProcesses = argc - startingArg; // argc = 2 means 1 arg.
    int loops = atoi(argv[1]); // first arg is looping

    printf(1, "loop count: %d\n", loops);
    
    /** error checking **/
    if(loops <= 0) {
        printf(1, "loops must be >= 0\n");
        exit();
    }

    if(numOfProcesses > 7) {
        printf(1, "too many processes. up to 7 can be provided\n");
        exit();
    } 

    for(i = 0; i < numOfProcesses; i++) {
        if(atoi(argv[i + startingArg]) < 10) {
            printf(1, "tickets must be >= 10\n");
            exit();
        }
    }

    /** safe args **/

    int pid;
    int pids[numOfProcesses];
    int tickets;
    for(i = 0; i < numOfProcesses; i++) {

        pid = fork();                        // create child process
        tickets = atoi(argv[i + startingArg]); // get ticket #

        if(pid == 0) {                       // im a child process
            settickets(tickets);             // set tickets
            while(1);                      // infinite loop           
        }

        pids[i] = pid; // parent will add this to kill pids
    }
   
    for(i = 0; i < loops; i++) {
        ps();
        sleep(3);
        //printf(1, "loop num: %d\n", i);
    }

    for(i = 0; i < numOfProcesses; i++) {
        kill(pids[i]);
        //printf(1, "value of pid killed: %d\n", pids[i]);
        wait();
    }

    exit();
}

