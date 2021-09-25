function [ tm ] = Cal_era( Xcoord,Ycoord,Zcoord )
filename=importdata('dataname_era.txt');
%站坐标
%ZLYA
Xcoord=30.00;Ycoord=110.00;Zcoord=0.0;
%Jinghe
%Xcoord=34.43;Ycoord=108.97;Zcoord=411.0;
%Hanzhong
%Xcoord=33.06;Ycoord=107.03;Zcoord=509.0;


for f=1:size(filename,1)
    
longitude=ncread(char(filename(f)),'longitude');
latitude=ncread(char(filename(f)),'latitude');
time=ncread(char(filename(f)),'time');
t=ncread(char(filename(f)),'t');
z=ncread(char(filename(f)),'z');
q=ncread(char(filename(f)),'q');
level=ncread(char(filename(f)),'level'); % 1-37

%Imaxlat=40; Iminlat=31;
%Iminlon=105;Imaxlon=111.5;
%DetX=-0.25; DetY=0.25;
%Xvector=[Imaxlat:DetX:Iminlat];  %for latitude
%Yvector=[Iminlon:DetY:Imaxlon];  %for longtitude

m=size(level,1);
m1=size(latitude,1);  
m2=size(longitude,1);
n=size(time,1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Tm=zeros(size(time,1),1);


for j=1:1   %time---------------n
for i=1:m   %Press
    
zdatagrid=z(:,:,i,j);
tdatagrid=t(:,:,i,j);
qdatagrid=q(:,:,i,j);

zzdata=reshape(zdatagrid,m1*m2,1); %插值需要
ttdata=reshape(tdatagrid,m1*m2,1); 
qqdata=reshape(qdatagrid,m1*m2,1);

zdatagrid=zdatagrid';
tdatagrid=tdatagrid';
qdatagrid=qdatagrid';

%插值用
[xlat ylon]=GetXYCoord(numel(zzdata),m1,m2,latitude(size(latitude,1)),latitude(1),longitude(1),longitude(size(longitude,1)));
%-4/3
Zdata=gIDW(xlat,ylon,zzdata,Xcoord,Ycoord,0,'n',8);

pg = 9.7804*(1 + 0.0052884*(sin(Xcoord)*sin(Xcoord) - 0.0000059 *(sin(2 * Xcoord))*(sin(2 * Xcoord)))) - 0.00000286*Zcoord;%Gravitational acceleration
zdata2h=Zdata/pg; %位势高


Tdata=gIDW(xlat,ylon,ttdata,Xcoord,Ycoord,0,'n',8);
Qdata=gIDW(xlat,ylon,qqdata,Xcoord,Ycoord,0,'n',8);

%Qi(i)=Qdata;
Ei(i)=double(Qdata)*double(level(i))/0.622+0.378*double(Qdata);     %水汽压
Ti(i)=Tdata;                                    %温度
Hi(i)=zdata2h;                                  %位势高度

end


 
 temp_Tm=cal_Tm(Ei,Ti,Hi,m);    %海平面Tm

 
 %线性温度递减率计算（建模需要）
 Tm_lapse=cal_Tm_lapserate_each( Ei,Ti,Hi );
 delta_a=Tm_lapse/1000;
 Tm(j,1)=temp_Tm+(Zcoord-Hi(m))*delta_a;
 


end %time 


end   %file

tm=Tm;
end
