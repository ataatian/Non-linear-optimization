clc
clear all
x0 = [0 ; 0 ];

t = 1.0;
itmax = 200;
tol = 1.0e-04;
[x,pointlist] = ConjGradHW7(@P7,x0,t,itmax,tol);

