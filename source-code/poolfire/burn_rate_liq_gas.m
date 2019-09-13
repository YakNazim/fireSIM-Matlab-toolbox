function burning_rate = burn_rate_liq_gas(vap_heat,comb_heat,spec_heat_cap,T_boiling,T_ambiant)
%burn_rate_liq_gas compute burning rate of liquified gas (LPG/LNG)
% Mudan's equation for burning rate (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 83) 
% vap_heat        % Kj/Kg
% comb_heat       % Kj/Kg
% spec_heat_cap  % kj/kg/k
% T_boiling  % Kelvins 
% T_ambiant  % Kelvins 

burning_rate = (0.001 * comb_heat) / ( vap_heat + spec_heat_cap * (T_boiling - T_ambiant)) ; 
burning_rate = round(burning_rate,2) ;
end

