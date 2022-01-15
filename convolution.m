function [fimg] = convolution()
    img = imread('baboon.png');
    filter = LOG(3);
    [w, h, c] = size(img);
    
    pimg = zeros(w+2, h+2, c);
    fimg = zeros(w, h, c);
    for r=2:h+1
        for c=2:w+1
            fimg(r-1, c-1, :) = sum(sum(pimg(r-1:r+1, c-1:c+1, :).*filter));
        end
    end
    
    figure(1); imshow(fimg * 100);
end