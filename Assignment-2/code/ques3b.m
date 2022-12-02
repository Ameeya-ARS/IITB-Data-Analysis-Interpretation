A = importdata('../data/points2D_Set1.mat');
M = [A.x,A.y];
C = covariance(M);
[V,D] = eigs(C,2);
mu = cal_mean(M);
% To calculate the two endpoints of the required line
end_pt_1 = mu + 3*D(1,1)*V(:,1);
end_pt_2 = mu - 3*D(1,1)*V(:,1);

figure(1);
scatter(A.x,A.y);
hold on;
plot([end_pt_1(1,1),end_pt_2(1,1)],[end_pt_1(2,1),end_pt_2(2,1)],'r','LineWidth',2);
saveas(figure(1),'../results/ques3_set1.png')

% Function to calculate the covariance of a matrix
function final = covariance(M)
    one = ones(300,1);
    x = M - ((one*transpose(one)*M)/300);
    final = (transpose(x)*x)/300;
end
% Function to return the transpose of mean of a matrix
function final = cal_mean(M)
    total_x = 0; total_y = 0;
    for i=1:300
        total_x = total_x + M(i,1);
        total_y = total_y + M(i,2);
    end
    mean_x = total_x/300;
    mean_y = total_y/300;
    final = [mean_x;mean_y];
end