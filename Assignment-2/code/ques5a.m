A = importdata('../data/mnist.mat');
digits_train = (A.digits_train);
digits_test =  (A.digits_test);
labels_train = (A.labels_train);
labels_test = (A.labels_test);

images_data = digits_train;
images_data = reshape(images_data, 784, 60000);
images_data = double(transpose(images_data))/255;
final_Data = ones(10,784,84);
for i=0:9
   image = images_data(labels_train==i,:);
   image_comp = image(1,:);
   mu = sum(image,1)/size(image,1);
   C = covariance(image);
   [V,D] = eigs(C,84);
   final_Data(i+1,:,:) = V;
end


% Function to calculate the covariance of a matrix
function final = covariance(M)
    Nrows = size(M,1);
    one = ones(Nrows,1);
    x = M - ((one*transpose(one)*M)/Nrows);
    final = (transpose(x)*x)/Nrows;
end