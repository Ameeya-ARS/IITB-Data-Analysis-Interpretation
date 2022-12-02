rng(0);
N_List = [10,100,1000,10000,100000];
% To store all errors for each experiment for each N
all_errors_mu=zeros(100,5); 
all_errors_C=zeros(100,5);
mu = [1;2]; % Mean Matrix
C = [1.6250,-1.9486;-1.9486,3.8750]; % Covariance Matrix
[V,D]=eig(C); % To store the eigen vectors and eigen values
A=V*D^(0.5); % Calculating A from C = A*transpose(A)
for i=1:size(N_List,2)
   N = N_List(1,i);
   % To store the errors for a particular N
   error_mu=zeros(100,1);
   error_C=zeros(100,1);
   % To repeat the experiment 100 times for each N
   for j=1:100
      X = bsxfun(@plus,A*randn(2,N),mu);
      mu_est = sum(X,2)/N;
      C_est=((bsxfun(@minus,X,mu_est))*transpose(bsxfun(@minus,X,mu_est)))/N;
      error_mu(j,1) = norm(mu-mu_est,2)/norm(mu,2);
      error_C(j,1) = norm(C-C_est,'fro')/norm(C,'fro');
      % For plotting a particular case from 100 cases
      if(j==50)
			figure(i+2);
			scatter(X(1,:),X(2,:),'b');
			[V1,D1]=eig(C_est);
			hold on;
			pt1=(mu_est+D1(1,1)*V1(:,1));
			pt2=(mu_est+D1(2,2)*V1(:,2));
			plot([mu_est(1),pt1(1)],[mu_est(2),pt1(2)],'r','LineWidth',2);
			plot([mu_est(1),pt2(1)],[mu_est(2),pt2(2)],'g','LineWidth',2);
			title(sprintf('Scatter plot with principal modes for N= %d ', N));
			xlabel('X coordinates');
			ylabel('Y coordinates');
			axis equal;
			hold off;
            saveas(figure(i+2),sprintf('../results/ques2_scatter_N_%d.png', N));
      end
   end
   all_errors_mu(:,i) = error_mu;
   all_errors_C(:,i) = error_C;
end
figure(1);
boxplot(all_errors_mu);
title('Error of MLE estimate of \mu vs log_1_0N');
xlabel('log_1_0N');
ylabel('Error between \mu and \mu_e_s_t');
saveas(figure(1),'../results/ques2_error_mean.png')
figure(2);
boxplot(all_errors_C);
title('Error of MLE estimate of C vs log_1_0N');
xlabel('log_1_0N');
ylabel('Error between C and C_e_s_t');
saveas(figure(2),'../results/ques2_error_C.png')