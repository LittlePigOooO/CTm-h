
%load('TIME_2018.mat');
for i=1:size(TIME,1)
    
    
    
    a1(i,1)=MSL_lsq(1,1)*cos(2*pi*(TIME(i,1))/365.25)+MSL_lsq(2,1)*sin(2*pi*(TIME(i,1))/365.25)+MSL_lsq(3,1)*cos(4*pi*(TIME(i,1))/365.25)+MSL_lsq(4,1)*sin(4*pi*(TIME(i,1))/365.25)+cos(2*pi*TIME(i,2)/24)*MSL_lsq(5,1)+sin(2*pi*TIME(i,2)/24)*MSL_lsq(6,1)+MSL_lsq(7,1);
    a2(i,1)=MSL_lsq(1,2)*cos(2*pi*(TIME(i,1))/365.25)+MSL_lsq(2,2)*sin(2*pi*(TIME(i,1))/365.25)+MSL_lsq(3,2)*cos(4*pi*(TIME(i,1))/365.25)+MSL_lsq(4,2)*sin(4*pi*(TIME(i,1))/365.25)+cos(2*pi*TIME(i,2)/24)*MSL_lsq(5,2)+sin(2*pi*TIME(i,2)/24)*MSL_lsq(6,2)+MSL_lsq(7,2);
    a3(i,1)=MSL_lsq(1,3)*cos(2*pi*(TIME(i,1))/365.25)+MSL_lsq(2,3)*sin(2*pi*(TIME(i,1))/365.25)+MSL_lsq(3,3)*cos(4*pi*(TIME(i,1))/365.25)+MSL_lsq(4,3)*sin(4*pi*(TIME(i,1))/365.25)+cos(2*pi*TIME(i,2)/24)*MSL_lsq(5,3)+sin(2*pi*TIME(i,2)/24)*MSL_lsq(6,3)+MSL_lsq(7,3);
    a4(i,1)=MSL_lsq(1,4)*cos(2*pi*(TIME(i,1))/365.25)+MSL_lsq(2,4)*sin(2*pi*(TIME(i,1))/365.25)+MSL_lsq(3,4)*cos(4*pi*(TIME(i,1))/365.25)+MSL_lsq(4,4)*sin(4*pi*(TIME(i,1))/365.25)+cos(2*pi*TIME(i,2)/24)*MSL_lsq(5,4)+sin(2*pi*TIME(i,2)/24)*MSL_lsq(6,4)+MSL_lsq(7,4);
    a5(i,1)=MSL_lsq(1,5)*cos(2*pi*(TIME(i,1))/365.25)+MSL_lsq(2,5)*sin(2*pi*(TIME(i,1))/365.25)+MSL_lsq(3,5)*cos(4*pi*(TIME(i,1))/365.25)+MSL_lsq(4,5)*sin(4*pi*(TIME(i,1))/365.25)+cos(2*pi*TIME(i,2)/24)*MSL_lsq(5,5)+sin(2*pi*TIME(i,2)/24)*MSL_lsq(6,4)+MSL_lsq(7,5);

    
    
end


coefficient(:,1)=a1;
coefficient(:,2)=a2;
coefficient(:,3)=a3;
coefficient(:,4)=a4;
coefficient(:,5)=a5;

for i=1:size(TIME,1)
    
    
    
%y(i,1)=a1(i,1)*H_Tm(i,1)+a2(i,1)*cos(a3(i,1)*H_Tm(i,1))+a4(i,1)*sin(a3(i,1)*H_Tm(i,1))+a5(i,1);   
y(i,1)=a1(i,1)*0.15+a2(i,1)*cos(a3(i,1)*0.15)+a4(i,1)*sin(a3(i,1)*0.15)+a5(i,1);   
    
    
end