rng(0);
a_x = pi; a_y = 0; % x any y coordinates of vector a
b_x = pi/3; b_y = exp(1); % x and y coordinates of vector 

N = 10000000; % no of random points to be generated

k1 = rand(1,N);
k2 = rand(1,N);

% Checking if the point lies in the required region
for i=1:N
    if((k1(1,i)+k2(1,i))>1)
        k1(1,i)=1-k1(1,i);
        k2(1,i)=1-k2(1,i);
    end
end

X = (k1*a_x) + (k2*b_x);
Y = (k1*a_y) + (k2*b_y);
h = histogram2(X,Y,'DisplayStyle','tile','FaceColor','flat');
colorbar;
saveas(gcf,'../results/Ques1_triangle.png')
