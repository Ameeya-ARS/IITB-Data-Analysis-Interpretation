rng(0);
N=[5, 10, 20, 40, 60, 80, 100, 500, 1000 , 10000];
M=199;
alpha = 5.5;
beta = 1;
lambda_ml = zeros(M,size(N,2));
lambda_bays = zeros(M,size(N,2));

for i=1:size(N,2)
	for j=1:M
		x = rand(N(i),1);
		data = -(1/5)*log(x);
		lambda_ml(j,i) = 1/mean(data); 
		lambda_bays(j,i) = (alpha/N(i) + 1)/(beta/N(i) + mean(data));
	end
end

figure(1);
boxplot(abs(lambda_ml-5)/5,'Labels',N);
title('Error for MLE');
xlabel('Values of N');
ylabel('Relative Error');
saveas(figure(1),'../results/ques2_MLE.png')

figure(2);
boxplot(abs(lambda_bays-5)/5,'Labels',N);
title('Error for Posterior Mean Estimate');
xlabel('Values of N');
ylabel('Relative Error');
saveas(figure(2),'../results/ques2_PME.png')

% Code for drawing the main common boxplot figure
Data1 = abs(lambda_ml-5)/5; % Dataset for MLE
Data2 = abs(lambda_bays-5)/5; % Dataset for PME
Data = {Data1 Data2}; 
legendEntries = {'MLE' 'PME'};
Colors = {'r' 'b'};

delta = linspace(-.15,.15,2); %// define offsets to distinguish plots
width = .2; %// small width to avoid overlap
figure(3);
hold on;

for k=1:2
    labels = N; %// center plot: use real labels
    boxplot(Data{k},'Color', Colors{k},  ...
        'position',(1:numel(labels))+delta(k), 'widths',width, 'labels',labels)
        %// plot boxes with specified positions, widths, labels
    plot(NaN,1,'color',Colors{k}); %// dummy plot for legend
end
title('Error Comparision for MLE and PME');
xlabel('Values of N'); ylabel('Relative Error');
xlim([1+2*delta(1) numel(labels)+2*delta(2)]) % Adjust x limits
legend(legendEntries);
saveas(figure(3),'../results/ques2_MAIN.png')