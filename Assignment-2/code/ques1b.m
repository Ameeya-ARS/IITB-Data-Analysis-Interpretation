rng(0);
P = 1; % Major axis of ellipse
Q = 0.5; % Minor axis of ellipse
N = 10000000; % Number of random points to be generated

theta = 2*pi*rand(1,N); % generating uniform random values for theta
n = sqrt(rand(1,N)); % generating uniform random values for n^2

x = P*n.*cos(theta); % Calculating values of x to be plotted
y = Q*n.*sin(theta); % Calculating values of y to be plottedh = 
h = histogram2(x,y,'DisplayStyle','tile','FaceColor','flat');
colorbar;
saveas(gcf,'../results/Ques1_ellipse.png')