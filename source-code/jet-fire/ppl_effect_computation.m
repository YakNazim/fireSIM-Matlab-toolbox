function [P_level1,P_level2, P_level3] = ppl_effect_computation(Fk , pos, fire_diameter , distance_from_heatflux_fit  ,heatflux_from_distance_fit,hfx)
%% ppl_effect_computation computes probabilities of harm to people 
% According to the method described in (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 127) 
%%   P_level1 : level 1 burn  P_level2 : level 2 burn P_level3 : death
% Fk : impact of clothes : 1 -> no impact / .95-> summer (small coverage of skin) /
% 0.14 -> winter (large coverage)
% pos : position of the target in reference to the center of flame (m)
% pool_diameter : in meter
% fit_R_f_heatflux  : fit object of R=f(heatflux)
% fit_heatflux_f_R : fit object of heatflux=f(R) ;
%hfx : in case heat flux of target is not computed in the
%fit object (target elevated  from ground), provide the value or -1 
%%
 
%% get the safe distance ( distance from center where heat flux <= 1 kw/m2)
dis = return_distance(1 , distance_from_heatflux_fit) ;

%% compute the exposure time 
tr = 5; % reaction time 5 s
u = 4; % escape velocity m/s 
x0 = dis - fire_diameter / 2 ; % distance between safe area & flame surface
t_eff = round( tr + ((x0 - ( pos - fire_diameter / 2 ) ) / u ) , 1);
if(t_eff < 0) 
    t_eff = 0.0001 ;
end

%% compute the dose 

% first get the heatflux at the target's location 
if (hfx == -1)
    hfx = round(return_heatflux(pos,heatflux_from_distance_fit),1) ;
end
D = t_eff * (hfx*10^3)^(4/3) ;

%% compute probabilities of death / 2nd & 1rd  degree burn
c = [-39.83 3.0186 ; -43.14 3.0186 ;-36.38 2.56 ];
% 1st line : 1st degree burn 
% 2nd line : 2nd degree 
% 3rd line : death 
%disp(  t_eff ) ;
P_level1 = round(Fk * 0.5 * ( 1 + erf (  ( c(1,1) + c(1,2)*log(D) -5)  /sqrt(2)  ) ) ,4);
P_level2 = round(Fk * 0.5 * ( 1 + erf (  ( c(2,1) + c(2,2)*log(D) -5)  /sqrt(2)  ) ) ,4); 
P_level3 = round(Fk * 0.5 * ( 1 + erf (  ( c(3,1) + c(3,2)*log(D) -5)  /sqrt(2)  ) ) ,4) ;
 

end

