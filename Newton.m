function [x,pointlist] = Newton(func,x0,t,itmax,tol)

% Newton's method with two-slope test
% No testing of erroneous input is performed

% func  -- name of function to minimize
% x0    -- starting point
% t     -- starting stepsize
% itmax -- maximum number of iterations
% tol   -- norm of gradient to stop

x= x0;
iter = 0;
alpha = 0.3;
tau = t;
opts.SYM = true;
verysmall = 1.0e-10;

if (nargout > 1)
    pointlist = transpose(x);
end
while ( iter < itmax )
    [val, grad, H] = func(x);
    gn = norm(grad);
    
    fprintf('it=%3d  f=%.5f  |grad f|=%.5f',iter,val,gn);
    fprintf('  x =');
    for j=1:length(x)
       fprintf(' % .5f',x(j));
    end
    fprintf('\n');
    
    if ( gn < tol ) 
        break;
    end
       
    [d,kappa] = linsolve(H,-grad,opts);
    if ( kappa < verysmall )
        s = 0;
    else
        s = dot(grad,d);
    end
     if ( (s >= 0) || (tau == 0) )      
        d = -grad;
        s = -gn^2;
        t0 = t/gn;
        steepest = 1;
    else
        t0 = 1;
        steepest = 0;
    end
    
    [x,tau] = TwoSlope(func,x,d,s,val,t0,alpha);
    if ( steepest && (tau==0) )
        break
    end
    if (nargout > 1)
        pointlist = [pointlist ; transpose(x)];
    end
    iter = iter + 1;  
end
end
    