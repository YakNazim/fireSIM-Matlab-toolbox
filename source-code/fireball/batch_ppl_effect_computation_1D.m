function [P_level1_1d_batch,P_level2_1d_batch, P_level3_1d_batch ] = batch_ppl_effect_computation_1D(t_max,Fk,R_1D,  D_max , distance_from_heatflux_fit  ,heatflux_from_distance_fit)

len = length(R_1D) ; 
P_level1_1d_batch = ones(len,1) ;
P_level2_1d_batch = ones(len,1) ;
P_level3_1d_batch = ones(len,1) ;


for i=1:len
   pos = round(R_1D(i),1) ;
   [P_level1_1d_batch(i) , P_level2_1d_batch(i) ,  P_level3_1d_batch(i)] = ppl_effect_computation(t_max,Fk , pos, D_max , distance_from_heatflux_fit  ,heatflux_from_distance_fit,-1);
    
end

 

end


