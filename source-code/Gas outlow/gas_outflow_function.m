function   gas_outflow_function(V,P0,T0,Cd,Wg,Cv,gamma,Pa,d0,time_step)

% Parameters
max_len = 100 ; %  initial size of array 
max_tolerable_len = 5000 ; % max len possible 

% Converting to SI 
P0 = P0 * 10^5 ; 
Pa = Pa * 10^5; % Bar to Pa
d0 = d0 * 0.01 ; % cm to meter 
Cv = Cv * 1000 ; % Kj to J 
R = 8.314 ; % UNiversal gas constant 
Wg = Wg / 1000 ;  % g/mol to kg/mol
% Arrays
M = zeros(1,max_len) ; 
t = zeros(1,max_len) ;  
T = zeros(1,max_len) ; 
Rho = zeros(1,max_len) ; 
P = zeros(1,max_len) ; 
P_Pa = zeros(1,max_len) ;  
q = zeros(1,max_len) ; 
delta_rho = zeros(1,max_len) ; 
delta_T = zeros(1,max_len) ; 

% Initialization 
T(1,1) = T0 ; 
P(1,1) = P0 ; 
t(1,1) = 0 ; 
Rho (1,1) = (P(1,1) * Wg) / (R * T(1,1)) ; 
A = (pi * d0^2)/4 ; 
P_Pa(1,1) = P(1,1) / Pa ;

i = 1 ; 

 
while ( P_Pa(1,i) > 1  && i<= max_tolerable_len) 
    M(1,i) = (P(1,i) * V) / (R*T(1,i)) * Wg ; 
    K = calc_k_coeff(P(1,i),Pa,gamma) ; 
    q(1,i) = A * Cd * P(1,i) * K  * sqrt (Wg / ( gamma * R * T(1,i))) ; 
    
    delta_rho(1,i) = (q(1,i)/V) * time_step  ;
    delta_T(1,i) =  (P(1,i) / ((Rho(1,i)^2)*Cv))*delta_rho(1,i) ;
    
    Rho(1,i+1) = Rho(1,i) - delta_rho(1,i) ;
    T(1,i+1) = T(1,i) - delta_T(1,i) ;
    P(1,i+1) = ( Rho(1,i+1) * R * T(1,i+1) ) / Wg ; 
    t(1,i+1) = t(1,i) + time_step;
    P_Pa(1,i+1) = P(1,i+1) / Pa ;
    i=i+1;
    
    
end

 
i = i -1 ;

 
M = M(1:i) ; 
t = t(1:i) ; 
T = T(1:i) ; 
Rho = Rho(1:i) ; 
P = P(1:i) ;
q = q(1:i) ;
delta_rho = delta_rho(1:i) ;
delta_T = delta_T(1:i) ;
P_Pa = P_Pa(1:i);
    
 if (P(1,i)> Pa && i == 1000)
 % memory overflow 
 opts = struct('WindowStyle','modal',... 
              'Interpreter','tex');
 f = errordlg('Could not end the simulation. Try increasing the timestep. ','Memory overflow',opts);

 end
 
 
 Sim_array = zeros(i,9) ; 
 Sim_array(:,1) = t(1,:);
 Sim_array(:,2) = M(1,:);
 Sim_array(:,3) = T(1,:);
 Sim_array(:,4) = Rho(1,:);
 Sim_array(:,5) = P(1,:);
 Sim_array(:,6) = P_Pa(1,:);
 Sim_array(:,7) = q(1,:);
 Sim_array(:,8) = delta_rho(1,:);
 Sim_array(:,9) = delta_T(1,:);
 
 Td = array2table(Sim_array,...
    'VariableNames',{'t','M','T','Rho','P','PovPa','q','D_RHO','D_T'});
 writetable(Td,'temp.xls') 
 

 
f0 = figure;
f0.Name = 'Graphs';
subplot(4,1,1);
plot(t,P) 
hold on 
plot(t,Pa*ones(1,size(t,2)))
grid on
grid minor
title('Pressure reduction over time inside the vessel ')
ylabel('Pressure [Pa]')
legend('P inside vessel','Atmospheric pressure')

subplot(4,1,2);
plot(t,q)
grid on 
grid minor
title('mass flow over time ')
ylabel('Mass flow [Kg/s]')
 
subplot(4,1,3);
plot(t,T)
grid on 
grid minor
title('Temperature reduction over time inside the vessel ')
ylabel('Temperature [K]')
 
subplot(4,1,4);
plot(t,M)
grid on 
grid minor
title('Mass reduction over time inside the vessel ')
ylabel('Mass [Kg]')
xlabel('time in seconds')


f = figure;
f.Resize = 'off';
f.Position(3) = 800; 
f.Position(4) = 500;
f.ToolBar = 'none';
f.MenuBar = 'none';
f.Name = 'Data points';
uit = uitable(f,'Data',Sim_array,'Position',[f.Position(1)*0.1  f.Position(2)*0.2 f.Position(3)*0.85 f.Position(4)*0.8]);
uit.ColumnName = {'t (s)','M (kg)','T(k)','Rho (kg/m3)','P(Pa)','P/Pa','q(Kg/s)','dRho', 'dT'};

c = uicontrol;
c.String = 'Save';
c.Callback = @ButtonPushed;

    function  ButtonPushed(~,~ )
       path = uigetdir;
       path = strcat(path,'/data_array.xls' )
       status = copyfile ('temp.xls' , path) ;
       
         
    end


end

