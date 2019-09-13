function SEP = SEP_computation(uj,combustion_heat, mass_flow , A )
%SEP_computation computes the  SurfaceF12 Emitting Power 
%% Reference
%  Fires, Explosions, and Toxic Gas Dispersions: Effects Calculation and
%  Risk Analysis, 2010, p117
%% input 
% uj : velocity of the flammable fuel gases in the expanding jet in m/s
% combustion_heat : of flamable substance - KJ/Kg
% mass_flow : of fuel gas kg/s 
% A :  surface area of frustum including end discs, m²
%% output
% SEP : Surface Emitting Power - kW/m²
%% Code : 


Fs = 0.21 * exp(-0.00323*uj) + 0.11;
SEP = Fs * combustion_heat * mass_flow / A ;



end

