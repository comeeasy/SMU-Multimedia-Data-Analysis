a = [[0 0 0 0 1];
     [0 0 0 1 0];
     [0 0 1 0 0];
     [0 1 0 0 0];
     [1 0 0 0 0]];
 
sobel = [[-1 0 1];
         [-2 0 2];
         [-1 0 1]];
     
gradient = zeros(3, 3);
     
for r=2:4
    for c=2:4
        grdient(r-1, c-1) = sum(sum(a(r-1:r+1, c-1:c+1).*sobel));
    end
end

gradient

