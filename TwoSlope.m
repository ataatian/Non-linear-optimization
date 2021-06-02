function [x,t] = TwoSlope(func,x0,d,s,val0,t0,alpha)

% Two-slope line search with bisection
% No testing of erroneous input is performed

% func  -- the name of the objective function
% x0    -- starting point
% d     -- direction
% s     -- derivative of func at x0 in direction d (must be negative)
% val0  -- value of func at x0
% t0    -- initial steplength
% alpha -- two-slope test parameter (must be between 0 and 0.5)

tR = 0;
tL = 0;
t = t0;
iter = 0;
itmax = 20;
while ( iter < itmax )
    x = x0 + t*d;
    val = func(x);
    if ( val > val0 + alpha*t*s )
        tR = t;
    elseif ( val < val0 + (1-alpha)*t*s )
        tL = t;
    else
        break;
    end
    if ( tR > 0 ) 
      t = (tL+tR)/2.0;
    else
      t = 3*t;
    end
    iter = iter + 1;
end
if (val >= val0)
    x = x0;
    t = 0;
end
end