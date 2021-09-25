function  coefficient_new  = lsq_heightcorrection_new( Pre_height_lsq )

COUNT=0;
    


Xx(1,1)=0.5;
Xx(2,1)=1;
Xx(3,1)=0.4;
Xx(4,1)=2;
Xx(5,1)=250;



while true
    
    X0=Xx;
    for i=1:size(Pre_height_lsq,1)
    A(i,1)=cos(X0(2,1)*Pre_height_lsq(i,1)); 
    A(i,2)=X0(1,1)*Pre_height_lsq(i,1)*(-sin(X0(2,1)*Pre_height_lsq(i,1)));
    A(i,3)=cos(Pre_height_lsq(i,1)*X0(4,1));
    A(i,4)=X0(3,1)*cos(X0(4,1)*Pre_height_lsq(i,1))*Pre_height_lsq(i,1);
    A(i,5)=1;
    L(i,1)=Pre_height_lsq(i,2)-(X0(1,1)*cos(X0(2,1)*Pre_height_lsq(i,1))+X0(3,1)*sin(Pre_height_lsq(i,1)*X0(4,1))+X0(5,1));
    end
    deltx=inv(A'*A)*A'*L;
    Xx=X0+deltx;
    
    if abs(deltx(1,1)+deltx(2,1)+deltx(3,1)+deltx(4,1)+deltx(5,1))<0.0001 || COUNT>50
        break;
    end
    COUNT=COUNT+1;
end
coefficient_new=Xx;

end