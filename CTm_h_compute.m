function [ Tm ] = CTm_h( Xcoord,Ycoord,Zcoord,doy,hour ) 
load('coefficient.txt');
%latitude=55:-0.25:15;
%latitude=latitude';
%longitude=70:0.25:140;
%longitude=longitude';

for ii=1:1:size(latitude,1)*size(longitude,1)
    
    
    
    a1=coefficient(1,1)*cos(2*pi*(doy)/365.25)+coefficient(1,2)*sin(2*pi*(doy)/365.25)+coefficient(1,3)*cos(4*pi*(doy)/365.25)+coefficient(1,4)*sin(4*pi*(doy)/365.25)+cos(2*pi*hour/24)*coefficient(1,5)+sin(2*pi*hour/24)*coefficient(1,6)+coefficient(1,7);
    a2=coefficient(2,1)*cos(2*pi*(doy)/365.25)+coefficient(2,2)*sin(2*pi*(doy)/365.25)+coefficient(2,3)*cos(4*pi*(doy)/365.25)+coefficient(2,4)*sin(4*pi*(doy)/365.25)+cos(2*pi*hour/24)*coefficient(2,5)+sin(2*pi*hour/24)*coefficient(2,6)+coefficient(2,7); 
    a2=coefficient(3,1)*cos(2*pi*(doy)/365.25)+coefficient(3,2)*sin(2*pi*(doy)/365.25)+coefficient(3,3)*cos(4*pi*(doy)/365.25)+coefficient(3,4)*sin(4*pi*(doy)/365.25)+cos(2*pi*hour/24)*coefficient(3,5)+sin(2*pi*hour/24)*coefficient(3,6)+coefficient(3,7); 
    a3=coefficient(4,1)*cos(2*pi*(doy)/365.25)+coefficient(4,2)*sin(2*pi*(doy)/365.25)+coefficient(4,3)*cos(4*pi*(doy)/365.25)+coefficient(4,4)*sin(4*pi*(doy)/365.25)+cos(2*pi*hour/24)*coefficient(4,5)+sin(2*pi*hour/24)*coefficient(4,6)+coefficient(4,7); 
    a4=coefficient(5,1)*cos(2*pi*(doy)/365.25)+coefficient(5,2)*sin(2*pi*(doy)/365.25)+coefficient(5,3)*cos(4*pi*(doy)/365.25)+coefficient(5,4)*sin(4*pi*(doy)/365.25)+cos(2*pi*hour/24)*coefficient(5,5)+sin(2*pi*hour/24)*coefficient(5,6)+coefficient(5,7); 
    Tm_Nonliner=a1*Zcoord+a2*cos(a3*Zcoord)+a4*sin(a3*Zcoord)+a4;
    
    

   Tm=Tm_Nonliner;
end
end
