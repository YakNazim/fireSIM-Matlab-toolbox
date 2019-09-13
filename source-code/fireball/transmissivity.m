function trs = transmissivity(Pow,RH,distance,D_max)
%% Summary : 
% transmissivity computes the transmissivity factor of heat 
%% Reference :  [Bagster & Pittblado 1989]  (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 104 C-2.47) 
%% Input parameters :
% Pow : saturation vapour pressure in the air in Pa
% RH : humidity ratio in [0-1]
% distance : of the target from the center of fireball
% D_max : max diameter of the fireball

%% Output parameters 
% trs : transmissivity factor
%% Code 
radius = D_max/2 ; 

    if ( distance<=radius )
        trs = 1 ; 
    else
        c7 = 2.02 ; 
        Pw = RH*Pow ; 
        trs = c7 * ((Pw*(distance-radius))^-0.09) ;
        trs = round(trs,2) ;
    end

end

