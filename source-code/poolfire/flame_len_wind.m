function flame_length = flame_len_wind ( pool_diameter , air_density , burning_rate , wind_vel )
%flame_len_wind computes the mean length of the flame in wind conditions and the dimensionless wind velocity 
% Pritchard-Binding Method   (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 86) 
% pool_diameter  % m 
% air_density  % kg/m3 
% burning_rate % kg/s
% wind_vel % m/s

g = 9.81 ; 

 

wind_vel_sharp = wind_vel * ( ( (g * burning_rate * pool_diameter ) / pool_diameter ) ^ (-1/3) ) ;
if ( wind_vel_sharp < 1) 
    wind_vel_sharp = 1 ; 
end

flame_length = 10.615 * pool_diameter * (wind_vel_sharp^(-0.03)) * ( (burning_rate/(air_density * sqrt( g * pool_diameter ))) ^ 0.305) ;

wind_vel_sharp = round(wind_vel_sharp,2) ;
flame_length = round(flame_length,2) ; 


end

