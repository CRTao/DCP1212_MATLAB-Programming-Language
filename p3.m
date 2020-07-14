function p3(n)
    yt = @(t) cos(t);
    xt = @(t) sin(t);
    fplot(xt,yt)
    hold on
    a=[1:n]*2*pi/n
    ax=xt(a)
    ay=yt(a)
    ax(n+1)=ax(1)
    ay(n+1)=ay(1)
    plot(ax,ay)
    hold on
    for i=1:n+1
        for j=1:n+1
            ux=[ax(i),ax(j)]
            uy=[ay(i),ay(j)]
            plot(ux,uy,'b')
            hold on
        end
    end
    
end