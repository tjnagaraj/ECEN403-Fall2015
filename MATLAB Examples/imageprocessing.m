clc
close all
clear all

image1 = imread('fruits.jpg');


%%%%%%%%%%%%%%%%%%%%% Grayscale %%%%%%%%%%%%%%%%%

image1_gray = rgb2gray(image1);

figure;

subplot(2,2,3);
imhist(image1_gray);
title('Histogram Before Histeq','FontSize',16);


subplot(2,2,1);
imshow(image1_gray);
title('Before Histeq','FontSize',16);

image1_gray_eq = histeq(image1_gray);

subplot(2,2,4);
imhist(image1_gray_eq);
title('Histogram After Histeq','FontSize',16);

subplot(2,2,2);
imshow(image1_gray_eq);  %Equalized output (Better Contrast !!)
title('After Histeq','FontSize',16);


%%%%%%%%%%%%% Filtering on Images %%%%%%%%%%%%%%
image1_sharpen = edge(image1_gray,'sobel');

figure;
subplot(1,2,1);
imshow(image1);
title('Original','FontSize',16);
subplot(1,2,2);
imshow(image1_sharpen);
title('Edge Detection','FontSize',16);


%%%%%%%%%%%%%%%%%%%%  RGB %%%%%%%%%%%%%%%%%%%%%%

image1_red(:,:,1) = image1(:,:,1);
image1_red(:,:,2:3) = 0;

image1_green(:,:,2) = image1(:,:,2);
image1_green(:,:,[1 3]) = 0;

image1_blue(:,:,3) = image1(:,:,3);
image1_blue(:,:,[1:2]) = 0;

figure;
subplot(2,2,1);
imshow(image1);
title('Original','FontSize',16);

subplot(2,2,2);
imshow(image1_red);
title('Red Layer','FontSize',16);

subplot(2,2,3);
imshow(image1_green);
title('Green Layer','FontSize',16);

subplot(2,2,4);
imshow(image1_blue);
title('Blue Layer','FontSize',16);

