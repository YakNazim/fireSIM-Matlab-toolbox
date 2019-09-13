clear 
clc
load('ddd.mat') ; 
N0 = 0.05 ;

r = pool_diameter / 2 ; 

%% find safe distance 
dis = return_distance(1 , fit_R_f_heatflux) ;
I = find(R_1D > dis); % find index 
len = I(1) ; 

% index of flame surface !!!
I = find(R_1D > pool_diameter/2);
start = I(1) ;
 
% ovr_injuries_lv1  = 0 ;
% ovr_injuries_lv2  = 0 ;
% ovr_injuries_lv3  = P_level1_1d_batch(1)* N0 * pi * (pool_diameter/2)^2 ;
% ovr_injuries_lv3_1 = 0 ; % outside the flame circle 

% for i=start:len
%     ovr_injuries_lv1 = ovr_injuries_lv1 + P_level1_1d_batch(i) * N0 * pi * ((R_1D(i)^2) - (R_1D(i-1)^2)) ;
%     ovr_injuries_lv2 = ovr_injuries_lv2 + P_level2_1d_batch(i) * N0 * pi * ((R_1D(i)^2) - (R_1D(i-1)^2)) ;
%     ovr_injuries_lv3_1 = ovr_injuries_lv3_1 + P_level3_1d_batch(i) * N0 * pi * ((R_1D(i)^2) - (R_1D(i-1)^2)) ;
%     
% end
q = len-start ;
R_sq = zeros(q,1);
w = 1 ;
for i=start:len
    R_sq(w) =  ((R_1D(i)^2) - (R_1D(i-1)^2)) ;
    w = w + 1 ;
end

ovr_injuries_lv1 = N0*pi*trapz(R_sq,P_level1_1d_batch(start:len));
ovr_injuries_lv2 = N0*pi*trapz(R_sq,P_level2_1d_batch(start:len));
ovr_injuries_lv3 = N0*pi*trapz(R_sq,P_level3_1d_batch(start:len));

ovr_injuries_lv1 = ceil(ovr_injuries_lv1 - ovr_injuries_lv2 - ovr_injuries_lv3 )
ovr_injuries_lv2 = ceil(ovr_injuries_lv2 - ovr_injuries_lv3) 

q = start-len ;
R_sq = zeros(q,1);
w = 1 ;
for i=2:start
    R_sq(w,1) =  ((R_1D(i)^2) - (R_1D(i-1)^2)) ;
    w = w + 1 ;
end
ovr_injuries_lv3_1 = N0*pi*trapz(R_sq,P_level3_1d_batch(2:start));

ovr_injuries_lv3 = ceil(ovr_injuries_lv3 + ovr_injuries_lv3_1)
