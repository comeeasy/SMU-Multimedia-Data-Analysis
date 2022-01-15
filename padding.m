function [padded_img] = padding(img, pad),
  w = size(img)(1);
  h = size(img)(2);
  c = size(img)(3);
  
  padded_img = zeros(w + pad*2, h + pad*2, c);
  padded_img(1 + pad:w + pad, 1 + pad:h + pad, 1) = img(:,:,1);
  padded_img(1 + pad:w + pad, 1 + pad:h + pad, 2) = img(:,:,2);
  padded_img(1 + pad:w + pad, 1 + pad:h + pad, 3) = img(:,:,3);
endfunction