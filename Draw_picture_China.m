function  Draw_picture_China( latitude,longitude,VarName3 )

    
m1=size(latitude,1);  
m2=size(longitude,1);


    
%tdatagrid=t(:,:,i,j);
%��ֵ��Ҫ
%coeffcient_a3=reshape(COEFFCIENT(:,3),m1,m2); 
RBS_grid=reshape(VarName3,m1,m2); 

%tdatagrid=tdatagrid';




%��ֵ��
%[xlat ylon]=GetXYCoord(numel(ttdata),m1,m2,latitude(size(latitude,1)),latitude(1),longitude(1),longitude(size(longitude,1)));
%-4/3
LATLIMS=[-87.5 87.5];
LONLIMS=[-180 180];%ѡ���߽緶Χ
 
[Plg,Plt]=meshgrid(longitude',latitude');%�γ�����
 %geoshow('bou2_4l.shp')
 %m_proj('lambert','lon',LONLIMS,'lat',LATLIMS);%ͶӰģʽ
 m_proj('Equidistant Cylindrical','long',LONLIMS,'lat',LATLIMS) 
 m_pcolor(Plg,Plt,RBS_grid);
 shading flat;
 colormap('jet');%��ɫѡ��
 hold on;

 
 m_coast('linewidth',1,'color','k'); 
 %m_coast('patch',[0.6,0.6,0.6],'linewidth',1,'edgecolor','k'); 
 m_grid('box','fancy','tickdir','in');

c=colorbar('southoutside','fontsize',12);
c.Label.String = 'Ion Map'; 
c.Label.FontSize = 12;
caxis ([50 600]); 


i=1;

end
