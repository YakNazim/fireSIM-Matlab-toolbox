function heatflux = single_target_heatflux (pool_diameter,tilt,flame_len,RH,P_ow,SEP ,target_distance ,  target_elevation)
%single_target_heatflux computes the heatflux received by a single target
%with a specific configuration (eleation from ground ... etc)
%    pool_diameter : m
%    Resolution : high : 500 - medium : 250 - low : 125
%    tilt : in dgrees
%    flame_len : m
%    RH : humidity ratio [0 1]
%    P_ow : saturation vapor pressure in Pa
%    SEP :  % Surface emitting power - kw/m2
%    target_elevation : elevation from ground - m




if(target_elevation > flame_len  )
    heatflux = 0 ;     
else
    F_1_v = 0 ;
    F_1_h = 0 ;
    F_2_v = 0 ;
    F_2_h = 0 ;
     
    if (target_elevation > 0 )        
        [~ , F_1_v,F_1_h] =  view_factors_computation(tilt,target_elevation,pool_diameter,target_distance) ;
    end
        [~ , F_2_v,F_2_h] = view_factors_computation(tilt,flame_len - target_elevation,pool_diameter,target_distance) ;
        F_h_eq = sqrt(F_1_h^2 + F_2_h^2);
        F_v_eq = sqrt(F_1_v^2 + F_2_v^2);  
        F12 = sqrt(F_h_eq^2 + F_v_eq^2);
        ATM_transmissivity = transm_ratio_computation(pool_diameter,target_distance,RH,P_ow);
        heatflux = heat_flux_solid_flame(SEP,F12,ATM_transmissivity);
        
end
 

end

