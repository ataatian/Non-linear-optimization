clc
clear all
x0 = [-1 ; -1; -1 ];

t = 1.0;
itmax = 200;
tol = 1.0e-04;
% [x,pointlist] = ConjGrad(@P1,x0,t,itmax,tol);
% [x,pointlist] = SteepestTwoSlope(@P1,x0,t,itmax,tol);
[x,pointlist] = Newton(@P1GaussN,x0,t,itmax,tol);
% [x,pointlist] = SteepestMin(@P1,x0,t,itmax,tol);
break
myLable= 'Newton Method, initial:(10 ; -3; 1)';

for i= 2:size(pointlist,1)
    xNR(i)= norm(pointlist(i,:)-[1,1,1])/norm(pointlist(i-1,:)-[1,1,1]);
    fNR(i)= P1(pointlist(i,:))/P1(pointlist(i-1,:));
end
figure(1)
plot(xNR)
axis([0 100,0 2])
title(['x ratio- ',myLable])
 

figure(2)
plot(fNR)
axis([0 100,0 2])
title(['f(x) ratio- ',myLable])