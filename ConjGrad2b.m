function [x,pointlist] = ConjGrad(func,x0,t,itmax,tol)

% The conjugate gradient method
% No testing of erroneous input is performed

% func  -- name of function to minimize
% x0    -- starting point
% t     -- starting stepsize
% itmax -- maximum number of iterations
% tol   -- norm of gradient to stop
V= diag(1./[1:size(x0,2)]); %Matrix of Pre-conditioning
small = 1.0e-10;
big = 1.0e10;
x= x0;
t0 = t;
n= length(x);
cycmax = min(10, n-1);
iter = 0;
cycle = 0;
if (nargout > 1)
    pointlist = transpose(x);
end
while ( iter < itmax )
    [val,grad] = func(x);
    gn = dot(grad,grad);
    
    fprintf('it=%3d  f=%.5f  |grad f|=%.5f',iter,val,sqrt(gn));
%     fprintf('  x =');
%     for j=1:n
%        fprintf(' % .5f',x(j));
%     end
    fprintf('\n');
    
    if ( gn < tol^2 ) 
        break;
    end
    if ( cycle == 0 )
        d = (-V*grad')';
        s = -gn;
    else
        alpha = dot((V*(grad-gold)')',grad)/dot(gold,(V*gold')');
        d = -(V*grad')' + alpha*dold;
        s = dot(d,grad);
        if ( s >= -tol^2 ) 
            d = -(V*grad')';
            s = -gn;
            cycle = 0;
        end
    end
    dold = d;
%     gnold = gn;
    gold = grad;
    if ( t0 <= small )
        t0 = t;
    end
    toldir = tol*norm(d);
    [x,t0] = DirMin(func,x,d,s,val,t0/norm(d),toldir);
   
    if ( (cycle==0) && (t0==0) )
        break;
    end
    iter = iter + 1;
    if ( (cycle==cycmax) || (t0==0) )
        cycle = 0;
    else
        cycle = cycle + 1;
    end
    t0 = t0*norm(d);
    if (nargout > 1)
        pointlist = [pointlist ; transpose(x)];
    end
end
end