/* Nathan Englehart (Summer, 2022) */

#include <stdio.h>
#include <math.h>

double one_sample(double x_bar, double mu, double s, int n) {

	/* Returns t value for one tailed t-test using given variables. */

	return (x_bar - mu) / (s / sqrt(n));

}

int main() {

	double x_bar = 74.0;
	double mu = 78.0;
	double s = 3.5;
	int n = 10;

	double t = fabs(one_sample(x_bar, mu, s, n));

	printf("absolute t = %f.\n",t);
	printf("df = %d.\n",n-1);

	return 0;

}
