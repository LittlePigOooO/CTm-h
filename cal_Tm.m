function  Tm  = cal_Tm( Ei,Ti,Hi,ii )
%CAL_TM 此处显示有关此函数的摘要
%   calculate the tm
Tm=0;
up=0;
down=0;
for i=1:ii-1 
    

    
    
    ave1=(Ei(i+1)/Ti(i+1)+(Ei(i)/Ti(i)))/2;
    ti2_1=Ti(i+1)*Ti(i+1);
    ti2_2=Ti(i)*Ti(i);
    ave2=((Ei(i+1)/ti2_1)+(Ei(i)/ti2_2))/2;
    
    
    %up=up+ave1*((Hi(i)-Hi(i+1))/1000);
    %down=down+ave2*((Hi(i)-Hi(i+1))/1000);
    up=up+ave1*((Hi(i)-Hi(i+1)));
    down=down+ave2*((Hi(i)-Hi(i+1)));
    Tmtemp(i)=up/down;
end
 Tm =up/down;
end

