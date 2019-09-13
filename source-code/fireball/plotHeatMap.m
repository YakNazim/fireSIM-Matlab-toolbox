function plotHeatMap(X,Y,heat_flux_batch2D)
%plotHeatMap Plots a 2D map of the distribution of heat flux
 

f = figure('Name','Heatflux map');
set(gcf, 'renderer', 'zbuffer');

b = pcolor(X,Y,heat_flux_batch2D) ;
b.FaceColor = 'interp';
colormap(f,jet(20)); % up to 64
shading interp; % or flat ?
 
hcb = colorbar('location','eastoutside');
title(hcb,'Heat flux [Kw/m2]');
caxis([-1  max(heat_flux_batch2D(:))]);

set(gca, 'Layer', 'top')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.XColor = 'white' ;
ax.YColor = 'white' ;
xlabel('X [m] from center of fireball') ;
ylabel('Y [m] from center of fireball') ;
str = strcat('Heat flux distribution ');
title(str);

set(b, 'ZData', get(b,'CData'));
 

grid on ;
grid minor ;


end

