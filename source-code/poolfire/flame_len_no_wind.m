function flame_length = flame_len_no_wind ( pool_diameter , air_density , burning_rate  )
%flame_len_no_wind computes the mean length of the flame in no wind conditions 
% Thomas Method  (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 86) 
% pool_diameter  % m 
% air_density  % kg/m3 
% burning_rate % kg/s

g = 9.81 ; 
flame_length = 42 * pool_diameter * (burning_rate/(air_density * sqrt( g * pool_diameter ))) ^ 0.61 ;
flame_length = round(flame_length,2) ;

end

