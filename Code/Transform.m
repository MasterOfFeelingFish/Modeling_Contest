function [result] = Transform(data,alpha,b,k)
%% Common Process Part
data = data';
data = data(:);
result =data;
if alpha == 0
    return ;
end

%% Special Process Part

data(b:k) = (1+alpha)*data(b:k);


%%
result = data;

