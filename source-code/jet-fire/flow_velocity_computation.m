function uj = flow_velocity_computation(mach , gamma , To, molecular_weight)
%flow_velocity_computation computes the velocity of the flammable fuel gases in the expanding jet 
%% Reference
%  Fires, Explosions, and Toxic Gas Dispersions: Effects Calculation and
%  Risk Analysis, 2010, p108
%% input 
% mach : mach number
% gamma : specific heat ratio (Cp/Cv) 
% To : temperature at orifice - K
% molecular weight : of the gas, kg/mol
%% output
% uj : velocity of the flammable fuel gases in the expanding jet in m/s
%% Code : 
    R = 8.314 ;
    uj = mach *sqrt( gamma*To*R/molecular_weight ) ;

end

