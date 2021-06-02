function [val,g,H] = banana(x)

% banana valley of two variables

a = 0.01;
val = (x(2) - x(1)^2)^2 + a*(x(1)-1)^2;
if ( nargout > 1 )
    g =  [ -4*(x(2)-x(1)^2)*x(1) + 2*a*(x(1)-1); ...
            2*(x(2)-x(1)^2)];
end
if ( nargout > 2 )
    H(1,1) = -4*x(2) + 12*x(1)^2 + 2*a;
    H(1,2) = -4*x(1);
    H(2,1) = H(1,2);
    H(2,2) = 2;
end