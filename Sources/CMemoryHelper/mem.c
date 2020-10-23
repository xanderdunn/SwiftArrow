#include "mem.h"

// See /proc/[pid]/statm here: https://man7.org/linux/man-pages/man5/proc.5.html
// This gives virtual memory size, resident, shared in pages
// Default page size if 

// Return the virtual memory curently in use by this process in bytes
uint64_t getProcessMemoryUsage() {
    char buffer[1000];
    long length;
    FILE* f = fopen( "/proc/self/statm", "r");
    int i;
    if (f) {
        fscanf(f, "%s", buffer);
        /*printf("vm: %s\n", buffer);*/
        fscanf(f, "%s", buffer);
        /*printf("resident: %s\n", buffer);*/
        uint64_t residentPages = atoi(buffer);
        printf("pages: %" PRIu64 "\n", residentPages);
        uint64_t residentBytes = residentPages * 4096;
        printf("bytes: %" PRIu64 "\n", residentBytes);
        fclose (f);
        return residentBytes;
        /*fseek (f, 0, SEEK_END);*/
        /*length = ftell (f);*/
        /*fseek (f, 0, SEEK_SET);*/
        /*buffer = malloc (length);*/
        /*if (buffer)*/
        /*{*/
          /*printf("Reading into buffer...\n");*/
          /*fread (buffer, 1, length, f);*/
        /*}*/
    }
    return 0;

    /*if (buffer)*/
    /*{*/
      /*// start to process your data / extract strings here...*/
      /*printf("Read this string:\n"):*/
      /*printf("%s\n", buffer);*/
    /*}*/
}
