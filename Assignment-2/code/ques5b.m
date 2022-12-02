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
   image = images_data(labels_train==i,:);
   image_comp = image(1,:);
   mu = sum(image,1)/size(image,1); % Calculating the mean of a matrix
   C = covariance(image);
   [V,D] = eig(C);
   lambdas = diag(D);
   final_Data = mu;
   % Considering only the largest 84 eigenvectors out of 784
   for j=784:701
       final_Data = final_Data + transpose(lambdas(j)*V(:,j));
   end
   subplot(5,4,p);
   imshow(reshape(image_comp,28,28));
   title('(a)');
   p=p+1;
   
   subplot(5,4,p);
   imshow(reshape(final_Data,28,28));
   title('(b)');
   p=p+1;
end
saveas(gcf,'../results/ques5.png');

% Function to calculate the covariance of a matrix
function final = covariance(M)
    Nrows = size(M,1);
    one = ones(Nrows,1);
    x = M - ((one*transpose(one)*M)/Nrows);
    final = (transpose(x)*x)/Nrows;
end