function SEP = SEP_std(radiation_fraction,flame_len, pool_diameter, burning_rate , comb_heat)
% SEP_small_diameter computes the actual surface emitting power with consideration to the presence of soot 
% General SEP method  (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 89) 
% 
% Assumptions : 
% For oil products, the surface fraction that is covered by soot (s) was
% assumed to be 80% while the surface emitting power of soot (SEP_soot) was
% assumed to be equal to 20 kw/m2
% However,  for very small pool diameters, it is considered that no smoke is formed  
%  [Hagglund & Person, 1976] 
% flame_len  : flame length (m) 
% pool_diameter : pool's diameter (m)
% burning_rate (kg/s) 
% comb_heat : heat of combustion (Kj/Kg) 

s = 0.8 ; 
SEP_soot = 20 ; 

SEP_max = (radiation_fraction * burning_rate * comb_heat) / ( 1 + ((4*flame_len) / (pool_diameter)) ); 

if(pool_diameter <= 2) 
    SEP = SEP_max;
else 
    SEP = SEP_max * (1-s) + SEP_soot *s ; 
end

SEP = round(SEP,2);

end

