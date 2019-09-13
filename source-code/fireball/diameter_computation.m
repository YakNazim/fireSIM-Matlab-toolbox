function [D_t,t] = diameter_computation(initial_mass,t_max,D_max)
%% Summary : 
% diameter_computation computes the diameter of the fireball over time 
%% Reference : (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 100 C-2.34) 
%% Input parameters :
% initial_mass : total mass of flamable cloud (kg)
% t_max : duration of the fireball (in s)

%% Output parameters 
% D_t : array of diameter over time 
% t : array of time 
%% Code 

c1 = 8.664 ;
step = t_max / 10;
t = 0:step:t_max ; 
D_t = zeros(1,length(t));
for i=1:length(t)
    if(t(i)<=(t_max*1/3))
        D_t(i) = c1.*(initial_mass^(1/4)).*(t(i).^1/3) ; 
    else
        D_t(i) = D_max ; 
    end
    
end
 

