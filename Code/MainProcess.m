% Load the data.
load('Data.mat')

global train_date;
global W;

[train_date,W,d_mean]=TrainProcess(mat2gray(Train_DAT(:,:,1,1:100)));

t_ans = 0;

wrong = 0;

for i = 1:100
    for j= 1:3
        test = mat2gray(Train_DAT(:,:,j,i));
        
        o_test = Transform(test,4.5,80,320);
        
        %---
        
        %o_test =o_test(1:512);
        
        %---
        
        o_test = W'*(o_test - d_mean);
        r_min =100000;
        r_order = -1;
        for k = 1:100
            tmp= norm(o_test - train_date(:,k));
            if tmp < r_min
                r_min = tmp;
                r_order= k;
            end
        end
        if i~= r_order
            wrong= wrong+1;
        end
        
    end
end

disp((double(300)-wrong)/300.0);


%% @deprecated
%
% for i = 1:100
%     for j = 1:3
%         test = mat2gray(Test_facemask(:,:,j,i));
%         test =test';
%         o_test = test(:);
%         o_test = W'*(o_test - d_mean);
%         t_ans = 0;
%         for k = 1:6
%             t_ans = t_ans+norm(o_test - train_date(:,(i-1)*6+k));
%         end
%         tmp_min = 1000000;
%         for k = 1:100
%             tmp = 0;
%             for m = 1:6
%                 tmp = tmp +norm(o_test - train_date(:,(k-1)*6+m));
%             end
%             if(tmp<tmp_min)
%                 tmp_min = tmp;
%             end
%         end
%
%         if(tmp_min~=t_ans)
%             wrong=wrong+1;
%         end
%     end
%
%
% end
% disp((double(300)-wrong)/300.0);