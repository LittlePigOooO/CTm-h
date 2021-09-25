function  data = Prepare_coefficient_all( pre_data )



for j=1:1:size(pre_data,2) 
 for i=1:1:size(pre_data,1)   
    
     if isnan(pre_data(i,j))
        pre_data(i,j)=pre_data(i-1,j);
     end  
 end
end


 for j=1:1:size(pre_data,2)
    for i=1:1:size(pre_data,1)
        stderror=std(pre_data(:,j));
        aveerror=mean(pre_data(:,j));
        if abs(pre_data(i,j)-aveerror)> 3*stderror       
            pre_data(i,j)=aveerror;      
        end
    end
 end
    
    data=pre_data;
end

