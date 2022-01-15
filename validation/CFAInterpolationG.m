function [imgG] = CFAInterpolationG(cfaG)
    [row, col] = size(cfaG);
    cfaG = double(cfaG);
    imgG = zeros(row, col);
    
    for r=2:2:row-2
        for c=2:2:col-2
            imgG(r, c) = (cfaG(r-1, c) + cfaG(r, c-1) + cfaG(r+1, c) + cfaG(r, c+1)) / 4;
            imgG(r+1, c) = cfaG(r+1, c);
            imgG(r, c+1) = cfaG(r, c+1);
            imgG(r+1, c+1) = (cfaG(r, c+1) + cfaG(r+1, c) + cfaG(r+2, c+1) + cfaG(r+1, c+2)) / 4;
        end
    end
    
    imgG = uint8(imgG);
     %figure(1); imshow(rescale(imgG));
%{    
% additional part start
    imgG2 = zeros(row, col);

    for r=3:2:row-3
        for c=3:2:col-3
            imgG2(r+1, c) = imgG(r+1, c);
            imgG2(r, c+1) = imgG(r, c+1);
            imgG2(r+1, c+1) = imgG(r+1, c+1);
            
            DH = abs(-imgG(r, c-2) + 2*imgG(r, c) - imgG(r, c+2)) + abs(imgG(r, c-1) - imgG(r, c+1));
            DV = abs(-imgG(r-2, c) + 2*imgG(r, c) - imgG(r+2, c)) + abs(imgG(r-1, c) - imgG(r+1, c));
            
            H = (imgG(r, c-1) + imgG(r, c+1)) / 2 + (-imgG(r, c-2) + 2*imgG(r, c) - imgG(r, c+2)) / 4;
            V = (imgG(r-1, c) + imgG(r+1, c)) / 2 + (-imgG(r-2, c) + 2*imgG(r, c) - imgG(r+2, c)) / 4;
            
            if DV >= DH
                imgG2(r, c) = H;
            else
                imgG2(r, c) = V;
            end
        end
    end
% additional part end
    %figure(9); imshow(rescale(imgG2)); title('g');
    
    imgG2 = uint8(imgG2);
%}
    