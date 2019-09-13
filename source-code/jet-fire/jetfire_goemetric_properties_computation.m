function [Ds,Lb,Lbo,alpha,B,phi,Rl,W1,W2,A] = jetfire_goemetric_properties_computation(molecular_weight_air,mass_flow,air_density,uj,uw,teta_jv,molecular_weight,To,Ta)
%jetfire_dimension_computation computes flame geometric properties   
%% Reference
%  Fires, Explosions, and Toxic Gas Dispersions: Effects Calculation and
%  Risk Analysis, 2010, p110
%% input 
% density : of flamable substance - kg/m3
% mass_flow :  of fuel gas kg/s 
% air_density : desntity of ambiant aire - kg/m3 
% uj : velocity of the flammable fuel gases in the expanding jet in m/s
% uw : wind speed - m/s 
% teta_jv :  the angle between the axis of the hole and the horizontal axis
% in the direction of the wind (in degrees) 
% molecular_weight : molecular weight of the fuel - kg/mol
% molecular_weight_air : molecular weight of air - kg/mol
%  To : temperature at orifice - K 
% Ta : ambiant temperatrue 

%% output
% Ds : the diameter of a hypothetical nozzle through which flows fuel in
% meters 
% Lb : length of the flame  in meters 
% Lbo :
% alpha : in degrees- angle between the axis of the hole and the axis of the flame
% b : lift-off from ground (meters)
% phi : angle between orifice axis &  center of frustum tip - degrees 
% Rl : length of the frustum - in meters 
% W1 :  frustum base width - m 
% W2 :   frustum tip width - m 
% A :  surface area of frustum including end discs, m² 

%% Code : 

%%
%%
Ds = sqrt(4*mass_flow/(pi*air_density*uj));

%%
g = 9.81 ; 
w = molecular_weight / (15.816*molecular_weight+0.0395);
a = 0.024*((g*Ds/(uj^2))^(1/3)) ; 
b = 0.2 ; 
c = (2.85/w)^(2/3) ;

options = optimset('Display','off');

Y=round(max(fsolve(@(y) a.*y.^(5/3) + b.*y.^(2/3)-c,0,options)),2);

Lbo = Y*Ds ; 

Lb = Lbo*(0.51*exp(-0.4*uw)+0.49)*(1-0.00607*(teta_jv-90)) ;

%% 
a = Ds^2 * uj^2 ; 
b = (g/a)^(1/3) ; 
Ri =  Lbo * b ; % richardson number 
r = uw/uj ; % buoyancy effect 

if (r <= 0.05) 
    alpha = (8000*r+Ri*(teta_jv-90)*(1-exp(-25.6*r))) / Ri ; 
else    
    alpha = (1.334+1.726*sqrt(r-0.026) + Ri*(teta_jv-90)*(1-exp(-25.6*r))) / Ri ; 
end

%% 
K = 0.187*exp(-20*r)+0.015; 
if (alpha == 0) % no wind conditions 
 B = 0.2 * Lb ;   
    
elseif (alpha == 180)  % strong wind 
 B = 0.015 * Lb ; 
    
else
    
    B = Lb * sind(K*alpha)/sind(alpha) ;
    
end

phi = alpha * (1-K);
%% 
Rl = sqrt(Lb^2  - (B^2)*((sind(alpha))^2)) - B*cosd(alpha) ;

%% 

C = 1000*exp(-100*r) + 0.8 ; 
a = Ds^2 * uj^2 ; 
b = (g/a)^(1/3) ; 
Ri_d =  Ds * b ; % richardson number  
a = (To/Ta) * (molecular_weight_air / molecular_weight) ;
W1 = Ds * (13.5*exp(-6*r)+1.5) * ( 1 - exp(-70*Ri_d*r*C) * (1-(1/15) * sqrt(a) )  ) ; 
W2 = Lb * (0.18*exp(-1.5*r) + 0.31 ) * (1 - 0.47*exp(-25*r));
A = (pi/4) * (W1^2 + W2^2)  + (pi/2)*(W1+W2)*sqrt(Rl^2 + ( (W2-W1) / 2  )^2 );  



end

