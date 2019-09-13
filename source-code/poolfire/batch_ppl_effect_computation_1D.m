function [P_level1_1d_batch,P_level2_1d_batch, P_level3_1d_batch ] = batch_ppl_effect_computation_1D(Fk,R_1D,  pool_diameter , fit_R_f_heatflux  ,fit_heatflux_f_R)

len = length(R_1D) ; 
P_level1_1d_batch = ones(len,1) ;
P_level2_1d_batch = ones(len,1) ;
P_level3_1d_batch = ones(len,1) ;


for i=1:len
   pos = round(R_1D(i),1) ;
   [P_level1_1d_batch(i) , P_level2_1d_batch(i) ,  P_level3_1d_batch(i)] = ppl_effect_computation(Fk, pos, pool_diameter , fit_R_f_heatflux  ,fit_heatflux_f_R,-1) ; 
    
end

 

end


