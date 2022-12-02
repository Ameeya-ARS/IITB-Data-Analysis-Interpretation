rng(0);
N=[5, 10, 20, 40, 60, 80, 100, 500, 1000 , 10000];
M=199;
mu_ml = zeros(size(N,2),M);
mu_map1 = zeros(size(N,2),M);
mu_map2 = zeros(size(N,2),M);

for i=1:size(N,2)
	for j=1:M
		data = (randn(N(i),1)*4)+10;
		mu_ml(i,j) = mean(data);
		mu_map1(i,j) = (mean(data)+16*10.5/N(i))/(1+16/N(i));
		mu_map2(i,j) = min(max(mean(data),9.5),11.5);
	end
end

figure(1);
boxplot(abs(mu_ml.'-10)/10,'Labels',N);
title('Error for MLE');
xlabel('Values of N');
ylabel('Relative Error');
saveas(figure(1),'../results/ques1_MLE.png')

figure(2);
boxplot(abs(mu_map1.'-10)/10,'Labels',N);
title('Error for MAP1');
xlabel('Values of N');
ylabel('Relative Error');
saveas(figure(2),'../results/ques1_MAP1.png')

figure(3);
boxplot(abs(mu_map2.'-10)/10,'Labels',N);
title('Error for MAP2');
xlabel('Values of N');
ylabel('Relative Error');
saveas(figure(3),'../results/ques1_MAP2.png')

% Code for drawing the main common boxplot figure
Data1 = abs(mu_ml.'-10)/10; % Dataset for MLE
Data2 = abs(mu_map1.'-10)/10; % Dataset for MAP1
Data3 = abs(mu_map2.'-10)/10; % Dataset for MAP2
Data = {Data1 Data2 Data3}; 
legendEntries = {'mle' 'map1' 'map2'};
Colors = {'r' 'g' 'b'};

delta = linspace(-.3,.3,3); %// define offsets to distinguish plots
width = .2; %// small width to avoid overlap
figure(4);
hold on;

for k=1:3
    labels = N; %// center plot: use real labels
    boxplot(Data{k},'Color', Colors{k},  ...
        'position',(1:numel(labels))+delta(k), 'widths',width, 'labels',labels)
        %// plot boxes with specified positions, widths, labels
    plot(NaN,1,'color',Colors{k}); %// dummy plot for legend
end
title('Error Comparision for Different Cases');
xlabel('Values of N'); ylabel('Relative Error');
xlim([1+2*delta(1) numel(labels)+2*delta(3)]) % Adjust x limits
ylim([0,0.6]) % Adjust y limits
legend(legendEntries);
saveas(figure(4),'../results/ques1_MAIN.png')