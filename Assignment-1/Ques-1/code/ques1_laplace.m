m=2;
b=2;
n = 1000000;

x = linspace(-25,25,n);
y = 0.5/b * exp(-abs(x-m)*1.0/b);
z = 0.5*sign(x-m).*(1-(exp(-abs(x-m)/b))) + 0.5;

val_xy = (50.0/n)*x.*y;
E_x = sum(val_xy);
val_x2y = x.*val_xy;
E_x2 = sum(val_x2y);
variance = E_x2 - (E_x*E_x);

disp(variance);

fig1=figure;
plot(x,y,'r','DisplayName','m=2,b=2');
xlabel('x');
ylabel('Output Value');
legend;
saveas(fig1,'laplace_PDF.png')

fig2=figure;
plot(x,z,'r','DisplayName','m=2,b=2');
xlabel('x');
ylabel('Output Value');
legend('Location','northwest');
saveas(fig2,'laplace_CDF.png')
