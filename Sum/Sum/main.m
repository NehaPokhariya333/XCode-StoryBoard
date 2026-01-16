//
//  main.m
//  neha
//
//  Created by GEU on 23/09/25.
//

#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a, b;
        printf("Enter two numbers: ");
        scanf("%d %d", &a, &b);

        pid_t pid = fork();

        if (pid < 0) {
            printf("Fork failed!\n");
            return 1;
        }
        else if (pid == 0) {
            sleep(2);
            int sum = a + b;
            printf("Child Process (PID: %d): Sum = %d\n", getpid(), sum);
        }
        else {
            int status;
            wait(&status);
            int product = a * b;
            printf("Parent Process (PID: %d): Multiplication = %d\n", getpid(), product);
        }
        return 0;
    }
    return NSApplicationMain(argc, argv);
}
