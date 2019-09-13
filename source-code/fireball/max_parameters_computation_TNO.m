function [D_max,t_max] = max_parameters_computation_TNO(initial_mass)
%% Summary : 
% max_parameters_computation_TNO computes the max diameter & duration of
% the fireball
%% Reference : TNO Method (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 100 C-2.35-2.36) 
%% Input parameters :
% initial_mass : total mass of flamable cloud (kg)
%% Output parameters 
% D_max : max diameter of the fireball after 1/3 of its duration (in Kg)
% t_max : duration of the fireball (in s)
%% Code 

c4 = 6.48 ; 
c5 = 0.852 ; 
D_max = round(c4*(initial_mass^0.325),1)  ; 
t_max = round(c5*(initial_mass^0.26),1)  ; 

end

