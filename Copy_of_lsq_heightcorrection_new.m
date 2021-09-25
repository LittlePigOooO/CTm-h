function  coefficient_new  = Copy_of_lsq_heightcorrection_new( coefficient_yaoyibin,Pre_height_lsq )

COUNT=0;
    


Xx(1,1)=coefficient_yaoyibin(1,1);
Xx(2,1)=coefficient_yaoyibin(2,1);
Xx(3,1)=pi/10;
Xx(4,1)=coefficient_yaoyibin(3,1);
Xx(5,1)=coefficient_yaoyibin(4,1);




while true
    
    X0=Xx;
    for i=1:size(Pre_height_lsq,1)
    A(i,1)=Pre_height_lsq(i,1); 
    A(i,2)=cos(X0(3,1)*Pre_height_lsq(i,1)); 
    A(i,3)=X0(2,1)*Pre_height_lsq(i,1)*(-1)*sin(X0(3,1)*Pre_height_lsq(i,1))+X0(4,1)*cos(X0(3,1)*Pre_height_lsq(i,1))*Pre_height_lsq(i,1);
    A(i,4)=sin(Pre_height_lsq(i,1)*X0(3,1));
    A(i,5)=1;
    L(i,1)=Pre_height_lsq(i,2)-(X0(1,1)*Pre_height_lsq(i,1)+X0(2,1)*cos(X0(3,1)*Pre_height_lsq(i,1))+X0(4,1)*sin(Pre_height_lsq(i,1)*X0(3,1))+X0(5,1));
    end
    deltx=inv(A'*A)*A'*L;
    Xx=X0+deltx;
    
    if abs(deltx(1,1)+deltx(2,1)+deltx(3,1)+deltx(4,1)+deltx(5,1))<0.0001 || COUNT>500
        break;
    end
    COUNT=COUNT+1;
end
if COUNT<500
coefficient_new=Xx;
else
coefficient_new(1,1)=coefficient_yaoyibin(1,1);
coefficient_new(2,1)=coefficient_yaoyibin(2,1);
coefficient_new(3,1)=pi/10; 
coefficient_new(4,1)=coefficient_yaoyibin(3,1); 
coefficient_new(5,1)=coefficient_yaoyibin(4,1);
end
end