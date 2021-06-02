function [val,g,Q] = banana(x)

% banana valley of two variables

val = .5*((2*x(1)-x(2)*x(3)-1)^2+(1-x(1)+x(2)-exp(x(1)-x(3)))^2+(-x(1)-2*x(2)+3*x(3))^2);
if ( nargout > 1 )
 g =(1)*[2*(2*x(1)-x(2)*x(3)-1)+(-1-exp(x(1)-x(3)))*(1-x(1)+x(2)-exp(x(1)-x(3)))-(-x(1)-2*x(2)+3*x(3)),...
     -x(3)*(2*x(1)-x(2)*x(3)-1)+(1-x(1)+x(2)-exp(x(1)-x(3)))-2*(-x(1)-2*x(2)+3*x(3)), ...
     -x(2)*(2*x(1)-x(2)*x(3)-1)+exp(x(1)-x(3))*(1-x(1)+x(2)-exp(x(1)-x(3)))+3*(-x(1)-2*x(2)+3*x(3))]';
end
if ( nargout > 2 )
%  H(1,1) =    4-exp(x(1)-x(3))*(1-x(1)+x(2)-exp(x(1)-x(3)))+(1+exp(x(1)-x(3))).^2+1;
%  H(1,2) =    -2*x(3)-(1+exp(x(1)-x(3)))+2;
%  H(1,3) =    -2*x(2)+(exp(x(1)-x(3)))*(1-x(1)+x(2)-exp(x(1)-x(3)))-(exp(x(1)-x(3)))*(1+exp(x(1)-x(3)))-3;
%  H(2,1) =    -2*x(3)-(1+exp(x(1)-x(3)))+2 ;
%  H(2,2) =    (x(3)).^2+1+4 ;
%  H(2,3) =    -(2*x(1)-x(2)*x(3)-1)+x(2)*x(3)+exp(x(1)-x(3))-6; 
%  H(3,1) =    -2*x(2)+(exp(x(1)-x(3)))*(1-x(1)+x(2)-exp(x(1)-x(3)))+(exp(x(1)-x(3)))*(-1-exp(x(1)-x(3)))-3;
%  H(3,2) =    -(2*x(1)-x(2)*x(3)-1)+x(2)*x(3)+(exp(x(1)-x(3)))-6;
%  H(3,3) =     (x(2)).^2+(exp(x(1)-x(3)))*(1-x(1)+x(2)-exp(x(1)-x(3)))+(exp(x(1)-x(3))).^2+9;
 
 J= [2,-x(3),-x(2);
     -1-exp(x(1)-x(3)),1,exp(x(1)-x(3));
     -1,-2,3];
 Q= J'*J;
 y=1;
end

end