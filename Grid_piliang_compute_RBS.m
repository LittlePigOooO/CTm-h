output_dir='F:\ECMWF_China\pressure\2017\Results\';     %output file directory
%latitude=55:-0.5:20;
%latitude=latitude';
%longitude=70:0.5:140;
%longitude=longitude';
load('TIME.mat');
latitude=55:-2.5:15; latitude=latitude'; longitude=70:5:140; longitude=longitude';
[X,Y] = meshgrid(longitude',latitude'); %产生length(x)个列，length(y)个行，5x9
[xlat ylon]=GetXYCoord(size(latitude,1)*size(longitude,1),size(latitude,1),size(longitude,1),latitude(size(latitude,1)),latitude(1),longitude(1),longitude(size(longitude,1)));
%RBS=zeros(size(latitude,1)*size(longitude,1),6);
%COEFFCIENT=zeros(size(latitude,1)*size(longitude,1),5);
for ii=1:1:size(latitude,1)*size(longitude,1)

    %save coefficient
    coeffname=([output_dir,'grid-coefficient-',num2str(xlat(ii,1)),'-',num2str(ylon(ii,1)),'.mat']);
    coefficient_year_cos  = Cal_era_test( xlat(ii,1),ylon(ii,1),0 );
    %coefficient_year_cos=Prepare_coefficient_all(coefficient_year_cos);
    coefficient=zeros(4,7);
    coefficient(1,:)=LSQ_MSL(coefficient_year_cos(:,1),TIME);
    coefficient(2,:)=LSQ_MSL(coefficient_year_cos(:,2),TIME); 
    coefficient(3,:)=LSQ_MSL(coefficient_year_cos(:,3),TIME); 
    coefficient(4,:)=LSQ_MSL(coefficient_year_cos(:,4),TIME); 
    
    
    
    
    save(coeffname,'coefficient');
    

   
end