function [cfa] = CFA_Sampling()
    fhead = 'peppers'
    fext = 'png'
    filename = sprintf('%s.%s', fhead, fext);
    img = imread(filename);
    pnginf = imfinfo(filename);
    filesize = pnginf.FileSize;
    [row, col, dep] = size(img)

    figure(1); imshow(img); title('original image');

    pitch = [2, 2];
    phpit = [0, 0];

    imgD = SamplingDown(img(:,:,1), pitch, phpit);
    cfaR = SamplingUp(imgD, pitch, phpit);

    pitch = [2, 2];
    phpit = [1, 1];

    imgD = SamplingDown(img(:,:,3), pitch, phpit);
    cfaB = SamplingUp(imgD, pitch, phpit);

    pitch = [2, 2];
    phpit = [0, 1];
    imgD = SamplingDown(img(:,:,2), pitch, phpit);
    cfaG1 = SamplingUp(imgD, pitch, phpit);

    phpit = [1, 0];
    imgD = SamplingDown(img(:,:,2), pitch, phpit);
    cfaG2 = SamplingUp(imgD, pitch, phpit);

    cfaG = cfaG1 + cfaG2;

    cfa = cfaR + cfaG + cfaB;
    cfaRGB = uint8(zeros(512, 512, 3));
    cfaRGB(:,:,1) = cfaR;
    cfaRGB(:,:,2) = cfaG;
    cfaRGB(:,:,3) = cfaB;
    
    filename = sprintf('%s_cfa.%s', fhead, fext);
    imwrite(cfa, filename);
    
    filename = sprintf('%s_cfaRGB.%s', fhead, fext);
    imwrite(cfaRGB, filename);