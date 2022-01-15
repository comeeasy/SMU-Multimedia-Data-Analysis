% Image Leb Demosaicking { CFA interpolation }

clear;
clc;

% image loading
fhead = 'baboon'
fext = 'png'
filename = sprintf('%s.%s', fhead, fext)

img = imread(filename);
img = double(img);
filename = sprintf('%s_cfa.%s', fhead, fext)
[w, h, c] = size(img);



cfa = imread(filename);
[cfaR, cfaG, cfaB] = CFASplit(cfa);
size(cfa)

%imgG = CFAInterpolationG(cfa);
%imgR = CFAInterpolationR(cfa, imgG);
%imgB = CFAInterpolationB(cfa, imgG);

%imgG = CFAInterpolationG(cfa);
%to_view_G1 = zeros(512, 512, 3);
%to_view_G1(:,:,2) = imgG;
%to_view_G2 = zeros(512, 512, 3);
%to_view_G2(:,:,2) = cfaG;
%figure(11); imshow([rescale(to_view_G2), rescale(to_view_G1)]); 

imgR = CFAInterpolationR(cfa);
to_view_R1 = zeros(512, 512, 3);
to_view_R1(:,:,1) = imgR;
to_view_R2 = zeros(512, 512, 3);
to_view_R2(:,:,1) = cfaR;

imgB = CFAInterpolationB(cfa);
to_view_B1 = zeros(512, 512, 3);
to_view_B1(:,:,3) = imgB;
to_view_B2 = zeros(512, 512, 3);
to_view_B2(:,:,3) = cfaB;
figure(11); imshow([rescale(to_view_R2), rescale(to_view_R1), rescale(to_view_B2), rescale(to_view_B1)]);

figure(4); imshow([imgR, imgG, imgB]);

demosaick_img = zeros(512, 512, 3);
demosaick_img(:,:,1) = imgR;
demosaick_img(:,:,2) = imgG;
demosaick_img(:,:,3) = imgB;

% PSNR or SSIM
cutsize = [2, 2];
enhanced_demosaick_img = demosaick_img(4:w-4, 4:h-4, :);
img = img(4:w-4, 4:h-4, :);

% PSNR or SSIM
pval = psnr(enhanced_demosaick_img, img, 255)
sval = ssim(enhanced_demosaick_img, img)

img = uint8(img);
enhanced_demosaick_img = uint8(enhanced_demosaick_img);

figure(3); imshow([img, enhanced_demosaick_img]); title('result');

filename = sprintf('%s_bilin.%s', fhead, fext);
imwrite(enhanced_demosaick_img, filename);


