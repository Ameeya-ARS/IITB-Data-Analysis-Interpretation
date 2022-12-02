rng('default');
rng(0);
n = 100000;
lower = -1;
upper = 1;
x = linspace(lower,upper,n);
rand_no = (0.5*rand(1,n));
y = zeros(1,n);
z = zeros(1,n);
for i=1:n
    if(abs(x(1,i))<=1)
        y(1,i) = invCDF(x(1,i),rand_no(1,i));
    end
end
for i=1:n
    for j=1:n
        if(y(1,j)<=x(1,i))
            z(1,i)=z(1,i)+1;
        end
    end
    z(1,i)=z(1,i)*1.0/n;
end


fig1 = figure;
histogram(y,200);
saveas(fig1,'histogram_4b.png')

fig2=figure;
plot(x,z,'r','DisplayName','CDF');
xlabel('x');
ylabel('Output Value');
saveas(fig2,'CDF_4b.png')


function ans = invCDF(x,u)
ans = 0;
if(x<=0)
    ans = -1.0*sqrt(1-2*u);
end
if(x>0)
    ans = sqrt(2*(u+0.5)-1);
end
end