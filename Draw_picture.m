function  RMS  = Draw_picture( Pre_height_lsq,coefficient_yaoyibin,coefficient_new)

tt=polyfit(Pre_height_lsq(:,1),Pre_height_lsq(:,2),1);
%tt(1,1)  ÎÂ¶ÈµÝ¼õÂÊ
temp_y=tt(1,1)*Pre_height_lsq(:,1)+tt(1,2);
%plot(H_temp,Tm_temp,'*',H_temp,polyval(tt,H_temp));
bias=Pre_height_lsq(:,2)-temp_y;


y3=coefficient_yaoyibin(1,1)*Pre_height_lsq(:,1)+coefficient_yaoyibin(2,1)*cos(2*pi*Pre_height_lsq(:,1)/20)+coefficient_yaoyibin(3,1)*sin(2*pi*Pre_height_lsq(:,1)/20)+coefficient_yaoyibin(4,1); 
bias3=Pre_height_lsq(:,2)-y3; 

y4=coefficient_new(1,1)*Pre_height_lsq(:,1)+coefficient_new(2,1)*cos(coefficient_new(3,1)*Pre_height_lsq(:,1))+coefficient_new(4,1)*sin(coefficient_new(3,1)*Pre_height_lsq(:,1))+coefficient_new(5,1); 
bias4=Pre_height_lsq(:,2)-y4; 

%subplot(1,2,1),plot(Pre_height_lsq(:,1),Pre_height_lsq(:,2),':+'),xlabel('Elevation/km'),ylabel('Tm/K'),title('Tm varies with elevation'); 
%hold on
subplot(1,2,1),plot(Pre_height_lsq(:,1),Pre_height_lsq(:,2),'+'),xlabel('Elevation/km'),ylabel('Tm/K'),title('Tm varies with elevation');
hold on
subplot(1,2,1),plot(Pre_height_lsq(:,1),y3),xlabel('Elevation/km'),ylabel('Tm/K'),title('Tm varies with elevation'); 
hold on
subplot(1,2,1),plot(Pre_height_lsq(:,1),y4,'o'),xlabel('Elevation/km'),ylabel('Tm/K'),title('Tm varies with elevation'); 
hold on
%subplot(1,5,2),plot(Pre_height_lsq(:,1),bias,':o'),xlabel('Elevation/km'),ylabel('Bias/K'),title('The residuals of linear fitting vary with elevation');
%hold on
%subplot(1,5,3),plot(Pre_height_lsq(:,1),bias2,':o'),xlabel('Elevation/km'),ylabel('Bias/K'),title('The residuals of linear fitting vary with elevation');
%hold on
%subplot(1,5,4),plot(Pre_height_lsq(:,1),bias3,':o'),xlabel('Elevation/km'),ylabel('Bias/K'),title('The residuals of linear fitting vary with elevation');
%hold on
subplot(1,2,2),plot(Pre_height_lsq(:,1),bias,'+'),xlabel('Elevation/km'),ylabel('Bias/K'),title('The residuals of linear fitting vary with elevation'); 
hold on
subplot(1,2,2),plot(Pre_height_lsq(:,1),bias3),xlabel('Elevation/km'),ylabel('Bias/K'),title('The residuals of linear fitting vary with elevation'); 
hold on
subplot(1,2,2),plot(Pre_height_lsq(:,1),bias4,'o',Pre_height_lsq(:,1),bias4),xlabel('Elevation/km'),ylabel('Bias/K'),title('The residuals of linear fitting vary with elevation');  
hold on
RMS=bias4;
end