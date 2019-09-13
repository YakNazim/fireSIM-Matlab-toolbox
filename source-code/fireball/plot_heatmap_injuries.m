function plot_heatmap_injuries(X,Y,P_level1_2d_batch , P_level2_2d_batch ,  P_level3_2d_batch)


f1 = figure('Name','Probability of level 1 skin burn');
set(gcf, 'renderer', 'zbuffer');
b1 = pcolor(X,Y,P_level1_2d_batch) ;
b1.FaceColor = 'interp';
c = pink(5);
c = flipud(c);
colormap(f1,c); % up to 64
shading interp; % or flat ?
hcb1 = colorbar('location','eastoutside');
title(hcb1,'Probability level');
caxis([0  1]);
set(gca, 'Layer', 'top')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.XColor = 'red' ;
ax.YColor = 'red' ;
xlabel('X [m] from center of fireball') ;
ylabel('Y [m] from center of fireball') ;
str = strcat('Probability of level 1 skin burn');
title(str);
set(b1, 'ZData', get(b1,'CData'));
grid on ;
grid minor ;


f2 = figure('Name','Probability of level 2 skin burn');
set(gcf, 'renderer', 'zbuffer');
b2 = pcolor(X,Y,P_level2_2d_batch) ;
b2.FaceColor = 'interp';
c = pink(5);
c = flipud(c);
colormap(f2,c); % up to 64
shading interp; % or flat ?
hcb2 = colorbar('location','eastoutside');
title(hcb2,'Probability level');
caxis([0  1]);
set(gca, 'Layer', 'top')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.XColor = 'red' ;
ax.YColor = 'red' ;
xlabel('X [m] from center of fireball') ;
ylabel('Y [m] from center of fireball') ;
str = strcat('Probability of level 2 skin burn');
title(str);
set(b2, 'ZData', get(b2,'CData'));
grid on ;
grid minor ;



f3 = figure('Name','Probability of death');
set(gcf, 'renderer', 'zbuffer');
b3 = pcolor(X,Y,P_level3_2d_batch) ;
b3.FaceColor = 'interp';
c = gray(5);
c = flipud(c);
colormap(f3,c); % up to 64
shading interp; % or flat ?
hcb3 = colorbar('location','eastoutside');
title(hcb3,'Probability level');
caxis([0  1]);
set(gca, 'Layer', 'top')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.XColor = 'red' ;
ax.YColor = 'red' ;
xlabel('X [m] from center of fireball') ;
ylabel('Y [m] from center of fireball') ;
str = strcat('Probability of death');
title(str);
set(b3, 'ZData', get(b3,'CData'));
grid on ;
grid minor ;
 
end

