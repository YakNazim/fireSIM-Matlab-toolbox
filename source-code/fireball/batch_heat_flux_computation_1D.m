function [R_1D,heat_flux_batch1D] = batch_heat_flux_computation_1D(D_max,Resolution,fireball_height,Pow,RH,SEP )
%batch_heat_flux_computation computes heat flux for various distances  


radius = D_max/2 ; 
max_distance = 10 * radius ;
%Res = Resolution ;
Res = 500 ;
step = max_distance / Res ; 

if(step<1) % step can't be less than 1 meter
    step = 1;
end

R_1D = 0:step:max_distance ;
i = numel(R_1D) ;
heat_flux_batch1D = ones(i,1); 

    for c = 1:i
            F12 =   view_factor_computation(D_max,fireball_height,R_1D(c)) ;
            trs = transmissivity(Pow,RH,R_1D(c),D_max);
            heat_flux_batch1D(c) = single_heatflux_computation(SEP,F12,trs);
    end
end

