function  COMPUTE_RBS  = COMPUTE_RMS_BIAS_STD( Pre_height_lsq,coefficient_new ) 

COMPUTE_RBS=zeros(6,1);
tt=polyfit(Pre_height_lsq(:,1),Pre_height_lsq(:,2),1); %tt(1,1)  ÎÂ¶ÈµÝ¼õÂÊ 
temp_y=tt(1,1)*Pre_height_lsq(:,1)+tt(1,2); %plot(H_temp,Tm_temp,'*',H_temp,polyval(tt,H_temp)); 
bias=Pre_height_lsq(:,2)-temp_y;


y3=Pre_height_lsq(:,1)*coefficient_new(1,1)+coefficient_new(2,1)*cos(2*pi*Pre_height_lsq(:,1)/coefficient_new(3,1))+coefficient_new(4,1); 
bias3=Pre_height_lsq(:,2)-y3;   



RMS_L=(1/size(bias,1))*sqrt(sum(power(bias,2)));
RMS_N=(1/size(bias3,1))*sqrt(sum(power(bias3,2)));
bias_l=(1/size(bias,1))*sum(bias);
bias_n=(1/size(bias3,1))*sum(bias3);
std_l=(1/size(bias,1))*sum(power(bias-mean(bias),2));
std_n=(1/size(bias3,1))*sum(power(bias3-mean(bias3),2));



COMPUTE_RBS(1,1)=bias_l;
COMPUTE_RBS(2,1)=std_l;
COMPUTE_RBS(3,1)=RMS_L;
COMPUTE_RBS(4,1)=bias_n;
COMPUTE_RBS(5,1)=std_n;
COMPUTE_RBS(6,1)=RMS_N;



end