function [imgB] = CFAInterpolationB(cfa, cfaG)
    [row, col] = size(cfa);
    cfaB = double(cfa);
    cfaG = double(cfaG);
    imgB = zeros(row, col);
    
    for r=2:2:row-2
        for c=2:2:col-2
            imgB(r, c) = cfa(r, c);
            imgB(r+1, c) = (cfaB(r, c) + cfaB(r+2, c)) / 2 + (-cfaG(r, c) + 2*cfaG(r+1, c) - cfaG(r+2, c)) / 2; 
            imgB(r, c+1) = (cfaB(r, c) + cfaB(r, c+2)) / 2 + (-cfaG(r, c) + 2*cfaG(r, c+1) - cfaG(r, c+2)) / 2;
            
            DN = abs(-cfaG(r,c) + 2*cfaG(r+1, c+1) - cfaG(r+2, c+2)) + abs(cfaB(r, c) - cfaB(r+2, c+2));
            DP = abs(-cfaG(r+2,c) + 2*cfaG(r+1, c+1) - cfaG(r, c+2)) + abs(cfaB(r, c+2) - cfaB(r+2, c));
            
            N = (cfaB(r, c) + cfaB(r+2, c+2)) / 2 + (-cfaG(r, c) + 2*cfaG(r+1, c+1) - cfaG(r+2, c+2)) / 2;
            P = (cfaB(r, c+2) + cfaB(r+2, c)) / 2 + (-cfaG(r, c+2) + 2*cfaG(r+1, c+1) - cfaG(r+2, c)) / 2;
            
            if DP >= DN
                imgB(r+1, c+1) = N;
            else
                imgB(r+1, c+1) = P;
            end
        end
    end
        
    imgB = uint8(imgB);
end