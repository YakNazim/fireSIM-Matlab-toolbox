function burning_time = burning_time_computation(V,h_desntity,burning_rate,pool_diameter)
%% Reference : SFPE Handbook of fire protection engineering (p2581 eq65.28)
% burning_time in minutes 
m = h_desntity * V ; 
burning_time = (4*m /(pi*pool_diameter^2*burning_rate)) / 60 ; 

end

