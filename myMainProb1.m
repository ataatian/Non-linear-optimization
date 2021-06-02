clc
clear all
x0 = [-1 ; -1; -1 ];

t = 1.0;
itmax = 200;
tol = 1.0e-04;
% [x,pointlist] = ConjGrad(@P1,x0,t,itmax,tol);

% [x,pointlist] = Newton(@P1GaussN,x0,t,itmax,tol); %this is Gauss-Newton method

[x,pointlist] = SteepestTwoSlope(@P1,x0,t,itmax,tol);
% [x,pointlist] = Newton(@P1,x0,t,itmax,tol);