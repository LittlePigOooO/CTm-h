output_dir='F:\ECMWF_China\pressure\2017\Results\';     %output file directory
%latitude=55:-0.5:20;
%latitude=latitude';
%longitude=70:0.5:140;
%longitude=longitude';
%load('TIME_2018.mat');
latitude=55:-2.5:15; latitude=latitude'; longitude=70:5:140; longitude=longitude';
[X,Y] = meshgrid(longitude',latitude'); %产生length(x)个列，length(y)个行，5x9
[xlat ylon]=GetXYCoord(size(latitude,1)*size(longitude,1),size(latitude,1),size(longitude,1),latitude(size(latitude,1)),latitude(1),longitude(1),longitude(size(longitude,1)));
%RBS=zeros(size(latitude,1)*size(longitude,1),6);
%COEFFCIENT=zeros(size(latitude,1)*size(longitude,1),5);
for ii=1:1:size(latitude,1)*size(longitude,1)

    Tmname=([output_dir,'grid-Tm-',num2str(xlat(ii,1)),'-',num2str(ylon(ii,1)),'.mat']); 
    %计算H与Tm
    load(Tmname);
    
filename=[output_dir,'grid-Tm-',num2str(xlat(ii,1)),'-',num2str(ylon(ii,1)),'.txt'];
H_Tm=H_Tm';
%save(filename,'Tmname','-ascii');
fileID=fopen(filename,'w');
%fprintf(fileID,H_Tm);

fprintf(fileID,'%f %f\n',H_Tm);
fclose(fileID);


end
    
   
    %save(coeffname,'coefficient');
    

   
