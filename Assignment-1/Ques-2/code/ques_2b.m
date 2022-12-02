rng default;
rng(0);
poiss_y = poissrnd(4,[1 100000]);
P_z = zeros(1,26);
for k=1:26
    for i=1:100000
        if(poiss_y(1,i)==k-1)
            P_z(1,k) = P_z(1,k)+1;
        end
    end
    P_z(1,k) = P_z(1,k)*1.0/100000;
end   
P_bin_z = zeros(1,26);
P_actual = zeros(1,26);
for i=1:26
    for j=i:26
        P_bin_z(1,i) = P_bin_z(1,i) + P_z(1,j)*prob(j,i,0.8);
    end
     P_actual(1,i) = ((3.2^(i-1))*exp(-3.2))/factorial(i-1);
end


function ans = prob(n,k,p)
ans = 0;
binornd_z = binornd(n,p,[1 100000]);
for i=1:100000
    if(binornd_z(1,i)==k)
        ans = ans + 1;
    end
end
ans = ans*1.0/100000;
end