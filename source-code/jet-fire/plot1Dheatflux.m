function plot1Dheatflux(R_1D,heat_flux_batch1D,interpolation_str)
%plot1Dheatflux plots heat flux in funciton of distance from pool center 

 F2 = figure('Name','Heatflux vs distance') ;
 plot(R_1D,heat_flux_batch1D);

 xlabel ('Distance from flame center [m]') ; 
 ylabel ('Heat flux [kw/m2]') ; 
 
str = strcat('Heat flux distribution ');
title(str);

 title(str) ; 
 grid on ; 
 grid minor ;
 
    dim = [0.2 0.5 0.3 0.3];
    annotation('textbox',dim,'String',interpolation_str,'FitBoxToText','on');
 
end
