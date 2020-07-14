%% 0516320 ­â­NÀÜ
function [cc,iml]=P3_0516320(im)
    if ischar(im)==1
        im=imread(im)
    end
    %% bwlabel
    iml=zeros(size(im))
    ncc=0
    for ix=1:size(im,1)
        for iy=1:size(im,2)
            while im(ix,iy)>0 & iml(ix,iy)==0
                ncc=ncc+1
                Qx=[ix]
                Qy=[iy]
                while isempty(Qx)==0 & isempty(Qy)==0
                    qx=Qx(1)
                    Qx(1)=[]
                    qy=Qy(1)
                    Qy(1)=[]
                    if im(qx,qy)>0 & iml(qx,qy)==0
                        iml(qx,qy)=ncc
                        if qx-1 >= 1
                            Qx=[Qx,qx-1]
                            Qy=[Qy,qy]
                        end
                        if qx+1 <= size(im,1)
                            Qx=[Qx,qx+1]
                            Qy=[Qy,qy]
                        end
                        if qy-1 >= 1
                            Qx=[Qx,qx]
                            Qy=[Qy,qy-1]
                        end
                        if qy+1 <= size(im,2)
                            Qx=[Qx,qx]
                            Qy=[Qy,qy+1]
                        end 
                    end
                    clc
                end
            end
        end
    end
    %% value for CC
    imlc=5*iml
    count=[]
    index=[0:max(max(iml))]
    mami=cell(max(max(iml))+1,1)
    for id=0:max(max(iml))
        count=[count,size(find(iml==id),1)]  
        ty=mod(find(iml==id),size(im,1))
        ty(ty==0)=size(im,1)
        tx=(floor(find(iml==id)/size(im,1))+1)
        tx(tx==size(im,2)+1)=size(im,2)
        xmin=min(tx)
        xmax=max(tx)
        ymin=min(ty)
        ymax=max(ty)
        mami{id+1}=[xmin,xmax,ymin,ymax]
    end
    index=index'
    count=count'
    index=num2cell(index)
    count=num2cell(count)
    %% struct
    field1 = 'count';  value1 = count;
    field2 = 'index';  value2 = index;
    field3 = 'xmin_xmax_ymin_ymax';  value3 = mami;

    cc = struct(field1,value1,field2,value2,field3,value3)
    imagesc(imlc)
    
end
    

