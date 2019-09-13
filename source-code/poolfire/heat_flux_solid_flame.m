function heat_flux =heat_flux_solid_flame(SEP,F,ATM_transmissivity)
%compute_heat_flux computes the heat flux in Kw/m2 
%  Solid flame model   (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 95) 


heat_flux = SEP*F*ATM_transmissivity ;

end

