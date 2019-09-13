function [R,heat_flux_batch1D] = batch_heat_flux_computation_1D(pool_diameter,Resolution,tilt,flame_len,RH,P_ow,SEP)
%batch_heat_flux_computation computes heat flux for various distances in one direction 
%    pool_diameter : m
%    Resolution : high : 500 - medium : 250 - low : 125
%    tilt : in dgrees
%    flame_len : m
%    RH : humidity ratio [0 1]
%    P_ow : saturation vapor pressure in Pa
%    SEP :  % Surface emitting power - kw/m2

 
radius = pool_diameter/2 ; 
max_distance = 10 * radius ;
step = max_distance / Resolution ; 

if(step<1) % step can't be less than 1 meter
    step = 1;
end

R = 0:step:max_distance ;

i = numel(R) ;
heat_flux_batch1D = ones(i,1); 

for c = 1:i
        F =  view_factors_computation(tilt,flame_len,pool_diameter,R(c)) ;
        ATM_transmissivity = transm_ratio_computation(pool_diameter,R(c),RH,P_ow);
        heat_flux_batch1D(c) = heat_flux_solid_flame(SEP,F,ATM_transmissivity);
    
end
 


end


