%% Virtual Reality Renderer for MATLAB
%  BIOEN 3301 Final Project
%  Patrick Pearson, Julie Tang, and Zach Zundel

img = imread('test.jpg');

[imagePoints, boardSize] = detectCheckerboardPoints(img);

pixels_per_inch = sqrt((imagePoints(1,1) - imagePoints(2,1))^2 ...
                     + (imagePoints(1,2) - imagePoints(2,2))^2);

a = [-3:3];
worldPoints = [[a,a,a,a,a,a,a,a,a]',[-4:4,-4:4,-4:4,-4:4,-4:4,-4:4,-4:4]'];

[rotation, translation] = extrinsics(imagePoints, worldPoints, cameraParams);

L = 5;

[X Y Z] = sphere(L);

x = reshape(X, 1, (L + 1) * (L + 1));
y = reshape(Y, 1, (L + 1) * (L + 1));
z = reshape(Z, 1, (L + 1) * (L + 1));

sphere_coords = [x' y' z'];

spherePoints = [worldToImage(cameraParams, rotation, translation, sphere_coords) 30*ones((L + 1) * (L + 1),1)];
img = insertShape(img, 'FilledCircle', spherePoints, 'Color', 'red');

image(img)