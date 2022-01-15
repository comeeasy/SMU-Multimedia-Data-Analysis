% Image Leb Demosaicking { CFA interpolation }

clear;
clc;

    fhead = 'lena';
    % image loading

    fext = 'png';
    filename = sprintf('%s.%s', fhead, fext)

    img = imread(filename);
    img = double(img);
    filename = sprintf('%s_cfa.%s', fhead, fext)
    [w, h, c] = size(img);

    cfa = imread(filename);
    imgG = CFAInterpolationG(cfa);
    imgR = CFAInterpolationR(cfa, imgG);
    imgB = CFAInterpolationB(cfa, imgG);

    demosaick_img = zeros(512, 512, 3);
    demosaick_img(:,:,1) = imgR;
    demosaick_img(:,:,2) = imgG;
    demosaick_img(:,:,3) = imgB;

    % PSNR or SSIM
    cutsize = [2, 2];
    enhanced_demosaick_img = demosaick_img(4:w-4, 4:h-4, :);
    img = img(4:w-4, 4:h-4, :);

    % PSNR or SSIM
    pval = psnr(enhanced_demosaick_img, img, 255);
    sval = ssim(enhanced_demosaick_img, img);

    img = uint8(img);
    enhanced_demosaick_img = uint8(enhanced_demosaick_img);

    result = sprintf('HA 방법 PSNR: %f, SSIM: %f', pval, sval)
    subplot(411); imshow([img, enhanced_demosaick_img]); title(result);

    filename = sprintf('%s_HA.%s', fhead, fext);
    imwrite(enhanced_demosaick_img, filename);
    
    fhead = 'baboon';
    % image loading

    fext = 'png';
    filename = sprintf('%s.%s', fhead, fext)

    img = imread(filename);
    img = double(img);
    filename = sprintf('%s_cfa.%s', fhead, fext)
    [w, h, c] = size(img);

    cfa = imread(filename);
    imgG = CFAInterpolationG(cfa);
    imgR = CFAInterpolationR(cfa, imgG);
    imgB = CFAInterpolationB(cfa, imgG);

    demosaick_img = zeros(512, 512, 3);
    demosaick_img(:,:,1) = imgR;
    demosaick_img(:,:,2) = imgG;
    demosaick_img(:,:,3) = imgB;

    % PSNR or SSIM
    cutsize = [2, 2];
    enhanced_demosaick_img = demosaick_img(4:w-4, 4:h-4, :);
    img = img(4:w-4, 4:h-4, :);

    % PSNR or SSIM
    pval = psnr(enhanced_demosaick_img, img, 255);
    sval = ssim(enhanced_demosaick_img, img);

    img = uint8(img);
    enhanced_demosaick_img = uint8(enhanced_demosaick_img);

    result = sprintf('HA 방법 PSNR: %f, SSIM: %f', pval, sval)
    subplot(412); imshow([img, enhanced_demosaick_img]); title(result);

    filename = sprintf('%s_HA.%s', fhead, fext);
    imwrite(enhanced_demosaick_img, filename);

    fhead = 'airplane';
    % image loading

    fext = 'png';
    filename = sprintf('%s.%s', fhead, fext)

    img = imread(filename);
    img = double(img);
    filename = sprintf('%s_cfa.%s', fhead, fext)
    [w, h, c] = size(img);

    cfa = imread(filename);
    imgG = CFAInterpolationG(cfa);
    imgR = CFAInterpolationR(cfa, imgG);
    imgB = CFAInterpolationB(cfa, imgG);

    demosaick_img = zeros(512, 512, 3);
    demosaick_img(:,:,1) = imgR;
    demosaick_img(:,:,2) = imgG;
    demosaick_img(:,:,3) = imgB;

    % PSNR or SSIM
    cutsize = [2, 2];
    enhanced_demosaick_img = demosaick_img(4:w-4, 4:h-4, :);
    img = img(4:w-4, 4:h-4, :);

    % PSNR or SSIM
    pval = psnr(enhanced_demosaick_img, img, 255);
    sval = ssim(enhanced_demosaick_img, img);

    img = uint8(img);
    enhanced_demosaick_img = uint8(enhanced_demosaick_img);

    result = sprintf('HA 방법 PSNR: %f, SSIM: %f', pval, sval)
    subplot(413); imshow([img, enhanced_demosaick_img]); title(result);

    filename = sprintf('%s_HA.%s', fhead, fext);
    imwrite(enhanced_demosaick_img, filename);

    fhead = 'peppers';
    % image loading

    fext = 'png';
    filename = sprintf('%s.%s', fhead, fext)

    img = imread(filename);
    img = double(img);
    filename = sprintf('%s_cfa.%s', fhead, fext)
    [w, h, c] = size(img);

    cfa = imread(filename);
    imgG = CFAInterpolationG(cfa);
    imgR = CFAInterpolationR(cfa, imgG);
    imgB = CFAInterpolationB(cfa, imgG);

    demosaick_img = zeros(512, 512, 3);
    demosaick_img(:,:,1) = imgR;
    demosaick_img(:,:,2) = imgG;
    demosaick_img(:,:,3) = imgB;

    % PSNR or SSIM
    cutsize = [2, 2];
    enhanced_demosaick_img = demosaick_img(4:w-4, 4:h-4, :);
    img = img(4:w-4, 4:h-4, :);

    % PSNR or SSIM
    pval = psnr(enhanced_demosaick_img, img, 255);
    sval = ssim(enhanced_demosaick_img, img);

    img = uint8(img);
    enhanced_demosaick_img = uint8(enhanced_demosaick_img);

    result = sprintf('HA 방법 PSNR: %f, SSIM: %f', pval, sval)
    subplot(414); imshow([img, enhanced_demosaick_img]); title(result);

    filename = sprintf('%s_HA.%s', fhead, fext);
    imwrite(enhanced_demosaick_img, filename);

function [imgD] = SamplingDown(img, pitch, phpit)
    imgD = img(phpit(1)+1:pitch(1):end, phpit(2)+1:pitch(2):end, :);
end

function [imgU] = SamplingUp(imgD, pitch, phpit)
    [row, col, dep] = size(imgD);
    imgU = uint8(zeros(row * pitch(1), col * pitch(2), dep));
    
    imgU(phpit(1)+1:pitch(1):end, phpit(2)+1:pitch(2):end, :) = imgD;
end

function [imgR] = CFAInterpolationR(cfa, cfaG)
    [row, col] = size(cfa);
    cfaR = double(cfa);
    cfaG = double(cfaG);
    imgR = zeros(row, col);
    
    for r=1:2:row-3
        for c=1:2:col-3
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
        
    imgR = uint8(imgR);
end

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
    
    imgG2 = uint8(imgG2);
end

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