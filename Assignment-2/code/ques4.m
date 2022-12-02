rng(0);
A = importdata('../data/mnist.mat');
digits_train = (A.digits_train);
digits_test =  (A.digits_test);
labels_train = (A.labels_train);
labels_test = (A.labels_test);

images_data = digits_train;
images_data = reshape(images_data, 784, 60000);
images_data = double(transpose(images_data))/255;
sorted_lambdas = [];
p = 1;
for i=0:9
   % To store the image data for all images of a single digit
   image = images_data(labels_train==i,:);
   
   mu = sum(image,1)/size(image,1); % Calculating the mean of the matrix
   C = covariance(image);% To find the covariance of the matrix
   [V,D] = eig(C);
   lambdas = diag(D); % Contains all the eigen values from the diagonal matrix
   [lambda, id] = max(lambdas); % To find the largest eigen value
   v = V(:,id); % To find the largest eigen vector
   
   % To sort the eigen values in descending order
   sorted_lambdas = [sorted_lambdas sort(lambdas,'descend')]; 
   
    subplot(5,6,p);
    imshow(reshape(transpose(mu)-sqrt(lambda)*v,28,28));
    title('(a)');
    p = p+1;
    
    subplot(5,6,p);
    imshow(reshape(mu,28,28));
    title('(b)');
    p = p+1;
    
    subplot(5,6,p);
    imshow(reshape(transpose(mu)+sqrt(lambda)*v,28,28));
    title('(c)');
    p = p+1;
   
end
saveas(figure(1),'../results/ques4_comparision.png')

figure(11);
plot(1:28*28, sorted_lambdas);
title('Sorted Eigenvalues');
xlabel('No of Eigen values');
ylabel('Eigen value');
legend('0','1','2','3','4','5','6','7','8','9');
saveas(figure(11),'../results/ques4_sorted_eigen.png')

% To calculate the no of eigen values for 90% of the data
for i = 0:9
    t = 1;
    while( sum(sorted_lambdas(1:t,i+1))/sum(sorted_lambdas(:,i+1)) < .90)
        t = t + 1;
    end
    fprintf('For %d, no. of significant modes of variation = %d\n',i,t);
	fprintf('Smallest significant eigenvalue=%f \n \n',sorted_lambdas(t,i+1)); 
end

% Function to calculate the covariance of a matrix
function final = covariance(M)
    Nrows = size(M,1);
    one = ones(Nrows,1);
    x = M - ((one*transpose(one)*M)/Nrows);
    final = (transpose(x)*x)/Nrows;
end