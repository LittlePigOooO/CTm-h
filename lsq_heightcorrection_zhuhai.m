function  coefficient_zhuhai  = lsq_heightcorrection_zhuhai( Pre_height_lsq,coefficient_yaoyibin )

%for i=1:5 %size(Pre_height_lsq,1)
%    L0(i,1)=Pre_height_lsq(i,1);
%    L0(i,2)=cos(2*pi*Pre_height_lsq(i,1)/20);
%    L0(i,3)=(coefficient_yaoyibin(2,1)*sin(2*pi*Pre_height_lsq(i,1)/20)*2*pi*Pre_height_lsq(i,1)/400)+(coefficient_yaoyibin(3,1)*cos(2*pi*Pre_height_lsq(i,1)/20)*2*pi*Pre_height_lsq(i,1)*(-1)/400);
%    L0(i,4)=sin(2*pi*Pre_height_lsq(i,1)/20);
%    L0(i,5)=1;
%    dTm0(i,1)=Pre_height_lsq(i,2); %Tm
%end
%Xx=inv(L0)*dTm0;    %chuzhi

count=0;
Xx(1,1)=coefficient_yaoyibin(1,1);
Xx(2,1)=coefficient_yaoyibin(2,1);
Xx(3,1)=20;
Xx(4,1)=coefficient_yaoyibin(3,1);
Xx(5,1)=coefficient_yaoyibin(4,1); 

while true
    
    X0=Xx;
    for i=1:size(Pre_height_lsq,1)
    A(i,1)=Pre_height_lsq(i,1); 
    A(i,2)=cos(2*pi*Pre_height_lsq(i,1)/X0(3,1));     
    A(i,3)=(X0(2,1)*sin(2*pi*Pre_height_lsq(i,1)/X0(3,1))*2*pi*Pre_height_lsq(i,1)/(X0(3,1)*X0(3,1)))+(X0(4,1)*cos(2*pi*Pre_height_lsq(i,1)/X0(3,1))*2*pi*Pre_height_lsq(i,1)*(-1)/(X0(3,1)*X0(3,1)));         
    A(i,4)=sin(2*pi*Pre_height_lsq(i,1)/X0(3,1));
    A(i,5)=1;
   
    
    %L(i,1)=Pre_height_lsq(i,2)-(X0(1,1)*Pre_height_lsq(i,1)+X0(2,1)*cos(2*pi*Pre_height_lsq(i,1)/20)+X0(4,1)*sin(2*pi*Pre_height_lsq(i,1)/20)+X0(5,1)); 
    L(i,1)=Pre_height_lsq(i,2)-(X0(1,1)*Pre_height_lsq(i,1)+X0(2,1)*cos(2*pi*Pre_height_lsq(i,1)/X0(3,1))+X0(4,1)*sin(2*pi*Pre_height_lsq(i,1)/X0(3,1))+X0(5,1));  
    end
    deltx=inv(A'*A)*A'*L;
    Xx=X0+deltx;
    count=count+1;
    if abs(deltx(1,1)+deltx(2,1)+deltx(3,1)+deltx(4,1)+deltx(5,1))<0.00001 || count >20
        break;
    end    
end

coefficient_zhuhai=Xx;
%coefficient_zhuhai(1,1)=Xx(1,1);
%coefficient_zhuhai(2,1)=Xx(2,1)+coefficient_yaoyibin(2,1);
%coefficient_zhuhai(3,1)=Xx(3,1)+20;
%coefficient_zhuhai(4,1)=Xx(4,1)+coefficient_yaoyibin(3,1);
%coefficient_zhuhai(5,1)=Xx(5,1);


%Draw_picture( Pre_height_lsq,coefficient_yaoyibin,coefficient_zhuhai );


end

