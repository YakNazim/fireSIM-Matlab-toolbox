function htfx = single_heatflux_computation(SEP,F12,trs)
%% Summary : 
% single_heatflux_computation computes the heatflux 
%% Reference : (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 104 C-2.46) 
%% Input parameters :
% SEP : surface emitting power in Kw/m² 
% F12 : view factor of the target 
% trs : transmissivity factor
%% Output parameters 
% htfx : heatflux in kw/m² 
%% Code 

htfx = SEP*F12*trs; 

end