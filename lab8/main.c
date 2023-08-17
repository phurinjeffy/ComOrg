#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    srand(time(NULL));
    int randomNumber = rand() % 99 + 1;
    int guess;
    int attempts = 0;

    while (attempts < 5) {
        printf("Enter your guess (between 1 and 99): ");
        scanf("%d", &guess);

        int result = sub_s(guess, randomNumber);

        if (result == 0) {
            printf("You win!\n");
            break;
        }
        else {
            printf("Not match.\n");
            attempts++;
        }
    }

    if (attempts == 5) {
        printf("You lose!\n");
    }

    return 0;
}