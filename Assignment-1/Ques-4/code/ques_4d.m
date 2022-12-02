rng('default');
n = 10000;
final = zeros(64,n);
for p=1:64
    rng(p);
    N=p;
    lower = -1;
    upper = 1;
    x = linspace(lower,upper,n);
    y = zeros(N,n);
    changed=zeros(N,n);
    for k=1:N
        rng('default');
        rng(k);
        rand_no = (0.5*rand(1,n));
        for i=1:n
            if(abs(x(1,i))<=1)
                y(k,i) = invCDF(x(1,i),rand_no(1,i));
            end
        end
    end
    for k=1:N
        rng('default');
        rng(k);
        idx = randperm(n) ;
        for i=1:n
            changed(k,idx(1,i))=y(k,i); 
        end
    end
    for i=1:n
        for k=1:N
            final(p,i)=final(p,i)+changed(k,i);
        end
        final(p,i)=final(p,i)*1.0/N;
    end
end
fig = figure;
cdfplot(final(2,:));
hold on
cdfplot(final(4,:));
hold on
cdfplot(final(8,:));
hold on
cdfplot(final(16,:));
hold on
cdfplot(final(32,:));
hold on
cdfplot(final(64,:));
title('CDF for multiple N')
legend('N=2','N=4','N=8','N=16','N=32','N=64','Location','Best')
saveas(fig,'CDF_final.png')

function ans = invCDF(x,u)
ans = 0;
if(x<=0)
    ans = -1.0*sqrt(1-2*u);
end
if(x>0)
    ans = sqrt(2*(u+0.5)-1);
end
end