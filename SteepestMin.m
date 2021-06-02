function [x,pointlist] = SteepestMin(func,x0,t,itmax,tol)

% Steepest decent with exact directional minimization
% No testing of erroneous input is performed

% func  -- name of function to minimize
% x0    -- starting point
% t     -- starting stepsize
% itmax -- maximum number of iterations
% tol   -- norm of gradient to stop

x= x0;
t0 = t;
iter = 0;
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
    
    if ( ( gn < tol) || (t0 == 0) ) 
        break;
    end
    
    [x,tau] = DirMin(func,x,-grad,-gn^2,val,t0/gn,tol);
    t0 = tau*gn;
    iter = iter + 1;
    pointlist = [pointlist ; transpose(x)];
end
end