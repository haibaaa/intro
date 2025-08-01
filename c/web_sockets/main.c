#include <arpa/inet.h>
#include <errno.h>
#include <netinet/in.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <sys/socket.h>
#include <unistd.h>

/*defines*/
#define SERVER_PORT 80
#define MAXLINE 4096

/*declarations*/
void die(const char *fmt, ...);

/*main*/
int main(int argc, char **argv) {
    int sockfd, n;
    int sendbytes;
    struct sockaddr_in servaddr;
    char sendline[MAXLINE];
    char recvline[MAXLINE];

    if (argc != 2) {
        die("usage %s <server address>", argv[0]);
    }

    if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        die("error while creating socket");
    }

    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(SERVER_PORT); /*chat server*/

    // parse ip
    if (inet_pton(AF_INET, argv[1], &servaddr.sin_addr) <= 0) {
        die("inet_pton error for %s ", argv[1]);
    }

    // establish connection
    if (connect(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
        die("connection failed");
    }

    sprintf(sendline, "GET / HTTP/1.1\r\n\r\n");
    sendbytes = strlen(sendline);

    // send this request -- making sure you send it all
    if (write(sockfd, sendline, sendbytes) != sendbytes) {
        die("write err");
    }

    memset(recvline, 0, MAXLINE);
    // read server response
    while ((n = read(sockfd, recvline, MAXLINE)) > 0) {
        printf("%s", recvline);
        memset(recvline, 0, MAXLINE);
    }

    if (n < 0) {
        die("read err");
    }

    exit(0);
}

/*helpers*/
void die(const char *fmt, ...) {
    int errno_save;
    va_list ap;

    // any system or lib call can set errno
    errno_save = errno;

    // print out fmt+args to stdout
    va_start(ap, fmt);
    vfprintf(stdout, fmt, ap);
    fprintf(stdout, "\n");
    fflush(stdout);

    // print out err message if errno was set
    if (errno_save != 0) {
        fprintf(stdout, "(errno = %d) : %s\n", errno_save,
                strerror(errno_save));
        fprintf(stdout, "\n");
        fflush(stdout);
    }

    va_end(ap);

    exit(1);
}
