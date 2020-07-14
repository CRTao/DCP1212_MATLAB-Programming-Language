function p1(n)
a=zeros(n)
k=1
if mod(n,2)==1
for i=fix(n/2)+1:-1:1
    a(i,k)=1
    k=k+1    
end
k=1
for i=fix(n/2)+1:n
    a(i,k)=1
    k=k+1   
end
k=fix(n/2)+1
for i=1:fix(n/2)+1
    a(i,k)=1
    k=k+1    
end
k=n
for i=fix(n/2)+1:n
    a(k,i)=1
    k=k-1    
end
else
  for i=fix(n/2):-1:1
    a(i,k)=1
    k=k+1    
end
k=1
for i=fix(n/2)+1:n
    a(i,k)=1
    k=k+1   
end
k=fix(n/2)+1
for i=1:fix(n/2)
    a(i,k)=1
    k=k+1    
end
k=n
for i=fix(n/2)+1:n
    a(k,i)=1
    k=k-1    
end  
end

a=a*42
clc
a=char(a)
end

