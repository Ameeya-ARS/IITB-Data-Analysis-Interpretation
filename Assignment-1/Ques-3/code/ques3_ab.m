x = zeros(10000,1000);
A = zeros(1000);
rng('default');
rng(0);
for i=1:10000
    for j=1:1000
        if(j==1)
            x(i,j)= ((randi([0,1])*2 -1)*0.001);
        else
            x(i,j)=x(i,j-1)+((randi([0,1])*2 -1)*0.001);
        end
        if(i<=1000)
            A(i,j)=x(i,j);
        end
        
    end
end
location = zeros(1,10000);
for i=1:10000
    location(1,i)=x(i,1000);
end
disp('Mean of final locations : ')
disp(mean(location))
disp('Variance of the final locations : ')
disp(var(location))
fig1 = figure;
plot(A')
xlabel('Time')
ylabel('Location')
saveas(fig1,'ques3_space_time.png');
fig2 = figure;
hist(location);
saveas(fig2,'ques3_histogram.png')