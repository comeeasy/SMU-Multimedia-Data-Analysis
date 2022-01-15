function [filtered_img] = median_filtering(img)                   
  [w, h, c] = size(img);
  
  pad = 1;
  filtered_img = zeros(w, h, c);
  
  padded_img = zeros(w+2, h+2, c);
  padded_img(2:w+1, 2:h+1, :) = img;
  
%   convolution
  for i=1:+w
    for j=1:h
      for k=1:c
        median_filter = padded_img(i:2*pad+i, j:j+2*pad, k);
        median = reshape(median_filter, 1, 9);
        median = sort(median);
        
        filtered_img(i,j,k) = median(5);
      end
    end
  end
  
  filtered_img = uint8(filtered_img);

  %{
    ax(1) = subplot(131);
    imshow(img);
    title('origianl image');
   
    ax(2) = subplot(132);
    imshow(saltpepper_img);
    title('salt & pepper noise');
    
  ax(3) = subplot(133);
    imshow(filtered_img);
    title('filterd image');
  %}
