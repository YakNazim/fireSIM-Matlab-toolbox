function trs = transmissivity(Pow,RH,distance,W1,W2)
%% Summary : 
% transmissivity computes the transmissivity factor of heat 
%% Reference :  [Bagster & Pittblado 1989]  (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 104 C-2.47) 
%% Input parameters :
% Pow : saturation vapour pressure in the air in Pa
% RH : humidity ratio in [0-1]
% distance : of the target from the center of fireball
% W1 :  frustum base width - m 
% W2 :   frustum tip width - m 
%% Output parameters 
% trs : transmissivity factor
%% Code 
radius = (W1+W2)/4 ; 

    if ( distance<=radius )
        trs = 1 ; 
    else
        c7 = 2.02 ; 
        Pw = RH*Pow ; 
        trs = c7 * ((Pw*(distance-radius))^-0.09) ;
        trs = round(trs,2) ;
    end

end