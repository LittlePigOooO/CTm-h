output_dir='F:\ECMWF_China\pressure\2017\Results\';     %output file directory
%latitude=55:-0.5:20;
%latitude=latitude';
%longitude=70:0.5:140;
%longitude=longitude';
load('TIME_2018.mat');
latitude=55:-2.5:15; latitude=latitude'; longitude=70:5:140; longitude=longitude';
[X,Y] = meshgrid(longitude',latitude'); %产生length(x)个列，length(y)个行，
[xlat ylon]=GetXYCoord(size(latitude,1)*size(longitude,1),size(latitude,1),size(longitude,1),latitude(size(latitude,1)),latitude(1),longitude(1),longitude(size(longitude,1)));
%RBS=zeros(size(latitude,1)*size(longitude,1),6);
%COEFFCIENT=zeros(size(latitude,1)*size(longitude,1),5);

for ii=1:1:size(latitude,1)*size(longitude,1)
    %load coefficient
    coeffname=([output_dir,'grid-coefficient-',num2str(xlat(ii,1)),'-',num2str(ylon(ii,1)),'.mat']);
    load(coeffname);
    
    new_coe(ii,1)=xlat(ii,1);
    new_coe(ii,2)=ylon(ii,1);
    new_coe(ii,3)=coefficient(1,1)
    new_coe(ii,4)=coefficient(1,2)
    new_coe(ii,5)=coefficient(1,3)
    new_coe(ii,6)=coefficient(1,4)
    new_coe(ii,7)=coefficient(1,5)
    new_coe(ii,8)=coefficient(1,6)
    new_coe(ii,9)=coefficient(1,7)
    new_coe(ii,10)=coefficient(2,1)
    new_coe(ii,11)=coefficient(2,2)
    new_coe(ii,12)=coefficient(2,3)
    new_coe(ii,13)=coefficient(2,4)
    new_coe(ii,14)=coefficient(2,5)
    new_coe(ii,15)=coefficient(2,6)
    new_coe(ii,16)=coefficient(2,7)
    new_coe(ii,17)=coefficient(3,1)
    new_coe(ii,18)=coefficient(3,2)
    new_coe(ii,19)=coefficient(3,3)
    new_coe(ii,20)=coefficient(3,4)
    new_coe(ii,21)=coefficient(3,5)
    new_coe(ii,22)=coefficient(3,6)
    new_coe(ii,23)=coefficient(3,7)
    new_coe(ii,24)=coefficient(4,1)
    new_coe(ii,25)=coefficient(4,2)
    new_coe(ii,26)=coefficient(4,3)
    new_coe(ii,27)=coefficient(4,4)
    new_coe(ii,28)=coefficient(4,5)
    new_coe(ii,29)=coefficient(4,6)
    new_coe(ii,30)=coefficient(4,7)
    
   

   
end