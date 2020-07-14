function p4(v,n)
    r=size(v,1)
    c=size(v,2)
    k=cell(r,c)
    for i=1:r
        for j=1:c
            k{i,j}=ones(n)*v(i,j)
        end
    end
    clc
    cell2mat(k)

end