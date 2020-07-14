function im = p2(im, rect, clr)
if ischar(im)
    imread(im);
end
x1=rect(1)
x2=rect(2)
y1=rect(3)
y2=rect(4)
imshow(im)
hold on
    if nargin == 2
        clr='w'
    else
    end
rectangle('Position',[x1 x2 y1 y2],'faceColor',clr)
    
end