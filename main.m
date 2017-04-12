%% Virtual Reality Renderer for MATLAB
%  BIOEN 3301 Final Project
%  Patrick Pearson, Julie Tang, and Zach Zundel

for imgName = 1:1
img = imread(['small calibration data/' num2str(imgName) '.jpg']);

[imagePoints, boardSize] = detectCheckerboardPoints(img);

pixels_per_inch = sqrt((imagePoints(1,1) - imagePoints(2,1))^2 ...
                     + (imagePoints(1,2) - imagePoints(2,2))^2);

a = [-3:3];
worldPoints = [[a,a,a,a,a,a,a,a,a]',[-4:4,-4:4,-4:4,-4:4,-4:4,-4:4,-4:4]'];

[rotation, translation] = extrinsics(imagePoints, worldPoints, cameraParams);


    sphere_center = worldToImage(cameraParams, rotation, translation, [0 0 0]);
    [X Y Z] = sphere(L);
    
    x = reshape(X, 1, (L + 1) * (L + 1));
    y = reshape(Y, 1, (L + 1) * (L + 1));
    z = reshape(Z, 1, (L + 1) * (L + 1));

    sphere_coords = bsxfun(@plus, rotation^-1 * [x; y; z], translation');
    
    X = reshape(sphere_coords(1, :), L + 1, L + 1);
    Y = reshape(sphere_coords(2, :), L + 1, L + 1);
    Z = reshape(sphere_coords(3, :), L + 1, L + 1);  
   
    X = X * pixels_per_inch + sphere_center(1);
    Y = Y * pixels_per_inch + sphere_center(2);
    %Z = (Z + 2) * pixels_per_inch;
   
    figure
    ax = gca;
    
    imagesc(img, 'Parent', ax);
    hold on
    surf(X, Y , Z, 'Parent', ax);

end