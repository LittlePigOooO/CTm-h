function [ neibourgrid ] = Find_neibourgrid( Xcoord,Ycoord,resolution )


%resolution=0.25;


tempX=Xcoord/resolution;
tempX_int_min=floor(tempX);
tempX_int_max=ceil(tempX);

tempY=Ycoord/resolution;
tempY_int_min=floor(tempY);
tempY_int_max=ceil(tempY);

neibourgrid(1,1)=tempX_int_min*resolution;
neibourgrid(1,2)=tempY_int_min*resolution;

neibourgrid(2,1)=tempX_int_max*resolution;
neibourgrid(2,2)=tempY_int_min*resolution;


neibourgrid(3,1)=tempX_int_min*resolution;
neibourgrid(3,2)=tempY_int_max*resolution;


neibourgrid(4,1)=tempX_int_max*resolution;
neibourgrid(4,2)=tempY_int_max*resolution;






end
