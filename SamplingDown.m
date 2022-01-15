function [imgD] = SamplingDown(img, pitch, phpit),
    imgD = img(phpit(1)+1:pitch(1):end, phpit(2)+1:pitch(2):end, :);

