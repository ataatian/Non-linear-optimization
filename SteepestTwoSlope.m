function [x,pointlist] = SteepestTwoSlope(func,x0,t,itmax,tol)

% Steepest decent with two-slope test
% No testing of erroneous input is performed

% func  -- name of function to minimize
% x0    -- starting point
% t     -- starting stepsize
% itmax -- maximum number of iterations
% tol   -- norm of gradient to stop

x= x0;
iter = 0;
alpha = 0.2;
pointlist = transpose(x);
while ( iter < itmax )
    [val,grad] = func(x);
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
    t0 = t;
    [x,tau] = TwoSlope(func,x,-grad,-gn^2,val,t0/gn,alpha);
    t0 = tau*gn;
    pointlist = [pointlist ; transpose(x)];
    iter = iter + 1;
end
end  