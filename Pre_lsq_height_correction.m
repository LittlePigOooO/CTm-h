function  Pre_height_lsq  = Pre_lsq_height_correction( Ei,Ti,Hi )
%CAL_TM lapse rate 此处显示有关此函数的摘要
%   calculate the tm lapse rate each layer
Factor_all=zeros(21,1);

for i=37:-1:17

    Tm_temp(38-i,1)=cal_Tm(Ei,Ti,Hi,i);
    H_temp(38-i,1)=Hi(i)/1000;
end


Factor_all(:,1)=H_temp;
Factor_all(:,2)=Tm_temp; 

Pre_height_lsq=Factor_all;
%tt(1,1);
end