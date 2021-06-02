clc
clear all
n=500;
x0 = (zeros(2*n,1))';

t = 1.0;
itmax = 200;
tol = 1.0e-04;

[x,pointlist] = ConjGrad2a(@Pn2,x0,t,itmax,tol);
x

[xpre,pointlist] = ConjGrad2b(@Pn2,x0,t,itmax,tol);
xpre

norm(x-xpre)