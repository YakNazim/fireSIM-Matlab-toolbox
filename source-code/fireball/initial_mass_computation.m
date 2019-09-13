function initial_mass = initial_mass_computation(gas_frac,vessel_volume,density)
%% Summary : 
% initial_mass_computation computes the initial mass of flamable cloud
%% Reference :  (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 100 C-2.33) 
%% Input parameters :
% gas_frac : fraction of gas inside the vessel [0-1]
% vessel_volume : initial TOTAL volume of the vessel - m3
% density : of flamable substance - kg/m3
%% Output parameters
% initial_mass : total mass of flamable cloud (kg)

initial_mass = gas_frac* vessel_volume *density ;




end

