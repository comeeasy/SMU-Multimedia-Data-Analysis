function [cfaR, cfaG, cfaB] = CFASplit(cfa)
    % CFA RGGB pattern
    %
    
    [row, col] = size(cfa);
    
    % split cfa into each spectrum
    pitch = [2, 2];
    phpit = [0, 0];
    imgD = SamplingDown(cfa, pitch, phpit);
    cfaR = SamplingUp(imgD, pitch, phpit);

    pitch = [2, 2];
    phpit = [1, 1];
    imgD = SamplingDown(cfa, pitch, phpit);
    cfaB = SamplingUp(imgD, pitch, phpit);

    pitch = [2, 2];
    phpit = [1, 0];
    imgD = SamplingDown(cfa, pitch, phpit);
    cfaG1 = SamplingUp(imgD, pitch, phpit);

    pitch = [2, 2];
    phpit = [0, 1];
    imgD = SamplingDown(cfa, pitch, phpit);
    cfaG2 = SamplingUp(imgD, pitch, phpit);
    cfaG = cfaG1 + cfaG2;