% Задание 1 - 2
n_image8 = genImgWithNoise(zeros(800), 1);
% Задание 3
path = 'DIP\Lab2\';
n_hist_fig = figure('visible', 'off');
imhist(n_image8);
ylim([1, 25000]);
if ~ exist(path, 'dir')
  mkdir(path)
end
saveas(n_hist_fig, fullfile(path, 'noiseHist.png'));
% Задание 4
n_image8 = setObject(n_image8, 'object1.png', 360, 360);
imwrite(n_image8, fullfile(path, 'imgWithObject1.png'));
% Задание 5
n_image8_big = imresize(n_image8, 2, 'nearest');
n_image8_small = imresize(n_image8, 0.5, 'bilinear');
imwrite(n_image8_big, fullfile(path, 'imgBig.png'));
imwrite(n_image8_small, fullfile(path, 'imgSmall.png'));
% Задание 6
n_image8 = genImgWithNoise(zeros(800), 1);
n_image8 = setObject(n_image8, 'object2.png', 0, 0);
n_image8 = setObject(n_image8, 'object3.png', 720, 720);
% Задание 7
n_image8_flop = fliplr(n_image8);
imwrite(n_image8_flop, fullfile(path, 'imgFlop.png'));
% Задание 8
n_image8_flip = flipud(n_image8);
imwrite(n_image8_flip, fullfile(path, 'imgFlip.png'));
% Задание 9
n_image8_rotate = imrotate(n_image8, - 45);
imwrite(n_image8_rotate, fullfile(path, 'imgRotate-45.png'));
% Задание 10
n_image8_rotate = imrotate(n_image8, 45);
imwrite(n_image8_rotate, fullfile(path, 'imgRotate45.png'));
% Задание 11
n_image_RGB = imread('img.png');
n_image = rgb2gray(n_image_RGB);
n_image8 = im2uint8(n_image);
% Задание 12
n_image_croped = imcrop(n_image8, [1 1 799 799]);
% Задание 13
n_image_bright = n_image_croped / 4;
n_image8 = n_image_bright;
% Задание 14
n_image8 = setObject(n_image8, 'object2.png', 0, 0);
n_image8 = setObject(n_image8, 'object3.png', 720, 720);
n_image8_noise = genImgWithNoise(n_image8, 0.4);
imwrite(n_image8_noise, fullfile(path, 'picWithNoiseandObjects.png'));
% Задание 15
n_image8_nega = imadjust(n_image8_noise, [0 1], [1 0]);
imwrite(n_image8_nega, fullfile(path, 'picNega.png'));
% Задание 16
n_image_v2 = setObject(n_image_bright, 'object1.png', 360, 360);
n_image_v2 = genImgWithNoise(n_image_v2, 0.4);
imwrite(n_image_v2, fullfile(path, 'picWithNoiseandObject1.png'));
% Задание17
n_image_v3 = n_image_v2 - n_image8_noise;
imwrite(n_image_v3, fullfile(path, 'pic-pic.png'));
function image8WithObject = setObject(imgForEdit, fileWithObject, iPoz, jPoz)
object = im2double(imread(fileWithObject));
for i = 1:size(object, 1) % Loop for print object on 8 bit img (idea github.com/iuriinesterov)
  for j = 1:size(object, 2)
    if (object(i, j) < 1)
      imgForEdit(i + iPoz, j + jPoz) = object(i, j); % iPoz and jPoz this is offset from left top corner of original IMG
    end
  end
end
image8WithObject = imgForEdit;
end
function image8WithNoise = genImgWithNoise(imgForEdit, density)
for x = 1:density * numel(imgForEdit)
    imgForEdit(randi(800), randi(800)) = log(1 - rand(1));
  end
imgForEdit = mat2gray(imgForEdit);
image8WithNoise = im2uint8(imgForEdit);
end
