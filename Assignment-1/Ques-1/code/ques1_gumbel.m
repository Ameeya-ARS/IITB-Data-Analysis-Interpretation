m=1;
b=2;
n = 100000;

x = linspace(-15,25,n);
y = (1.0/b)*exp(-(((x-m)/b)+exp(-((x-m)/b))));
w = linspace(-5,20,n);
z = exp(-1*exp( -1*(w-m)/b));

val_xy = (40.0/n)*x.*y;
E_x = sum(val_xy);
val_x2y = x.*val_xy;
E_x2 = sum(val_x2y);
variance = E_x2 - (E_x*E_x);
disp(variance);

fig1 = figure;
plot(x,y,'r','DisplayName','m=1,b=2');
xlabel('x');
ylabel('Output Value');
legend;
saveas(fig1,'gumbel_PDF.png')

fig2 = figure;
plot(w,z,'r','DisplayName','m=1,b=2');
xlabel('x');
ylabel('Output Value');
legend('Location','northwest');
saveas(fig2,'gumbel_CDF.png')