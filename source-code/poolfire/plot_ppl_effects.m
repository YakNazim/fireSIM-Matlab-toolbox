function plot_ppl_effects(R_1D,P_level1_1d_batch,P_level2_1d_batch, P_level3_1d_batch)

figure( 'Name', 'Effects on people' );
plot(R_1D,100.*P_level1_1d_batch); 

hold on 
plot(R_1D,100.*P_level2_1d_batch); 

hold on 
plot(R_1D,100.*P_level3_1d_batch); 

hold off

grid on ;
grid minor;

ylabel('Probability of injury') ; 
xlabel('Distance from flame center [m]') ;
legend('Level 1 burn','level 2 burn','death') ;


end

