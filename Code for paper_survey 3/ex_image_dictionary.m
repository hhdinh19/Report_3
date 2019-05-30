%%--------- Example for dictionary learning---------%
%                                                   %
%---------------------------------------------------%
clear all
%%Step 1: Add 2 toolboxes into our script M-File
%
%-----------------------------------------------
addpath('functions/');
%addpath('data/');
%% Step 2: Load image from my folder and preprocess such image
%
%-------------------------------------------------------------
n=256;
% M=load_image('1')
% M=rescale(crop(M0,n))
M0=im2double(imread('yaleB11_P00A-000E-00.jpg'));
M0=imresize(M0,[256 256]);
% Create noising
sigma=0.04;
M=M0+sigma*randn(n);
% Draw original and noising image
% figure;
% subplot(1,2,1);imshow(M0);title('Original');
% subplot(1,2,2);imshow(M);title('Noising');
%% Step 3: Patch Extraction
%
%----------------------------------------------------------------
% Size of patchs
w=12;
% Number of patches
m=40*w^2;
x=floor(rand(1,1,m)*(n-w))+1;
y=floor(rand(1,1,m)*(n-w))+1;
[dY,dX]=meshgrid(0:(w-1),0:(w-1));
Xp=repmat(dX,[1 1 m])+repmat(x,[w w 1]);
Yp=repmat(dY,[1 1 m])+repmat(y,[w w 1]);
P=M(Xp+(Yp-1)*n);
P=P-repmat(mean(mean(P)),[w w]);
P=reshape(P,[w^2 m]);
%plot_dictionnary(P,[],[16 16])
% dat=load('myYaleB');
%plot_dictionnary(dat,[],[1 1])
% N=imresize(im2double(dat.Y),[256 256 ]);
plot_dictionary(P,[],[8 12])





