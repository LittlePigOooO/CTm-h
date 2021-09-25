
function  coeffcient_a  = LSH_LSQ( Tm,TIME ) 


%for i=1:5 %size(Factor_all,1)
%    L0(i,1)=cos(2*pi*(TIME(i,1))/365.25);
%    L0(i,2)=sin(2*pi*(TIME(i,1))/365.25);
%    L0(i,3)=cos(4*pi*TIME(i,1)/365.25);
%    L0(i,4)=sin(4*pi*TIME(i,1)/365.25);
%    L0(i,5)=1;
%    Tm0(i,1)=Tm(i,1);
%end
%Xx=inv(L0)*Tm0;    %chuzhi
Xx=[0.5,0.1,0.3,0.5,200]';



A=zeros(size(TIME,1),1);
L=zeros(size(TIME,1),1);

while true
    
    X0=Xx;
    for i=1:size(TIME,1)
    A(i,1)=cos(2*pi*(TIME(i,1))/365.25);
    A(i,2)=sin(2*pi*(TIME(i,1))/365.25);
    A(i,3)=cos(4*pi*TIME(i,1)/365.25);
    A(i,4)=sin(4*pi*TIME(i,1)/365.25);
    A(i,5)=1;
    L(i,1)=Tm(i,1)-(X0(1,1)*cos(2*pi*(TIME(i,1))/365.25)+X0(2,1)*sin(2*pi*(TIME(i,1))/365.25)+X0(3,1)*cos(4*pi*(TIME(i,1))/365.25)+X0(4,1)*cos(4*pi*(TIME(i,1))/365.25)+X0(5,1));
    end
    deltx=inv(A'*A)*A'*L;
    Xx=X0+deltx;
    if abs(deltx(1,1)+deltx(2,1)+deltx(3,1)+deltx(4,1)+deltx(5,1))<0.0001
        break;
    end    
end


sum=0;
for jj=1:size(L,1)
    
    sum=sum+power(L(jj),2);  
end
coeffcient_a=sqrt( sum/size(L,1))
coeffcient_a=Xx;
y=X0(1,1)*cos(2*pi*(TIME(:,1))/365.25)+X0(2,1)*sin(2*pi*(TIME(:,1))/365.25)+X0(3,1)*cos(4*pi*(TIME(:,1))/365.25)+X0(4,1)*cos(4*pi*(TIME(:,1))/365.25)+X0(5,1);
plot(Tm,'+');
hold on
plot(y,'o');

end
