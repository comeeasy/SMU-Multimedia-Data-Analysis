function [LoG] = LOG(kernel_size)
   kernel_size = 3;
   mysigma = 2;
   half_kernel = int8(kernel_size / 2)
   
   LoG = zeros(kernel_size, kernel_size);
   for r=1:kernel_size
       for c=1:kernel_size
           x = r - 2;
           y = c - 2;
           LoG(r, c) = (1 - ((x^2 + y^2) / 2*mysigma^2)) * exp( -(x^2 + y^2) / 2*mysigma^2) / pi*mysigma^4;  
       end
   end
end