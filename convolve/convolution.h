# ifndef CONVOLUTION_H
# define CONVOLUTION_H

int compteur;

double convolve(double *data, double *kernel,int size);
void decale(double *data, int size, double nouveau);

#endif