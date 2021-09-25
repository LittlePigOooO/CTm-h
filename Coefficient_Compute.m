%function  coefficient  = Coefficient_Compute( coefficient_year_new,TIME ) 
load('TIME_5year.mat');
MSL_lsq(:,1)  = LSQ_MSL( coefficient_year_new(:,1),TIME ) ;
MSL_lsq(:,2)  = LSQ_MSL( coefficient_year_new(:,2),TIME ) ;
MSL_lsq(:,3)  = LSQ_MSL( coefficient_year_new(:,3),TIME ) ;
MSL_lsq(:,4)  = LSQ_MSL( coefficient_year_new(:,4),TIME ) ;
MSL_lsq(:,5)  = LSQ_MSL( coefficient_year_new(:,5),TIME ) ;






%end

