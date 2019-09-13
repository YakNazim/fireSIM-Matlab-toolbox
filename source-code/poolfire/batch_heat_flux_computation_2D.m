function [X,Y,heat_flux_batch2D] = batch_heat_flux_computation_2D(pool_diameter,Resolution,tilt,flame_len,RH,P_ow,SEP)
%batch_heat_flux_computation computes heat flux for various distances  
%    pool_diameter : m
%    Resolution : high : 500 - medium : 250 - low : 125
%    tilt : in dgrees
%    flame_len : m
%    RH : humidity ratio [0 1]
%    P_ow : saturation vapor pressure in Pa
%    SEP :  % Surface emitting power - kw/m2

radius = pool_diameter/2 ; 
%Resolution = 150 ; % too big 
max_distance = 10 * radius ;
step = max_distance / Resolution ; 

if(step<1) % step can't be less than 1 meter
    step = 1;
end

x =-max_distance:step:max_distance ;  
y =-max_distance:step:max_distance ;  
[X,Y] = meshgrid(x,y);
R = sqrt(X.^2 + Y.^2) ;
R = ceil(R) ; 

i = numel(x) ;
heat_flux_batch2D = ones(i); 

for c = 1:i
    for r = 1:i
        F =  view_factors_computation(tilt,flame_len,pool_diameter,R(r,c)) ;
        ATM_transmissivity = transm_ratio_computation(pool_diameter,R(r,c),RH,P_ow);
        heat_flux_batch2D(r,c) = heat_flux_solid_flame(SEP,F,ATM_transmissivity);
    end
end
 


end

