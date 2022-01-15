clc;
clear;

fhead = 'baboon'
fext = 'png'
filename = sprintf('%s.%s', fhead, fext)
img = imread(filename);
pnginf = imfinfo(filename)
filesize = pnginf.FileSize
[row, col, dep] = size(img)

figure(1); imshow(img); title('original image');


% # CFA 패턴에서는 짝수 row에서는 RGRGRG
% #             홀수 row에서는 GBGBGB
% # 의 패턴을 갖는다.

% # R-plane sampling for RGGB CFA image
% # R 0 R 0 
% # 0 0 0 0 ..

pitch = [2, 2];
phpit = [0, 0];

imgD = SamplingDown(img(:,:,1), pitch, phpit);
cfaR = SamplingUp(imgD, pitch, phpit);

% # B-plane sampling for RGGB CFA image
% # 0 0 0 0 
% # 0 B 0 B ..

pitch = [2, 2];
phpit = [1, 1];

imgD = SamplingDown(img(:,:,3), pitch, phpit);
cfaB = SamplingUp(imgD, pitch, phpit);

% # G-plane sampling for RGGB CFA image
% # G 0 G 0 
% # 0 G 0 G ..

% # 이를 두 가지 frame으로 나누어 합치면 된다.
% # G1        G2        G
% # 0 G 0 G   0 0 0 0   0 G 0 G  
% # 0 0 0 0   G 0 G 0   G 0 G 0

pitch = [2, 2];
phpit = [0, 1];
imgD = SamplingDown(img(:,:,2), pitch, phpit);
cfaG1 = SamplingUp(imgD, pitch, phpit);

phpit = [1, 0];
imgD = SamplingDown(img(:,:,2), pitch, phpit);
cfaG2 = SamplingUp(imgD, pitch, phpit);

cfaG = cfaG1.+cfaG2;

figure(1); imshow([cfaR, cfaG, cfaB]); title('RGB cfa images');

% # acquisition cfa image
% # 센서가 실제로 받아오는 데이터
cfa = cfaR + cfaG + cfaB;
cfa_RGB(:,:,1) = cfaR;
cfa_RGB(:,:,2) = cfaG;
cfa_RGB(:,:,3) = cfaB;

imshow(cfa_RGB);

filename = sprintf('%s_cfa.%s', fhead, fext);
imwrite(cfa, filename);
