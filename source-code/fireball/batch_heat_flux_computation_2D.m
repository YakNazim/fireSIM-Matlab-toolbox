function [X,Y,heat_flux_batch2D] = batch_heat_flux_computation_2D(D_max,Resolution,fireball_height,Pow,RH,SEP )
%batch_heat_flux_computation computes heat flux for various distances  
 
radius = D_max/2 ; 
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
        F12 =  view_factor_computation(D_max,fireball_height,R(r,c)) ;
        trs = transmissivity(Pow,RH,R(r,c),D_max);
        heat_flux_batch2D(r,c) = single_heatflux_computation(SEP,F12,trs);
         
     end
end
 


end

