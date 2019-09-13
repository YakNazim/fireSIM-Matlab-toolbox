function [F_12,F_v,F_h] = view_factors_computation( tilt, flame_len, pool_diameter, X_d  )
%view_factors_computation computes the view factor and its horizental &
%vertical contributions
% Only relevant for wind / no wind conditions at ground level 
% Not suitable for configurations where the flame or target (or both) are
% elevated from the ground 
%  Mudan method  (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 92) 
% tilt : tilt of the flame due to wind (no wind = 0) - degrees
% flame_len : mean length of the flame - m
% pool_diameter : diameter of pool - m
% X_d : distance from the center of the fire - m 
 
R = pool_diameter / 2 ; 
tilt = round((tilt * pi / 180),2) ;
if (X_d < R) 
    F_12 = 1 ;
    F_h = 1 ;
    F_v = 1 ;
    
else


    a = flame_len / R ; 
    b = X_d / R ; 

    A = sqrt(a^2 + (b+1)^2 - 2*a*(b+1)*sin(tilt)); 
    B = sqrt(a^2 + (b-1)^2 - 2*a*(b-1)*sin(tilt)); 
    C = sqrt(1+((b^2) - 1)*(cos(tilt))^2) ;
    D = sqrt((b-1)/(b+1)); 
    E = (a*cos(tilt))  /  (b - a*sin(tilt)) ; 
    F = sqrt((b^2)-1) ; 

    F_v = 1/round(pi,2) *(-E*atan(D)+E*atan( A*D/B )*(( a^2 + (b+1)^2-2*b*(1+a*sin(tilt)))/(A*B))+(cos(tilt)/C)*(atan((a*b-sin(tilt)*F^2)/(F*C)) + atan(sin(tilt)*F/C) )) ;                                                            
    F_h = 1/round(pi,2) *((sin(tilt)/C)*(atan((a*b-sin(tilt)*F^2)/(F*C)) + atan(sin(tilt)*F/C) ) + atan(1/D) - atan(A*D/B)*( (a^2 + (b+1)^2 -2*(b+1+a*b*sin(tilt))) / (A*B))) ;
    F_12 = sqrt(F_v^2 + F_h^2) ; 
    F_12 = round(F_12,2);
    

end

end

