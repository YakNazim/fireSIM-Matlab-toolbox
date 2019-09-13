function [R_1D,heat_flux_batch1D] = batch_heat_flux_computation_1D(SEP,Rl,Resolution, b,teta_jv, alpha, Pow,RH ,W1,W2 )
%batch_heat_flux_computation computes heat flux for various distances  


 
max_distance = 5 * Rl ;
Res = Resolution ;
step = max_distance / Res ; 

if(step<1) % step can't be less than 1 meter
    step = 1;
end

R_1D = 0:step:max_distance ;
i = numel(R_1D) ;
heat_flux_batch1D = ones(i,1); 

    for c = 1:i
            F12 =     v_factor(b,teta_jv,R_1D(c),alpha,Rl,W1,W2);
            trs = transmissivity(Pow,RH,R_1D(c),W1,W2);
            heat_flux_batch1D(c) = single_heatflux_computation(SEP,F12,trs);
    end
end
