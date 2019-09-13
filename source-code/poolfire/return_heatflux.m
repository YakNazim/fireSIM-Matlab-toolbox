function hfx = return_heatflux(distance,fit_object)
% Compute the heatflux corresponding to a distance

hfx = feval(fit_object,distance);


end

