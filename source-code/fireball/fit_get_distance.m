function [fitresult, gof] = fit_get_distance(heat_flux_batch1D, R_1D)
%CREATEFIT(HEAT_FLUX_BATCH1D,R_1D)
%  Create a fit.
%
%  Data for 'R1D_f_heatflux' fit:
%      X Input : heat_flux_batch1D
%      Y Output: R_1D
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 06-Sep-2019 20:17:55


%% Fit: 'R1D_f_heatflux'.
[xData, yData] = prepareCurveData( heat_flux_batch1D, R_1D );

% Set up fittype and options.
ft = fittype( 'exp2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [637.144621234013 -0.169980007250558 309.596610242852 -0.0210481954684328];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
% 
% % Plot fit with data.
% figure( 'Name', 'R1D_f_heatflux' );
% h = plot( fitresult, xData, yData );
% legend( h, 'R_1D vs. heat_flux_batch1D', 'R1D_f_heatflux', 'Location', 'NorthEast' );
% % Label axes
% xlabel heat_flux_batch1D
% ylabel R_1D
% grid on


