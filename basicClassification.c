#include <stdio.h>
#include <math.h>
#include "NumClass.h"

int fact(int n)
{
    int fn = 1;
    for (int i = 1; i <= n; i++)
    {
        fn *= i;
    }
    return fn;
}
int isStrong(int n)
{
    int num = n;
    int sum = 0;
    if (n == 0)
    {
        return 0;
    }
    while (num > 0)
    {
        sum += fact(num % 10);
        num = num / 10;
    }
    if (sum == n)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
int isPrime(int n)
{
    int num = n;
    if (n <= 1)
    {
        return 0;
    }
    for (int i = 2; i < sqrt(num); i++)
    {
        if (n % i == 0)
        {
            return 0;
        }
    }
    return 1;
}
