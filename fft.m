fs=31*4;    %һ��Сʱ�Ĳ�����Ŀ
N=124;      %���ݸ���/�źų���
% sum=0;
x=tm;
% for i=1:N
% sum=sum+WW(i,1);
% end
% average=sum/N;
% for i=1:N
% CycleTerm1(i,1)=WW(i,1)-average;
% end
% x=CycleTerm1;     %��ϲв�
t=(0:(N-1))*(1/fs);      %ʱ������
Y=fft(x)/N;              %���ٸ���Ҷ�任
magY = 2*abs(Y(1:1:N/2));%����źŵ�Ƶ�׷�ֵ
f=(0:N/2-1)*fs/N;        %��һ��Ƶ��
fT=f';               %����
%figure(1);
% plot(fT,magY);
% hold on
k=length(fT(:));
for j=1:k
    fW(j)=(1/fT(j));
end
figure(2);
fww=fW';
plot(fW,magY);        %magY������.����Ƶ��ͼ 
xlim([0 3]);
set(gca,'xtick',0:0.25:3); 