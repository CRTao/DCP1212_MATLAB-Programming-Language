
N = 200;
A = [10 8; -15 30]; d = [5 -10];
X = randn(N,2) * A + repmat(d, N, 1);

M=mean(X)
C=cov(X)
P=[]
for i=1:N
U=X(i,:)-M
T=U'
P=cat(1,P,(1/(2*pi*sqrt(det(C))))*exp((-1/2)*U*inv(C)*T))
end

hold on
x=linspace(-100,100,50)
y=linspace(-100,100,50)
p=zeros(50)
[x,y]=meshgrid(x,y)
for i=1:50
    for j=1:50
        u=[x(i,j),y(i,j)]-M
        t=u'
        p(i,j)=(1/(2*pi*sqrt(det(C))))*exp((-1/2)*u*inv(C)*t)
        clc
    end
end
imagesc(-100,-100,zeros(200))
imagesc(-60,-60,p(1:0.4:end,1:0.4:end))
contour(x,y,p,5)
hold on 
scatter(X(:,1),X(:,2),10,'filled','k')
