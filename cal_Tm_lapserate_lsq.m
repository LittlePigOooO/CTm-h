function  Tm_lapse  = cal_Tm_lapserate_lsq( Ei,Ti,Hi )
%CAL_TM lapse rate 此处显示有关此函数的摘要
%   calculate the tm lapse rate
for i=37:-1:17

    Tm_temp(38-i,1)=cal_Tm(Ei,Ti,Hi,i);
    H_temp(38-i,1)=Hi(i)/1000;

end


for i=1:2 %size(Factor_all,1)

    
    L0(i,1)=H_temp(i,1);
    L0(i,2)=1;
    Tm0(i,1)=Tm_temp(i,1);
end
Xx=inv(L0)*Tm0;    %chuzhi
while true
    
    X0=Xx;
    for i=1:size(H_temp,1)
    A(i,1)=H_temp(i,1);
    A(i,2)=1;
    L(i,1)=Tm_temp(i,1)-(X0(1,1)*H_temp(i,1)+X0(2,1));
    end
    deltx=inv(A'*A)*A'*L;
    Xx=X0+deltx;
    if abs(deltx(1,1)+deltx(2,1))<0.00001
        break;
    end    
end

 Tm_lapse=Xx(1,1);
end

