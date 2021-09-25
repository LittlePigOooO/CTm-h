


%ncdisp('2018test.nc');
%longitude=ncread('ERA5_Tem_Hum_Geo_201801_201812.nc','longitude');
%latitude=ncread('ERA5_Tem_Hum_Geo_201801_201812.nc','latitude');
%time=ncread('ERA5_Tem_Hum_Geo_201801_201812.nc','time');
%t=ncread('ERA5_Tem_Hum_Geo_201801_201812.nc','t');
%z=ncread('ERA5_Tem_Hum_Geo_201801_201812.nc','z');
%q=ncread('ERA5_Tem_Hum_Geo_201801_201812.nc','q');
%level=ncread('ERA5_Tem_Hum_Geo_201801_201812.nc','level'); % 18-37
Imaxlat=40; Iminlat=31;
Iminlon=105;Imaxlon=111.5;
DetX=-0.25; DetY=0.25;
Xvector=[Imaxlat:DetX:Iminlat];  %for latitude
Yvector=[Iminlon:DetY:Imaxlon];  %for longtitude

m=size(level,1);
m1=size(latitude,1);
m2=size(longitude,1);
n1=numel(Xvector);
n2=numel(Yvector);

for lat=1:n1
for lon=1:n2
for i=1:m
    
zdatagrid=z(:,:,i,1);
tdatagrid=t(:,:,i,1);
qdatagrid=q(:,:,i,1);

zzdata=reshape(zdatagrid,m1*m2,1); %插值需要
ttdata=reshape(tdatagrid,m1*m2,1);
qqdata=reshape(qdatagrid,m1*m2,1);

zdatagrid=zdatagrid';
tdatagrid=tdatagrid';
qdatagrid=qdatagrid';

[xlat ylon]=GetXYCoord(numel(zzdata),m1,m2,latitude(size(latitude,1)),latitude(1),longitude(1),longitude(size(longitude,1)));

Zdata=gIDW(xlat,ylon,zzdata,Xvector(lat),Yvector(lon),-4/3,'n',8);

zdata2h=Zdata/9.8;
Tdata=gIDW(xlat,ylon,ttdata,Xvector(lat),Yvector(lon),-4/3,'n',8);
Qdata=gIDW(xlat,ylon,qqdata,Xvector(lat),Yvector(lon),-4/3,'n',8);
Qi(i)=Qdata;
Ei(i)=double(Qdata)*double(level(i))/0.622;
Ti(i)=Tdata;
Hi(i)=zdata2h;
Tm(lat,lon)=cal_Tm(Ei,Ti,Hi);
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

end
end
