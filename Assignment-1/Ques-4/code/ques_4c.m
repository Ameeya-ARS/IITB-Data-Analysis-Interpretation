N=64;
n = 100000;
lower = -1;
upper = 1;
x = linspace(lower,upper,n);
y = zeros(N,n);
changed=zeros(N,n);
final = zeros(1,n);
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
        final(1,i)=final(1,i)+changed(k,i);
    end
    final(1,i)=final(1,i)*1.0/N;
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