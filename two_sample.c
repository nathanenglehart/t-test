/* Nathan Englehart (Summer, 2022) */

#include <stdio.h>
#include <math.h>

double two_sample(double x_bar_1, double x_bar_2, double s_1, double s_2, int n_1, int n_2) {

	/* Returns t value for two tailed t-test using given variables. */

	return (x_bar_1 - x_bar_2) / (sqrt((pow(s_1,2)/n_1-1) + ((pow(s_2,2)/n_2-1))));

}

int main() {

	/* Variables */

	double x_bar_1 = 3392.00;
	double x_bar_2 = 16610.86;
	double s_1 = 3848.102;
	double s_2 = 3725.971;
	int n_1 = 84;
	int n_2 = 21;

	double t = fabs(two_sample(x_bar_1, x_bar_2, s_1, s_2, n_1, n_2));

	printf("absolute t = %f.\n",t);
	printf("df = %d.\n",n_1 + n_2 - 2);

	return 0;

}
