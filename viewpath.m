function viewpath(f,path,myLable)

% Envision the path of points on the contour map of a function
% We assume path has two colums; each row corresponds to a point
% along the path.

hold off

fineness = 100;
contours = 10;

pmin = min(path);
pmax = max(path);
prange = pmax - pmin;
range = 1.2*max(prange);
pmax = pmax + 0.5*(range - prange);
pmin = pmin - 0.5*(range - prange);

delta = (pmax-pmin)/fineness;

[gridx,gridy] = meshgrid(pmin(1):delta(1):pmax(1),pmin(2):delta(2):pmax(2));
gridf = zeros(size(gridx));
for i=1:size(gridf,1)
    for j=1:size(gridf,2)
        gridf(i,j) = f([gridx(i,j) gridy(i,j)]);
    end
end

vmax = f(path(1,:));
vmin = f(path(size(path,1),:));
vtable = vmin: (vmax-vmin)/contours : vmax;

contour(gridx,gridy,gridf,vtable);
% contour(gridx,gridy,gridf,vtable,'ShowText','on');

hold on

plot(path(:,1),path(:,2),'-ok','MarkerSize',5,'MarkerFaceColor','r','LineWidth',2);
title(myLable);
end