
x = 3:100;
f = @(x)( sin(.05*x + .002*x.^2) .* (1 - x.*x/20000) );
fplot(f,[3 100])
hold on
f(x)
locmax=find(f(x)>=f(x-1) & f(x)>=f(x+1))
locmax=x(locmax)
ylocmax=f(locmax)
locmin=find(f(x)<=f(x-1) & f(x)<=f(x+1))
locmin=x(locmin)
ylocmin=f(locmin)
head=x(1)
bottom=x(length(x))
clc
fprintf('Local Maximum:\n')
for i=[1:length(locmax)]
    fprintf('( %f , %f )\n',locmax(i),ylocmax(i))
end
fprintf('Local Minimum:\n')
for i=[1:length(locmin)]
    fprintf('( %f , %f )\n',locmin(i),ylocmin(i))
end
fprintf('Monotonically increasing segments:\n')
    if(locmax(1)<locmin(1))
        fprintf(' %d > %d \n',head,locmax(1))
        for i=[2:length(locmax)]
            fprintf(' %d > %d \n',locmin(i-1),locmax(i))
        end
        if(bottom > locmin(i))
            fprintf(' %d > %d \n',locmin(i),bottom)
        end
    else
        for i=[1:length(locmax)]
            fprintf(' %d > %d \n',locmin(i),locmax(i))
        end
    end
        
    
    
fprintf('Monotonically decreasing segments:\n')
    if(locmax(1)<locmin(1))
        for i=[1:length(locmax)]
            fprintf(' %d > %d \n',locmax(i),locmin(i))
        end
    else 
        fprintf(' %d > %d \n',head,locmin(1))
        for i=[2:length(locmin)]
            fprintf(' %d > %d \n',locmax(i-1),locmin(i))
        end
        if(bottom > locmax(i))
        fprintf(' %d > %d \n',locmax(i),bottom)
        end
    end

plot(locmax, ylocmax,'ro', 'markersize', 10)
    hold on
plot(locmin, ylocmin,'ro', 'markersize', 10)
    hold on
   

