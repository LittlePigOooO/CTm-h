function  coefficient_yaoyibin  = lsq_heightcorrection_yaoyibin( Pre_height_lsq )

for i=1:4

    L0(i,1)=Pre_height_lsq(i,1);
    L0(i,2)=cos(pi*Pre_height_lsq(i,1)/10);
    L0(i,3)=sin(pi*Pre_height_lsq(i,1)/10);
    L0(i,4)=1;
    Tm0(i,1)=Pre_height_lsq(i,2);%bias


end
Xx=inv(L0)*Tm0;    %chuzhi

while true
    
    X0=Xx;
    for i=1:size(Pre_height_lsq,1)
    A(i,1)=Pre_height_lsq(i,1); 
    A(i,2)=cos(pi*Pre_height_lsq(i,1)/10);
    A(i,3)=sin(pi*Pre_height_lsq(i,1)/10);
    A(i,4)=1;
    L(i,1)=Pre_height_lsq(i,2)-(X0(1,1)*Pre_height_lsq(i,1)+X0(2,1)*cos(pi*Pre_height_lsq(i,1)/10)+X0(3,1)*sin(pi*Pre_height_lsq(i,1)/10)+X0(4,1));
    end
    deltx=inv(A'*A)*A'*L;
    Xx=X0+deltx;
    if abs(deltx(1,1)+deltx(2,1)+deltx(3,1)+deltx(4,1))<0.001
        break;
    end    
end


coefficient_yaoyibin=Xx;

end