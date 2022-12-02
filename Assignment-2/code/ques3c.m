A = importdata('../data/points2D_Set2.mat');
disp(A);
X = A.x;
Y = A.y;
M = [X,Y];
C = covariance(M);
[V,D] = eigs(C,2);
mu = cal_mean(M);
% To calculate the two endpoints of the required line
end_pt_1 = mu + D(1,1)*V(:,1);
end_pt_2 = mu - D(1,1)*V(:,1);

figure(1);
scatter(X,Y);
hold on;
plot([end_pt_1(1,1),end_pt_2(1,1)],[end_pt_1(2,1),end_pt_2(2,1)],'r','LineWidth',2);
saveas(figure(1),'../results/ques3_set2.png')

% Function to calculate the covariance of a matrix
function final = covariance(M)
    one = ones(1000,1);
    x = M - ((one*transpose(one)*M)/1000);
    final = (transpose(x)*x)/1000;
end
% Function to return the transpose of mean of a matrix
function final = cal_mean(M)
    total_x = 0; total_y = 0;
    for i=1:1000
        total_x = total_x + M(i,1);
        total_y = total_y + M(i,2);
    end
    mean_x = total_x/1000;
    mean_y = total_y/1000;
    final = [mean_x;mean_y];
end