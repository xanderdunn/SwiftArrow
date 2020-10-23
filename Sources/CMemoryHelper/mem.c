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
        fscanf(f, "%s", buffer);
        uint64_t residentPages = atoi(buffer);
        uint64_t residentBytes = residentPages * 4096;
        fclose (f);
        return residentBytes;
    }
    return 0;
}
