#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>

#define SHELL "/bin/sh "

int main (int argc, char *argv[]) {
    char *str;
    int size = 0;
    int index;
    setuid (0);

    /* WARNING: Only use an absolute path to the script to execute,
    *          a malicious user might fool the binary and execute
    *          arbitary commands if not.
    * */
      
    /* how long the buffer needs to be? */
    // remember the ending NULL
    size = strlen(SHELL) + 1;
    // the first argument is the name of this program. Ignore.
    for(index = 1; index < argc; index++)
        size += strlen(argv[index]);
    // take spaces between arguments into account!
    size += argc - 1;
    // reserve enough memory
    if(!(str=malloc(sizeof(char)*size))) {
       // not enough memory!
        printf("Not enough memory\n");
	return 1;
    }
    
    str[0] = 0;
    strcpy(str, SHELL);
    for(index = 1; index < argc; index++) {
        strcat(str," ");
        strcat(str,argv[index]);
    }

    /* if(!setuid(0)) {
        printf("Error setting setuid\n");
        return 1;
    }
    */

    /* Run the command */
    //printf("%s\n\n",str);
    system (str);
    return 0;
}

