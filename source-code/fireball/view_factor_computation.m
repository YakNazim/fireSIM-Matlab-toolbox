function F12 = view_factor_computation(D_max,fireball_height,distance)
%% Summary : 
% view_factor_computation computes the view factor for a given distance  
%% Reference : (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 103 C-2.44) 
%% Input parameters :
% D_max : max diameter of the fireball in meters
% fireball_height : elevation from the ground (=D_max/2)
% distance : of the target from the center of the fireball
%% Output parameters 
% F12 : view factor of the target 
%% Code 
radius = D_max/2 ;
X = sqrt(fireball_height^2+distance^2);
F12=((radius/X)^2);

F12 = round(F12,3);



end

