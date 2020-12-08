#include "chall_init.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <assert.h>
#include <seccomp.h> 
#include <sys/prctl.h>

void init_all() {
    init_timeout();
    init_buffers();
    init_seccomp();
}

static void timeout() {
    puts("Timeout...");
    exit(-1);
}

void init_timeout() {
    signal(SIGALRM, timeout);
    alarm(MAX_ALIVE_TIME);
}

void init_buffers() {
    setbuf(stdout, NULL);
    setbuf(stdin, NULL);
}

// CUSTOMIZE: choose your allowed syscalls
void init_seccomp() {
    prctl(PR_SET_NO_NEW_PRIVS, 1);

    scmp_filter_ctx ctx;
    ctx = seccomp_init(SCMP_ACT_KILL);

    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(rt_sigreturn), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(exit), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(exit_group), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(read), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(write), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(open), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(close), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(mmap), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(munmap), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(brk), 0);

    seccomp_load(ctx);
}
