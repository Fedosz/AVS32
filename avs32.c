#include <stdio.h>
#include <math.h>

double f(double x) {
    return (pow(2,pow(x,2) + 1) + pow(x,2) - 4);
}

int main(int argc, char *argv[]) {
    double e = atof(argv[1]);
    if (e > 0.001 || e < 0.00000001) {
        printf("%s", "Incorrect precision, restart program");
        return 0;
    }
    double left = 0;
    double right = 1;
    double mid = (left + right) / 2;
    register int i asm("r13") = 0;
    do {
        if (f(left) * f(mid) < 0) {
            right = mid;
            mid = (left + right) / 2;
        } else if (f(mid) * f(right) < 0) {
            left = mid;
            mid = (left + right) / 2;
        }
        i++;
    } while ((right - left) / 2 > e);
    printf("%.8lf", mid);
    printf("%c", '\n');
    printf("%s", "Amount of iterations: ");
    printf("%d", i);
    return 0;
}
