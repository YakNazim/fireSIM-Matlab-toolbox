function dis = return_distance(heatflux,fit_object)
% Compute the distance corresponding to heatflux value

dis = feval(fit_object,heatflux);


end

