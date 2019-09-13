function ATM_transmissivity = transm_ratio_computation (pool_diameter,X_d,RH,P_ow)
%transm_ratio_computation computes the  the atmospheric transmissivity
%  [Bagster & Pittblado method  (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 95) 

% pool_diameter [m]
% X_d : distance from the center of the fire 
% RH : % humidity fraction [0-1]
% P_ow % saturation vapor pressure in Pa ;

R = pool_diameter / 2 ; 

if (X_d <= R)
   ATM_transmissivity = 1 ; 
   
else
    Pw = RH * P_ow ; 
    ATM_transmissivity = 2.02 * ((  Pw*( X_d - R  )  )^-0.09) ;
    ATM_transmissivity = round(ATM_transmissivity,2) ;
end

end

