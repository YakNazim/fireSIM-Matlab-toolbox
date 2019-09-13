function burning_rate = burn_rate_liq_hydrocarbon(eq_burn_rate, k_beta, pool_diameter )
%burn_rate_liq_hydrocarbon computes burning rate of liquid hydrocarbons 
%  Zabetakis-Burgess Method (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 81) 
% eq_burn_rate  % kg/m2/s
% k_beta  % 1/m 
% pool_diameter  % m 

burning_rate = eq_burn_rate * (1 - exp(-k_beta * pool_diameter)) ;
burning_rate = round(burning_rate,2) ;


end

