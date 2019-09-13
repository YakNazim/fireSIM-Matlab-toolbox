function [P_level1_2d_batch , P_level2_2d_batch ,  P_level3_2d_batch] = batch_ppl_effect_computation_2D(Fk, X,Y,pool_diameter , fit_R_f_heatflux  ,fit_heatflux_f_R)
%batch_ppl_effect_computation_2D computes probabilities of injuries & death
% over a 2D mesh grid 
%   P_level1_2d_batch , P_level2_2d_batch ,  P_level3_2d_batch : level 1,
%   level 2 & death probability mesh 
% Fk : body coverage ratio 0-1
% X,Y : coordinates of the 2D mesh
% pool_diameter in meters
% fit_R_f_heatflux  fit object distance=f(heat flux) 
% fit_heatflux_f_R  fit object heatflux=f(distance)

R = sqrt(X.^2 + Y.^2) ;
R = ceil(R) ; 
i = length(R) ;
P_level1_2d_batch= ones(i); 
P_level2_2d_batch= ones(i); 
P_level3_2d_batch = ones(i); 

for c = 1:i
    for r = 1:i
    
    [P_level1_2d_batch(r,c) , P_level2_2d_batch(r,c) ,  P_level3_2d_batch(r,c)] = ppl_effect_computation(Fk, R(r,c), pool_diameter , fit_R_f_heatflux  ,fit_heatflux_f_R,-1) ; 

    end
end

end

