function [result] = Transform(data,alpha,b,k)
%% Common Process Part
data = data';
data = data(:);
result =data;
if alpha == 0
    return ;
end

%% Special Process Part
for i = b:k
    data(i) = (1+alpha)*data(i);
end

%%
result = data;

