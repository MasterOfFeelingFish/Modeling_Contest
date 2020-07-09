%%load data
clc;

load('Data.mat')
size(Test_facemask)
for m = 1:5
    for i = 1:3
        subplot(10,3,i+3*m-3);
        imshow(mat2gray(Train_DAT(:,:,i,m)))
    end
end





