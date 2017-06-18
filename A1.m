close all; 
clear;
%%Setup
% read images and convert to floating point format
image1 = im2single(imread('111.jpg'));
image2 = im2single(imread('22.jpg'));
[row, col] = size(image1(:,:,1));   
image2=imresize(image2,[row, col],'lanczos3');  %%resize image2 


%% Filtering and Hybrid Image construction
%%imgaussfilt(A,sigma) filters image A with a 2-D Gaussian smoothing kernel with standard deviation specified by sigma
 
% horizontal filters 
low_frequencies = imgaussfilt(image1,5);


high_frequencies = image2 - imgaussfilt(image2,5);

% Combine the high frequencies and low frequencies


hybrid_image = low_frequencies + high_frequencies;

%% Visualizeualize 
figure(1); imshow(low_frequencies)
figure(2); imshow(high_frequencies + 0.5);


scales = 6; % number of time downsampled image
scale_factor = 0.6; % downsample each time
padding = 5; %how many pixels to pad.

original_height = size(hybrid_image,1);




n_colors = size(hybrid_image,3); %counting how many color channels the input has
output = hybrid_image;
cur_image = hybrid_image;

for i = 2:scales
    %add padding
    output = cat(2, output, ones(original_height, padding, n_colors));
    
    %dowsample image;
    cur_image = imresize(cur_image, scale_factor, 'bilinear');
    %pad the top and append to the output
    tmp = cat(1,ones(original_height - size(cur_image,1), size(cur_image,2), n_colors), cur_image);
    output = cat(2, output, tmp);    
end

Visualize = output;

figure(3); imshow(Visualize);

figure(4);

%%Save outputs
subplot(2, 2, 1);
image(image1);
subplot(2, 2, 2);
image(image2);
subplot(2, 2, 3:4);
image(Visualize);


figure(4); imshow(Visualize);


saveas(figure(1), 'low_frequencies.png');
saveas(figure(2), 'high_frequencies.png');
saveas(figure(3), 'hybrid_image_scales.png');
saveas(figure(4), 'all.png');



