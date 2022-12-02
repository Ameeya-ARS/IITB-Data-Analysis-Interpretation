mean_value = zeros(100,10);
rng('default');
rng(0);
N1 = randn(100,5);
N2 = randn(100,10);
N3 = randn(100,20);
N4 = randn(100,40);
N5 = randn(100,60);
N6 = randn(100,80);
N7 = randn(100,100);
N8 = randn(100,500);
N9 = randn(100,1000);
N10 = randn(100,10000);
mean_value(:,1) = mean(N1,2);
mean_value(:,2) = mean(N2,2);
mean_value(:,3) = mean(N3,2);
mean_value(:,4) = mean(N4,2);
mean_value(:,5) = mean(N5,2);
mean_value(:,6) = mean(N6,2);
mean_value(:,7) = mean(N7,2);
mean_value(:,8) = mean(N8,2);
mean_value(:,9) = mean(N9,2);
mean_value(:,10) = mean(N10,2);
error = abs(mean_value - 0.0);

fig = figure;
boxplot(error);
saveas(fig,'boxplot_5b.png')
