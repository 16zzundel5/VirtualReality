%% Virtual Reality Renderer for MATLAB
%  BIOEN 3301 Final Project
%  Patrick Pearson, Julie Tang, and Zach Zundel

img = imread('test.jpg');

[imagePoints, boardSize] = detectCheckerboardPoints(img);

%%
pixels_per_inch = sqrt((imagePoints(1,1) - imagePoints(2,1))^2 ...
                     + (imagePoints(1,2) - imagePoints(2,2))^2);

a = [-3:3];
worldPoints = [[a,a,a,a,a,a,a,a,a]',[-4:4,-4:4,-4:4,-4:4,-4:4,-4:4,-4:4]'];

[rotation, translation] = extrinsics(imagePoints, worldPoints, cameraParams);
[orientation, location] = extrinsicsToCameraPose(rotation, translation);

[azimuth, elevation, radius] = cart2sph(location(1), location(2), location(3));
azimuth = azimuth * 180 / pi;
elevation = elevation * 180 / pi;

sphere_center = worldToImage(cameraParams, rotation, translation, [0 0 0]);
[X Y Z] = sphere(20);

fvc = surf2patch(X, Y, Z, Z);

vertices = worldToImage(cameraParams, rotation, translation, fvc.vertices);

figure
ax = gca;
 
imagesc(img, 'Parent', ax);
hold on

patch('Faces', fvc.faces, 'Vertices', vertices, 'EdgeColor', 'Red', 'FaceAlpha', 0.5, 'FaceColor', fvc.color);

%rendered = surf(X, Y , Z, 'Parent', ax);

%rotate(rendered, [0 0 1], azimuth)
%rotate(rendered, [1 0 0], 90 - elevation)
