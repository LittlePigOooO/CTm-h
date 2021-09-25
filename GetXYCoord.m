function [xlat ylon]=GetXYCoord(TotalNum,NumLine,NumCol,minlat,maxlat,minlon,maxlon)
% this function to generate the latitude and longitude coordinate for
% interseting area.
%
%                    Hai Zhu       2021-09-25
%**************************************************************************
if TotalNum~=NumLine*NumCol
   error('Maybe your input is not right, please to check it.');
end
index=1; 
xx=linspace(maxlat,minlat,NumLine);
yy=linspace(minlon,maxlon,NumCol);
xlat=zeros(TotalNum,1);
ylon=zeros(TotalNum,1);
for ii=1:NumLine
xlat(index:index+NumCol-1)=xx(ii);
ylon(index:index+NumCol-1)=yy';
index=index+NumCol;
end
   
