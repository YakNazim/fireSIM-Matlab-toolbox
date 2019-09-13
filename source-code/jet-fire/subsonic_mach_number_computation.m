function mach = subsonic_mach_number_computation(uo,gamma)
%supersonic_mach_number_computation computes the supersonic mach number 
%% Reference
%  Fires, Explosions, and Toxic Gas Dispersions: Effects Calculation and
%  Risk Analysis, 2010, p108
%% input 
% uo: jet velocity at orifice - m/s
% gamma : specific heat ratio (Cp/Cv) 
%% output
%  mach mach number 
%% Code :

gamma_1 = gamma-1 ; 
mach = sqrt((-1 + sqrt(1+2*(uo^2)*gamma_1)) / gamma_1) ;

 

end

