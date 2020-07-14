classdef P5_0516320 
    
    properties
        x=0;
        y=0;
    end
    
    methods
        function obj = P5_0516320 (a,b)
            if nargin == 0
                obj.x=0;
                obj.y=0;
            elseif nargin == 1 && ismatrix(a)
                if size(a,1)==2
                    n=size(a,2);
                    obj=[];
                    for ii=1:n
                        tx=a(1,ii);
                        ty=a(2,ii);
                        tmp=P5_0516320(tx,ty);
                        obj=cat(2,obj,tmp);
                    end
                else
                    error('Must be a two-row numeric array.')
                end 
            elseif nargin == 2 && isscalar(a) && isscalar(b) && isnumeric(a) && isnumeric(b)
                obj.x=a;
                obj.y=b;
            elseif nargin == 2 && ismatrix(a) && ismatrix(b)
                if size(a)==size(b)
                    sx=size(a,1);
                    sy=size(a,2);
                    otj=[];
                    obj=[];
                    for ii=1:sx
                        otj=[];
                        for jj=1:sy
                        tx=a(ii,jj);
                        ty=b(ii,jj);
                        tmp=P5_0516320(tx,ty);
                        otj=cat(2,otj,tmp);
                        end
                    obj=cat(1,obj,otj);
                    end
                else
                    error('Two input arrays must be same size')
                end
            else
                error('Wrong Input for Class Point2')
            end
        end
        
        function obj = norm(a)
            sx=size(a,1);
            sy=size(a,2);
            obj=[];
            for ii=1:sx
                otj=[];
                for jj=1:sy
                tmp=P5_0516320;
                otj=cat(2,otj,tmp);    
                end
                obj=cat(1,obj,otj);
            end
        end
        
        function disp(obj)
            sx=size(obj,1);
            sy=size(obj,2);
            for ii=1:sx
                otj=[];
                for jj=1:sy
                str=strcat('(',num2str(obj(ii,jj).x),',',num2str(obj(ii,jj).y),')');
                otj=cat(2,otj,str); 
                end
                disp(otj);
            end
        end
        
        function obj = plus(a,b)
            if nargin == 2 && isscalar(a) && isscalar(b)==0
                if isnumeric(a)
                    x=a;
                    y=a;
                else
                    x=a.x;
                    y=a.y;
                end
                
                sx=size(b,1);
                sy=size(b,2);
                oj=[];
                for ii=1:sx
                    otj=[];
                    for jj=1:sy
                        tmp=P5_0516320(x,y);
                        otj=cat(2,otj,tmp);    
                    end
                oj=cat(1,oj,otj);
                end
                obj=oj+b;
                
            elseif nargin == 2 && isscalar(b) && isscalar(a)==0
                if isnumeric(b)
                    x=b;
                    y=b;
                else
                    x=b.x;
                    y=b.y;
                end
                
                sx=size(a,1);
                sy=size(a,2);
                oj=[];
                for ii=1:sx
                    otj=[];
                    for jj=1:sy
                        tmp=P5_0516320(x,y);
                        otj=cat(2,otj,tmp);    
                    end
                oj=cat(1,oj,otj);
                end
                obj=oj+a;
                
            elseif nargin == 2 && isscalar(b)==0 && isscalar(a)==0
                if all(size(a)==size(b))
                    sx=size(a,1);
                    sy=size(a,2);
                    obj=[];
                    for ii=1:sx
                        otj=[];
                        for jj=1:sy
                            tx=a(ii,jj).x+b(ii,jj).x;
                            ty=a(ii,jj).y+b(ii,jj).y;
                            tmp=P5_0516320(tx,ty);
                            otj=cat(2,otj,tmp);    
                        end
                    obj=cat(1,obj,otj);
                    end
                else
                    error('Wrong size for plus')
                end
            elseif  nargin ==2 && isscalar(a) && isscalar(b)
                if isnumeric(a)
                    xa=a;
                    ya=a;
                else
                    xa=a.x;
                    ya=a.y;
                end
                if isnumeric(b)
                    xb=b;
                    yb=b;
                else
                    xb=a.x;
                    yb=a.y;
                end
                x=xa+xb;
                y=ya+yb;
                obj=P5_0516320(x,y);
            else
                error('Wrong Input for plus function.')       
            end
            
        end
        
        function obj = minus(a,b)
            if nargin == 2 && isscalar(a) && isscalar(b)==0
                if isnumeric(a)
                    x=a;
                    y=a;
                else
                    x=a.x;
                    y=a.y;
                end
                
                sx=size(b,1);
                sy=size(b,2);
                oj=[];
                for ii=1:sx
                    otj=[];
                    for jj=1:sy
                        tmp=P5_0516320(x,y);
                        otj=cat(2,otj,tmp);    
                    end
                oj=cat(1,oj,otj);
                end
                obj=oj-b;
                
            elseif nargin == 2 && isscalar(b) && isscalar(a)==0
                if isnumeric(b)
                    x=b;
                    y=b;
                else
                    x=b.x;
                    y=b.y;
                end
                
                sx=size(a,1);
                sy=size(a,2);
                oj=[];
                for ii=1:sx
                    otj=[];
                    for jj=1:sy
                        tmp=P5_0516320(x,y);
                        otj=cat(2,otj,tmp);    
                    end
                oj=cat(1,oj,otj);
                end
                obj=a-oj;
                
            elseif nargin == 2 && isscalar(b)==0 && isscalar(a)==0
                if all(size(a)==size(b))
                    sx=size(a,1);
                    sy=size(a,2);
                    obj=[];
                    for ii=1:sx
                        otj=[];
                        for jj=1:sy
                            tx=a(ii,jj).x-b(ii,jj).x;
                            ty=a(ii,jj).y-b(ii,jj).y;
                            tmp=P5_0516320(tx,ty);
                            otj=cat(2,otj,tmp);    
                        end
                    obj=cat(1,obj,otj);
                    end
                else
                    error('Wrong size for minus')
                end
            elseif  nargin ==2 && isscalar(a) && isscalar(b)
                if isnumeric(a)
                    xa=a;
                    ya=a;
                else
                    xa=a.x;
                    ya=a.y;
                end
                if isnumeric(b)
                    xb=b;
                    yb=b;
                else
                    xb=a.x;
                    yb=a.y;
                end
                x=xa-xb;
                y=ya-yb;
                obj=P5_0516320(x,y);
            else
                error('Wrong Input for minus function.')       
            end
        end
    
        function test = eq(a,b)
            if isnumeric(a) || isnumeric(b)
                error('Wrong class for eq')
            else
                if nargin == 2 && isscalar(a) && isscalar(b)==0
                    sx=size(b,1);
                    sy=size(b,2);
                    test=zeros(sx,sy);
                    for ii=1:sx
                        for jj=1:sy
                            if a.x==b(ii,jj).x && a.y==b(ii,jj).y
                                test(ii,jj)=1;                                
                            end
                        end
                    end
                    
                elseif nargin == 2 && isscalar(b) && isscalar(a)==0 
                    sx=size(a,1);
                    sy=size(a,2);
                    test=zeros(sx,sy);
                    for ii=1:sx
                        for jj=1:sy
                            if b.x==a(ii,jj).x && b.y==a(ii,jj).y
                                test(ii,jj)=1;                                
                            end
                        end
                    end
                    
                elseif nargin == 2 && isscalar(b)==0 && isscalar(a)==0
                    if all(size(a)==size(b))
                        sx=size(a,1);
                        sy=size(a,2);
                        test=zeros(sx,sy)
                        for ii=1:sx
                            for jj=1:sy
                                if a(ii,jj).x==b(ii,jj).x && a(ii,jj).y==b(ii,jj).y
                                    test(ii,jj)=1;
                                end
                            end
                        end
                    else
                        error('Wrong size for eq')
                    end
                    
                elseif nargin == 2 && isscalar(a) && isscalar(b)
                    if a.x==b.x && a.y == b.y
                        test=1;
                    else
                        test=0;
                    end
                else
                    error('Wrong input for eq');
                end
            end
        end
        
        function obj = sum(a,b)
            if nargin == 1
                b=1;
            end
            sx=size(a,1);
            sy=size(a,2);
            
            if b==1
                obj=[];
                for jj=1:sy
                    tx=0;
                    ty=0;
                    for ii=1:sx
                        tx=a(ii,jj).x+tx;
                        ty=a(ii,jj).y+ty;
                    end
                    tmp=P5_0516320(tx,ty);
                    obj=cat(2,obj,tmp);  
                end
                
            elseif b==2
                obj=[];
                for ii=1:sx
                    tx=0;
                    ty=0;
                    for jj=1:sy
                        tx=a(ii,jj).x+tx;
                        ty=a(ii,jj).y+ty;
                    end
                    tmp=P5_0516320(tx,ty);
                    obj=cat(1,obj,tmp);  
                end
                
            else
                obj=a;
            end
            
        end
        
        function obj = mean(a,b)
            if nargin ==1
                b=1;
            end
            sx=size(a,1);
            sy=size(a,2);
            
            if b==1
                obj=[];
                for jj=1:sy
                    tx=0;
                    ty=0;
                    for ii=1:sx
                        tx=a(ii,jj).x+tx;
                        ty=a(ii,jj).y+ty;
                    end
                    tx=tx/sx;
                    ty=ty/sy;
                    tmp=P5_0516320(tx,ty);
                    obj=cat(2,obj,tmp);  
                end
                
            elseif b==2
                obj=[];
                for ii=1:sx
                    tx=0;
                    ty=0;
                    for jj=1:sy
                        tx=a(ii,jj).x+tx;
                        ty=a(ii,jj).y+ty;
                    end
                    tx=tx/sx;
                    ty=ty/sy;
                    tmp=P5_0516320(tx,ty);
                    obj=cat(1,obj,tmp);  
                end
                
            else
                obj=a;
            end
        end  
    end
end

