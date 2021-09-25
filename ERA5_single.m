


%ncdisp('2018-01.nc');
longitude=ncread('2018-02.nc','longitude');
latitude=ncread('2018-02.nc','latitude');
time=ncread('2018-02.nc','time');
t=ncread('2018-02.nc','t');
z=ncread('2018-02.nc','z');
q=ncread('2018-02.nc','q');
level=ncread('2018-02.nc','level'); % 1-37

%Imaxlat=40; Iminlat=31;
%Iminlon=105;Imaxlon=111.5;
%DetX=-0.25; DetY=0.25;
%Xvector=[Imaxlat:DetX:Iminlat];  %for latitude
%Yvector=[Iminlon:DetY:Imaxlon];  %for longtitude

m=size(level,1);
m1=size(latitude,1);  
m2=size(longitude,1);
n=size(time,1);
%n1=numel(Xvector);
%n2=numel(Yvector);
Xcoord=36.60;
Ycoord=109.50;
Zcoord=959.0;
%for lat=1:n1
%for lon=1:n2
Tm=zeros(size(time,1));


for j=1:n   %time
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

[xlat ylon]=GetXYCoord(numel(zzdata),m1,m2,latitude(size(latitude,1)),latitude(1),longitude(1),longitude(size(longitude,1)));

Zdata=gIDW(xlat,ylon,zzdata,Xcoord,Ycoord,-4/3,'n',8);

pg = 9.7804*(1 + 0.0052884*(sin(Xcoord)*sin(Xcoord) - 0.0000059 *(sin(2 * Xcoord))*(sin(2 * Xcoord)))) - 0.00000286*Zcoord;%Gravitational acceleration
zdata2h=Zdata/pg;


Tdata=gIDW(xlat,ylon,ttdata,Xcoord,Ycoord,-4/3,'n',8);
Qdata=gIDW(xlat,ylon,qqdata,Xcoord,Ycoord,-4/3,'n',8);
%Qi(i)=Qdata;
Ei(i)=double(Qdata)*double(level(i))/0.622;     %水汽压
Ti(i)=Tdata;                                    %温度
Hi(i)=zdata2h;                                  %高度
%imagesc(zdatagrid);xlabel('longitude');ylabel('latitude');grid on;
%%title(datestr(double((time(i)/24+693962)),'yyyy-mm-dd'));
%axis tight equal;
%caxis ([0 20]);
%h=colorbar;
%set(get(h,'Title'),'string','K'); % set the unit on the colorbar
%set(gca,'Xtick',linspace(0,size(zdatagrid,2),10),'xticklabel',linspace(0,360,10))%%%设置x坐标轴显示
%set(gca,'Ytick',linspace(0,size(zdatagrid,1),5),'yticklabel',linspace(90,-90,5))%%%设置y坐标轴显示
%set(gca,'xminortick','on','yminortick','on');
%set(gcf,'color','w');

%tempTCWV(i)=gIDW(xlat,ylon,zzdata,35.87,104.15,-4/3,'n',8);

end


for ii=1:m
if Zcoord>Hi(ii)
    break
end
end    
    
Tm(j)=cal_Tm(Ei,Ti,Hi,ii);


end
%end
%end
