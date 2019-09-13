function [ovr_injuries_lv1,ovr_injuries_lv2,ovr_injuries_lv3] = overall_effects_computation(N0,D_max,R_1D,P_level1_1d_batch,P_level2_1d_batch, P_level3_1d_batch,distance_from_heatflux_fit)
%% overall_effects_computation computes an estimation of total loss & injuries in the area of the fire given the human density 
%% Reference : (FIRES, EXPLOSIONS,AND TOXIC GAS DISPERSIONS - 2010 - p 148) 
%% Output : 
% total number of injuries & deaths ovr_injuries_lv1,ovr_injuries_lv2,ovr_injuries_lv3

%% find safe distance 
r = D_max / 2 ; 
dis = return_distance(1 , distance_from_heatflux_fit) ;
len = 0 ;
if (isempty(find(R_1D > dis,1)))
    len = length(R_1D) ;
else
   len = find(R_1D > dis,1); % find index
     
end
% index of flame surface !!!
start = find(R_1D > D_max/2,1);
 
ovr_injuries_lv1  = 0 ;
ovr_injuries_lv2  = 0 ;
ovr_injuries_lv3  = 0 ; 
ovr_injuries_lv3_1 = 0 ; % outside the flame circle 

% integration 
% % % for i=start:len
% % %     ovr_injuries_lv1 = ovr_injuries_lv1 + P_level1_1d_batch(i) * N0 * pi * ((R_1D(i)^2) - (R_1D(i-1)^2)) ;
% % %     ovr_injuries_lv2 = ovr_injuries_lv2 + P_level2_1d_batch(i) * N0 * pi * ((R_1D(i)^2) - (R_1D(i-1)^2)) ;
% % %     ovr_injuries_lv3_1 = ovr_injuries_lv3_1 + P_level3_1d_batch(i) * N0 * pi * ((R_1D(i)^2) - (R_1D(i-1)^2)) ;
% % %     
% % % end

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

% to avoid double counting 
% a dead person probably went through level 1 and level 2 skin burns
ovr_injuries_lv1 = ceil(ovr_injuries_lv1 - ovr_injuries_lv2 - ovr_injuries_lv3 );
ovr_injuries_lv2 = ceil(ovr_injuries_lv2 - ovr_injuries_lv3) ;
ovr_injuries_lv3 = ceil(ovr_injuries_lv3);
% 
% q = start-len ;
% R_sq = zeros(q,1);
% w = 1 ;
% for i=2:start
%     R_sq(w,1) =  ((R_1D(i)^2) - (R_1D(i-1)^2)) ;
%     w = w + 1 ;
% end
% ovr_injuries_lv3_1 = N0*pi*trapz(R_sq,P_level3_1d_batch(2:start));

% ovr_injuries_lv3 = ceil(ovr_injuries_lv3 + ovr_injuries_lv3_1);


if(ovr_injuries_lv1 < 0) 
    ovr_injuries_lv1 = 0 ;
end
if(ovr_injuries_lv2 < 0) 
    ovr_injuries_lv2 = 0 ;
end


end


