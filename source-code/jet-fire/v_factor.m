function F12 = v_factor(b,teta_jv,distance,alpha,Rl,W1,W2)
%% Pass data to view_factors_computation function 

    X = sqrt(  (b*sind(teta_jv))^2  + ( distance - b*cosd(teta_jv) )^2  ) ;
    tilt = 90 - teta_jv + alpha  - atand ( b * sind(teta_jv)  / ( distance - b*cosd(teta_jv)  ) ) ;
    R = (W1+W2)/4 ;
    F12 = view_factors_computation( tilt, Rl, 2*R, X  ) ;

end

