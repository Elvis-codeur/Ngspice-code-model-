#include "convolution.h"

void decale(double *data, int size, double new)
{
    int i;
    for(int i  = size; i > 0; i--)
    {
        data[i] = data[i-1];
    }
    data[0] = new;
    
}
double convolve(double *data, double *kernel,int size)
{
    double result;
    
    int i;
    for(i = 0; i < size; i++)
    {
        result += data[i]*(kernel[size-i-1]);

    }
    return result;
}