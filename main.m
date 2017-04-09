%% Virtual Reality Renderer for MATLAB
%  BIOEN 3301 Final Project
%  Patrick Pearson, Julie Tang, and Zach Zundel

img = imread('test.jpg');
gifOut = 'output.gif';

[imagePoints, boardSize] = detectCheckerboardPoints(img);

pixels_per_inch = sqrt((imagePoints(1,1) - imagePoints(2,1))^2 ...
                     + (imagePoints(1,2) - imagePoints(2,2))^2);

a = [-3:3];
worldPoints = [[a,a,a,a,a,a,a,a,a]',[-4:4,-4:4,-4:4,-4:4,-4:4,-4:4,-4:4]'];

[rotation, translation] = extrinsics(imagePoints, worldPoints, cameraParams);

L = 5;

for L = 5:15
    [X Y Z] = sphere(L);

    x = reshape(X, 1, (L + 1) * (L + 1));
    y = reshape(Y, 1, (L + 1) * (L + 1));
    z = reshape(Z, 1, (L + 1) * (L + 1));

    sphere_coords = [x' y' z'];

    spherePoints = [worldToImage(cameraParams, rotation, translation, sphere_coords) 30*ones((L + 1) * (L + 1),1)];
    img_L = insertShape(img, 'FilledCircle', spherePoints, 'Color', 'red');
    
    image(img_L)
    
    [imind, cm] = rgb2ind(img_L, 256);
    
    if L == 5
        imwrite(imind, cm, gifOut, 'gif', 'LoopCount', Inf, 'DelayTime', 1);
    else
        imwrite(imind, cm, gifOut, 'gif', 'WriteMode', 'append', 'DelayTime', 1);
    end
end