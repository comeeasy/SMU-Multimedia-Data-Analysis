function [imgR] = CFAInterpolationR(cfa)
    [row, col] = size(cfa);
    cfaR = double(cfa);
    imgR = zeros(row, col);
    
   
    for r=1:2:row-2
        for c=1:2:col-2
            imgR(r, c) = cfaR(r, c);
            imgR(r+1, c) = (cfaR(r, c) + cfaR(r+2, c)) / 2;
            imgR(r, c+1) = (cfaR(r, c) + cfaR(r, c+2)) / 2;
            imgR(r+1, c+1) = (imgR(r+1, c) + imgR(r, c+1)) / 2;
        end
    end
    
    imgR = uint8(imgR);
 
%{
function [imgR] = CFAInterpolationR(cfa, cfaG)
    [row, col] = size(cfa);
    cfaR = double(cfa);
    cfaG = double(cfaG);
    imgR = zeros(row, col);
    
    for r=1:2:row-3
        for c=1:2:col-3
            %{
            imgR(r, c) = cfa(r, c);
            imgR(r+1, c) = (cfa(r, c) + cfa(r+2, c)) / 2;
            imgR(r, c+1) = (cfa(r, c) + cfa(r, c+2)) / 2;
            imgR(r+1, c+1) = (imgR(r+1, c) + imgR(r, c+1)) / 2;
            %}
            imgR(r, c) = cfa(r, c);
            imgR(r+1, c) = (cfaR(r, c) + cfaR(r+2, c)) / 2 + (-cfaG(r, c) + 2*cfaG(r+1, c) - cfaG(r+2, c)) / 2; 
            imgR(r, c+1) = (cfaR(r, c) + cfaR(r, c+2)) / 2 + (-cfaG(r, c) + 2*cfaG(r, c+1) - cfaG(r, c+2)) / 2;
            
            DN = abs(-cfaG(r,c) + 2*cfaG(r+1, c+1) - cfaG(r+2, c+2)) + abs(cfaR(r, c) - cfaR(r+2, c+2));
            DP = abs(-cfaG(r+2,c) + 2*cfaG(r+1, c+1) - cfaG(r, c+2)) + abs(cfaR(r, c+2) - cfaR(r+2, c));
            
            N = (cfaR(r, c) + cfaR(r+2, c+2)) / 2 + (-cfaG(r, c) + 2*cfaG(r+1, c+1) - cfaG(r+2, c+2)) / 2;
            P = (cfaR(r, c+2) + cfaR(r+2, c)) / 2 + (-cfaG(r, c+2) + 2*cfaG(r+1, c+1) - cfaG(r+2, c)) / 2;
            
            if DP >= DN
                imgR(r+1, c+1) = N;
            else
                imgR(r+1, c+1) = P;
            end
        end
    end
    
    %figure(2); imshow(rescale(imgR)); title('R');
    
    imgR = uint8(imgR);
%}