rng(0);

% Code for part a

img19200=zeros(19200,16); %matrix storing image as 19200x1
img_data=zeros(19200,1);
mu=zeros(19200,1);
for i=1:16 % convert images into matrix 
    temp=imread(strcat('../data/data_fruit/image_',int2str(i),'.png'));
    temp1=reshape(temp,19200,1); %Converting 3d array into column vector
    img_data=double(temp1);
    img19200(:,i)=img_data;
    mu=mu+img_data;
end

mu=mu/16;

m1=bsxfun(@minus,img19200,mu);
C=m1*m1.'; %the covariance matrix=U*transpose(U)

[V,D]=eigs(C,10); % find the top 10 eigen vectors

eig_vec4=V(:,4);
eig_vec3=V(:,3);
eig_vec2=V(:,2);
eig_vec1=V(:,1); 

subplot(2,3,1); 
imshow(rescale(reshape(mu,80,80,3))); 
title('mean');

subplot(2,3,2); 
imshow(rescale(reshape(eig_vec1,80,80,3))); 
title('vec1');

subplot(2,3,3); 
imshow(rescale(reshape(eig_vec2,80,80,3))); 
title('vec2');

subplot(2,3,5); 
imshow(rescale(reshape(eig_vec3,80,80,3))); 
title('vec3');

subplot(2,3,6); 
imshow(rescale(reshape(eig_vec4,80,80,3))); 
title('vec4');
saveas(gcf,'../results/ques6_mean_4eigenvecs.png');
lambdas10= zeros(10,1);
for i=1:10
    lambdas10(i)=D(i,i);
end
figure(2);
plot(lambdas10); %plot 10 eigen values 
saveas(figure(2),'../results/ques6_10eigenvalues.png');
% Code for part b

closest_rep=zeros(19200,16); %closest representation of each image 
for i=1:16
    x1=dot(img19200(:,i),eig_vec1);
    x2=dot(img19200(:,i),eig_vec2);
    m1=dot(mu,eig_vec1);
    m2=dot(mu,eig_vec2);
    m3=dot(mu,eig_vec3);
    x3=dot(img19200(:,i),eig_vec3);
    x4=dot(img19200(:,i),eig_vec4);
    m4=dot(mu,eig_vec4);
    k=(dot(img19200(:,i),mu)-x1*m1-x2*m2-x3*m3-x4*m4)/(dot(mu,mu)-m1*m1-m2*m2-m3*m3-m4*m4);%the coefficient of mean vector
    col_clos_rm=k*mu+(x1-m1*k)*eig_vec1+(x2-m2*k)*eig_vec2+(x3-m3*k)*eig_vec3+(x4-m4*k)*eig_vec4; %colm vector showing closest representation of the image
    closest_rep(:,i)=col_clos_rm;
end
 
for i=1:16
    figure(i+2);
    img2=rescale(reshape(closest_rep(:,i),80,80,3)); %Closest representation
    img1=rescale(reshape(img19200(:,i),80,80,3));
    
    subplot(1,2,1);imshow(img1);title('Original');
    subplot(1,2,2);imshow(img2);title('Closest');
    %disp(norm(reshape((img1-img2),6400,3),'fro')); 
    %To calculate norm of closest representation
    saveas(figure(i+2),strcat('../results/ques6_img_',int2str(i),'.png'));
end

%Code for part c
    figure(19);
    D1=D(1:4,1:4);
    U=V(:,1:4);
    S=D1^0.5;
    A= U*S*U.';
    %A=C^0.5
    
%To develop new fruit images that are not present already
for i=1:3
    w=randn(19200,1);
     
    X=mu+A*w; 
    img=rescale(reshape(X,80,80,3)); 
    subplot(1,3,i),imshow(img);
end
saveas(figure(19),'../results/ques6_newfruits.png');