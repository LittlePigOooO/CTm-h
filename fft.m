fs=31*4;    %一个小时的采样数目
N=124;      %数据个数/信号长度
% sum=0;
x=tm;
% for i=1:N
% sum=sum+WW(i,1);
% end
% average=sum/N;
% for i=1:N
% CycleTerm1(i,1)=WW(i,1)-average;
% end
% x=CycleTerm1;     %拟合残差
t=(0:(N-1))*(1/fs);      %时间向量
Y=fft(x)/N;              %快速傅里叶变换
magY = 2*abs(Y(1:1:N/2));%求出信号的频谱幅值
f=(0:N/2-1)*fs/N;        %归一化频率
fT=f';               %横轴
%figure(1);
% plot(fT,magY);
% hold on
k=length(fT(:));
for j=1:k
    fW(j)=(1/fT(j));
end
figure(2);
fww=fW';
plot(fW,magY);        %magY是纵轴.画出频谱图 
xlim([0 3]);
set(gca,'xtick',0:0.25:3); 