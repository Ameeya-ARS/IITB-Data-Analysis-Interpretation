m=0;
g=1;
n = 1000;

x = linspace(-5,5,n);
y = (1/pi*g)*((g*g)./((g*g)+((x-m).*(x-m))));
z = atan((x-m)/g)/pi + 0.5;

fig1 = figure;
plot(x,y,'r','DisplayName','m=0,b=1');
xlabel('x');
ylabel('Output Value');
legend;
saveas(fig1,'cauchy_PDF.png')

fig2 = figure;
plot(x,z,'r','DisplayName','m=0,b=1');
xlabel('x');
ylabel('Output Value');
legend('Location','northwest');
saveas(fig2,'cauchy_CDF.png')