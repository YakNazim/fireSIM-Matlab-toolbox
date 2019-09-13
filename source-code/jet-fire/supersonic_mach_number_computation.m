function mach = supersonic_mach_number_computation(Po,Pa,gamma)
%supersonic_mach_number_computation computes the supersonic mach number 
%% Reference
%  Fires, Explosions, and Toxic Gas Dispersions: Effects Calculation and
%  Risk Analysis, 2010, p108
%% input 
% Po : exit pressure at orifice - MPa 
% Pa : ambiant pressure in MPa  
% gamma : specific heat ratio (Cp/Cv) 
%  
%% output
%  mach mach number 
%% Code :
Po = Po*10^6 ; % to Pa 
Pa = Pa*10^6 ;

mach = sqrt((-2 + (gamma+1)*(Po/Pa)^((gamma-1)/gamma)) /(gamma-1)) ; 


end

