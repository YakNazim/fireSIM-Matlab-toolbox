function burning_rate = burning_rate_computation(D_max,t_max,initial_mass)
%% Summary : 
% burning_rate_computation computes the burning rate of the fireball
%% Reference :  (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 100 C-2.33) 
%% Input parameters :
% D_max : % max diameter of the fireball after 1/3 of its duration (in Kg)
% t_max : % duration of the fireball (in s)
% initial_mass : % total mass of flamable cloud (kg)
%% Output parameters
% burning_rate : of flamable substance - kg/s

burning_rate = initial_mass / ((0.888*pi*D_max^2)*t_max) ;


end

