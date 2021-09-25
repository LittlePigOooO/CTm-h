output_dir='F:\ECMWF_China\pressure\Results\';     %output file directory
gptput_dir='F:\ECMWF_China\pressure\txt\';
%latitude=55:-0.25:20;
%latitude=latitude';
%longitude=70:0.25:140;
%longitude=longitude';
%load('TIME_2018.mat');
latitude=15:0.5:55; latitude=latitude'; longitude=70:0.5:140; longitude=longitude';
[X,Y] = meshgrid(longitude',latitude'); %²úÉúlength(x)¸öÁÐ£¬length(y)¸öÐÐ£¬5x9
[xlat ylon]=GetXYCoord(size(latitude,1)*size(longitude,1),size(latitude,1),size(longitude,1),latitude(size(latitude,1)),latitude(1),longitude(1),longitude(size(longitude,1)));
%RBS=zeros(size(latitude,1)*size(longitude,1),6);
%COEFFCIENT=zeros(size(latitude,1)*size(longitude,1),5);
for ii=1:1:size(latitude,1)*size(longitude,1)

    %Tm
    Tmname=([output_dir,'grid-Tm-',num2str(xlat(ii,1)),'-',num2str(ylon(ii,1)),'.mat']); 
    load(Tmname);
    
    
    %load coefficient
    gptname=([gptput_dir,'gpt',num2str(xlat(ii,1)),'-',num2str(ylon(ii,1)),'.txt']);
    GPT2=load(gptname);
    
   
    v=GPT2(:,3)-H_Tm(:,2);
    Bias=1/size(GPT2,1)*sum(v);
    for i=1:1:size(v,1)
        bias2(i,1)=v(i,1)*v(i,1);
    end
    RMS=   sqrt( 1/size(GPT2,1)*sum(bias2));
   v2=v-mean(v);
    for i=1:1:size(v2,1)
        std2(i,1)=v2(i,1)*v2(i,1);
    end
        %STD=   sqrt( 1/size(Tm_Nonliner,1)*sum(std2));
STD=std(v);
    
    RBS(ii,1)=xlat(ii,1);
    RBS(ii,2)=ylon(ii,1);
    RBS(ii,3)=Bias;
    RBS(ii,4)=STD;
    RBS(ii,5)=RMS;

    %save(coeffname,'coefficient');
    

   
end
