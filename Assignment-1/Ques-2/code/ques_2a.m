rng default;
rng(0);
poiss_x = poissrnd(3,[1 1000000]);
poiss_y = poissrnd(4,[1,1000000]);
poiss_rough_z = poiss_x + poiss_y;
P_z_estimate = zeros(1,26);
P_z = zeros(1,26);
for k=1:26
    for i=1:1000000
        if(poiss_rough_z(1,i)==k-1)
            P_z_estimate(1,k) = P_z_estimate(1,k)+1;
        end
    end
    P_z(1,k) = ((7^(k-1))*exp(-7))/factorial(k-1);
    P_z_estimate(1,k) = P_z_estimate(1,k)*1.0/1000000;
end
