function SEP = SEP_mudan( pool_diameter)
% SEP_large_diameter computes the actual surface emitting power 
% Relevant when pool diameter > 15 m
%  Mudan-Croce SEP method  (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 90) 
% Assumptions : 
% For oil products, the surface fraction that is covered by soot (s) was
% assumed to be 80% while the surface emitting power of soot (SEP_soot) was
% assumed to be equal to 20 kw/m2
%  [Hagglund & Person, 1976] 
% pool_diameter : [m] 
SEP_soot = 20 ; 
SEP = 140*exp(-0.12*pool_diameter)  + SEP_soot * (1-exp(-0.12*pool_diameter)) ; 
SEP = round(SEP,2);







end

