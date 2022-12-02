rng('default');
rng(0);
n = 100000;
lower = -1;
upper = 1;
x = linspace(lower,upper,n);
rand_no = (0.5*rand(1,n));
y = zeros(1,n);
for i=1:n
    if(abs(x(1,i))<=1)
        y(1,i) = invCDF(x(1,i),rand_no(1,i));
    end
end
function ans = invCDF(x,u)
ans = 0;
if(x<=0)
    ans = -1.0*sqrt(1-2*u);
end
if(x>0)
    ans = sqrt(2*(u+0.5)-1);
end
end