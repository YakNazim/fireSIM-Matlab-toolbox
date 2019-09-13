function tilt = tilt_computation(wind_vel,pool_diameter, air_density, air_viscosity)
% tilt_computation computes the tilt angle of the flame 
% The angle is returned in degrees ! 
% Pritchard & Binding Method (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 93) 
% wind_vel : velocity of wind (m/s)
% pool_diameter  : diameter of the pool (m)
% air_density : kg/m3
% air_viscosity : uPa.s

if (wind_vel == 0)
    tilt = 0 ; 
else
    
    air_viscosity = air_viscosity * 10^-6 ; % turn to IS
    g = 9.81 ; 

    Fr = (wind_vel^2) / (g * pool_diameter); % Froude number 
    Re = (wind_vel * air_density * pool_diameter) / air_viscosity ; 

    w = 0.666*(Fr^0.333)*(Re^0.117) ; 
    
    options = optimset('Display','off');

    tilt=round(max(fsolve(@(x) sind(x).^2 + 1/w .* sind(x) -1,[0 pi],options)),2);
    
end


end

