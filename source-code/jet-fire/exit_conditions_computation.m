function [To,Po,uo] = exit_conditions_computation(Ps,Ts,Pa,gamma,molecular_weight,mass_flow,d0)
%exit_conditions_computation computes the exit temperatrue & pressure & jet velocity at
%the orifice
%  Fires, Explosions, and Toxic Gas Dispersions: Effects Calculation and
%  Risk Analysis, 2010, p108
%% input 
%  Ps : initial pressure of vessel - MPa
%  Ts : initial temperatuer of vessel - K
%  Pa : ambiant pressure in MPa
%  gamma : specific heat ratio (Cp/Cv) 
%  molecular_weight of the gas, kg/mol
%  mass_flow of fuel gas - if not available : mass_flow = -1 
%  d0 : hole diameter in [mm]
%% output
%  To : temperature at orifice - K 
%  Po : exit pressure at orifice - MPa
%  uo : jet velocity at orifice - m/s - u_o=-1 if mass_flow not provided
%% Code :

R = 8.314 ;  
Po = Ps * ((2/(gamma+1))^(gamma/(gamma-1))) ;
To = Ts* ( (Pa/Ps)^((gamma-1)/gamma));

uo = -1 ;
if (d0 ~= -1)

    d0 = d0 * 10^-3  ; 
    Pa = Pa*10^6 ;
    uo = (mass_flow * 4 /(pi*(d0)^2))*(1/(Pa))*sqrt(R*Ts/(gamma*molecular_weight));
end 


end

