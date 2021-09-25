function [ Tm ] = CTm_h( Xcoord,Ycoord,Zcoord,doy ) 
load('coefficient.txt');
%latitude=55:-0.5:20;
%latitude=latitude';
%longitude=70:0.5:140;
%longitude=longitude';
latitude=50:-2.5:15; latitude=latitude'; longitude=70:5:140; longitude=longitude';
[X,Y] = meshgrid(longitude',latitude'); %产生length(x)个列，length(y)个行，5x9
[xlat ylon]=GetXYCoord(size(latitude,1)*size(longitude,1),size(latitude,1),size(longitude,1),latitude(size(latitude,1)),latitude(1),longitude(1),longitude(size(longitude,1)));
%RBS=zeros(size(latitude,1)*size(longitude,1),6);
%COEFFCIENT=zeros(size(latitude,1)*size(longitude,1),5);
for ii=1:1:size(latitude,1)*size(longitude,1)

    %load coefficient
    coeffname=([output_dir,'grid-coefficient-',num2str(xlat(ii,1)),'-',num2str(ylon(ii,1)),'.mat']);
    load(coeffname);
    %计算H与Tm    
    coefficient=coefficient'
    %a1=coefficient(1,1)*cos(2*pi*(TIME(:,1))/365.25)+coefficient(1,2)*sin(2*pi*(TIME(:,1))/365.25)+coefficient(1,3)*cos(4*pi*(TIME(:,1))/365.25)+coefficient(1,4)*sin(4*pi*(TIME(:,1))/365.25)+cos(2*pi*TIME(:,2)/24)*coefficient(1,5)+sin(2*pi*TIME(:,2)/24)*coefficient(1,6)+coefficient(1,7);
    %a2=coefficient(2,1)*cos(2*pi*(TIME(:,1))/365.25)+coefficient(2,2)*sin(2*pi*(TIME(:,1))/365.25)+coefficient(2,3)*cos(4*pi*(TIME(:,1))/365.25)+coefficient(2,4)*sin(4*pi*(TIME(:,1))/365.25)+cos(2*pi*TIME(:,2)/24)*coefficient(2,5)+sin(2*pi*TIME(:,2)/24)*coefficient(2,6)+coefficient(2,7); 
    %a3=coefficient(3,1)*cos(2*pi*(TIME(:,1))/365.25)+coefficient(3,2)*sin(2*pi*(TIME(:,1))/365.25)+coefficient(3,3)*cos(4*pi*(TIME(:,1))/365.25)+coefficient(3,4)*sin(4*pi*(TIME(:,1))/365.25)+cos(2*pi*TIME(:,2)/24)*coefficient(3,5)+sin(2*pi*TIME(:,2)/24)*coefficient(3,6)+coefficient(3,7); 
    %a4=coefficient(4,1)*cos(2*pi*(TIME(:,1))/365.25)+coefficient(4,2)*sin(2*pi*(TIME(:,1))/365.25)+coefficient(4,3)*cos(4*pi*(TIME(:,1))/365.25)+coefficient(4,4)*sin(4*pi*(TIME(:,1))/365.25)+cos(2*pi*TIME(:,2)/24)*coefficient(4,5)+sin(2*pi*TIME(:,2)/24)*coefficient(4,6)+coefficient(4,7); 
    %Tm_Nonliner=zeros(size(a1(:,1),1),1);
    
    Tm_txt(ii,:)=reshape(coefficient,1,28);
    
    %for i=1:size(a1(:,1),1)
    %Tm_Nonliner(i,1)=a1(i,1)*H_Tm(i,1)+a2(i,1)*cos(2*pi*H_Tm(i,1)/20)+a3(i,1)*sin(2*pi*H_Tm(i,1)/20)+a4(i,1);
    %end

     
    %save(coeffname,'coefficient');
    

   
end
end