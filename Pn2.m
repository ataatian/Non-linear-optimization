function [val,g] = banana(x)

% banana valley of two variables
n= size(x,2)/2;
c1= .5*dot([1:2*n]',(x.^2));
c2= dot(ones(2*n,1)',x);
c3= 0;
for i=2:(2*n)
    c3=c3+ (.25*(x(i)+x(i-1))^2+(x(i)-x(i-1))^2);
end

val = c1-c2+c3+(x(2*n)-x(1))^2;
if ( nargout > 1 )
%     g =  [ -4*(x(2)-x(1)^2)*x(1) + 2*a*(x(1)-1); ...
%             2*(x(2)-x(1)^2)];
    for i=2:(2*n-1)
        g(i)= i*x(i)-1+.5*(x(i+1)+2*x(i)+x(i-1))+2*(2*x(i)-x(i-1)-x(i+1));
    end
    g(1)= x(1)-1+.5*(x(2)+x(1))-2*(x(2)-x(1))-2*(x(2*n)-x(1));
    g(2*n)= 2*n*x(2*n)-1+.5*(x(2*n)+x(2*n-1))+2*(x(2*n)-x(2*n-1))+2*(x(2*n)-x(1));
end
% if ( nargout > 2 )
%     H(1,1) = -4*x(2) + 12*x(1)^2 + 2*a;
%     H(1,2) = -4*x(1);
%     H(2,1) = H(1,2);
%     H(2,2) = 2;
% end
end