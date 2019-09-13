function k = calc_k_coeff (P0,Pa,gamma)
%calc_k_coeff Summary of this function goes here
%   Detailed explanation goes here
% P0 : vessel internal presure 
% Pa : atmospheric pressure 
% gamma : poisson's coefficient 

eval = ((gamma + 1) / 2 ) ^ (gamma / (gamma-1)) ; 

if ((P0/Pa) >= eval) 
    % supersonic flow
    k = gamma * (2/(gamma+1)) ^ ((gamma+1)/(2*(gamma-1))); 
    
else 
    % subsonic flow
    k = sqrt(  ((2*gamma^2)/(gamma-1)) * (Pa/P0)^(2/gamma) * (1-( (Pa/P0)^((gamma-1)/gamma))) ) ;

end

    
end

