function SEP = SEP_computation(Psv,burning_rate,combustion_heat)
%% Summary : 
% SEP_computation computes the maximum surface emitting power of the fireball  
%% Reference : (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 102 C-2.41) 
%% Input parameters :
% Psv : vapour pressure inside the vessel in MPa
% burning_rate  %of flamable substance - kg/s
% combustion_heat : heat of combustion of the flamable substance (Kj/Kg)
%% Output parameters 
% SEP : surface emitting power in Kw/m² 

%% Code 
c6 = 0.00325 ; 
Fs = c6*((Psv*10^6)^0.32); % radiation fraction / TNO
SEP = Fs*burning_rate*combustion_heat ;


end

