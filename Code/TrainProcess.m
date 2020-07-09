function [result,W,data_mean] = TrainProcess(raw_data)
global refer
[w,h,type,num]=size(raw_data);
% D_data =zeros(w*h/2,type*num);
D_data =zeros(w*h,type*num);
p_k=95;

%% To turn Image data manifesting in form of 2-D vector into One dimensional form. 
for i = 1:num
    for j = 1:type
        tmp =raw_data(:,:,j,i);
        tmp = Transform(tmp,5,80,300);
     
        %---
        %tmp = tmp(1:512);
        %---
        
        D_data(:,j+type*(i-1)) = tmp;
    end
end
%% To generate and tackle with the covariance matrix.
c_num=size(D_data,2);
data_mean = mean(D_data,2);
for k = 1:c_num
    D_data(:,k) =D_data(:,k) -data_mean;
end
T=D_data'*D_data;
%% PCA process

[COEFF, latent, explained] = pcacov(T);  %#ok<ASGLU>
tmp = 1;
p = 0;
while(p < p_k)
    p = p + explained(tmp);
    tmp= tmp+1;
end
p = tmp - 1;

W = D_data*COEFF;
W = W(:,1:p);
refer =  W'*D_data;

result = refer;

