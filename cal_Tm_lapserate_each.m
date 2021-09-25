function  Tm_lapse_each_layer  = cal_Tm_lapserate_each( Ei,Ti,Hi )
%CAL_TM lapse rate 此处显示有关此函数的摘要
%   calculate the tm lapse rate each layer

for i=37:-1:17

    Tm_temp(38-i,1)=cal_Tm(Ei,Ti,Hi,i);
    H_temp(38-i,1)=Hi(i)/1000;
end
%for i=1:1:size(Tm_temp,1)-1
%    Dt=Tm_temp(i+1)-Tm_temp(i);
%    Dh=H_temp(i+1)-H_temp(i);

%Tm_lapse_each_layer_temp(i,1)=Dt/Dh;
%end
tt=polyfit(H_temp,Tm_temp,1);
Tm_lapse_each_layer=tt(1,1);
end