function  coefficient_cos  = lsq_heightcorrection_cos( Pre_height_lsq,coefficient_yaoyibin )

%for i=1:4 %size(Pre_height_lsq,1)
%    L0(i,1)=Pre_height_lsq(i,1);
%    L0(i,2)=cos(2*pi*Pre_height_lsq(i,1)/20);
%    L0(i,3)=(coefficient_yaoyibin(2,1)*sin(2*pi*Pre_height_lsq(i,1)/20)*2*pi*Pre_height_lsq(i,1)/400);
%    L0(i,4)=1;
%    dTm0(i,1)=Pre_height_lsq(i,2); %Tm
%end
%Xx=inv(L0)*dTm0;    %chuzhi

Xx(1,1)=coefficient_yaoyibin(1,1);
Xx(2,1)=coefficient_yaoyibin(2,1);
Xx(3,1)=20;
Xx(4,1)=coefficient_yaoyibin(4,1);
count=1;



while true
    
    X0=Xx;
    for i=1:size(Pre_height_lsq,1)
    A(i,1)=Pre_height_lsq(i,1); 
    A(i,2)=cos(2*pi*Pre_height_lsq(i,1)/X0(3,1));     
    A(i,3)=(X0(2,1)*sin(2*pi*Pre_height_lsq(i,1)/X0(3,1))*2*pi*Pre_height_lsq(i,1)/(X0(3,1)*X0(3,1)));
    A(i,4)=1;
    L(i,1)=Pre_height_lsq(i,2)-(X0(1,1)*Pre_height_lsq(i,1)+X0(2,1)*cos(2*pi*Pre_height_lsq(i,1)/X0(3,1))+X0(4,1));  
    end
    deltx=inv(A'*A)*A'*L;
    Xx=X0+deltx;
    %if abs(deltx(1,1)+deltx(2,1)+deltx(3,1)+deltx(4,1))<0.0001
     if abs(deltx(1,1)+deltx(2,1)+deltx(3,1)+deltx(4,1))<0.0001 || count>50
        break;
    end  
    count=count+1;
end
%if count>50
%coefficient_cos=lsq_heightcorrection_yaoyibin( Pre_height_lsq );

%else
    coefficient_cos=Xx;
    
%end


end