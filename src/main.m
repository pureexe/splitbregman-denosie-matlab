clc;
clear all;
noisy_image = imread('../images/noisy_horizontal.png');
noisy = double(rgb2gray(noisy_image));
alpha = 10;
theta = 1;
eps1 = 1.0e-4;
eps2 = 10000;
denoised_image = uint8(denoised_sb_2d(noisy,alpha,theta,eps1,eps2));
imshow(denoised_image)