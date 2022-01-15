function [imgU] = SamplingUp(imgD, pitch, phpit)
    [row, col, dep] = size(imgD);
    imgU = uint8(zeros(row * pitch(1), col * pitch(2), dep));
    
    imgU(phpit(1)+1:pitch(1):end, phpit(2)+1:pitch(2):end, :) = imgD;
end
    