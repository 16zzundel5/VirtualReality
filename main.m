%% Virtual Reality Renderer for MATLAB
%  BIOEN 3301 Final Project
%  Patrick Pearson, Julie Tang, and Zach Zundel

clear('cam');
cam = webcam;

frames = 0;

samples = zeros(1, 3)

while 1
    img = snapshot(cam);
    if mod(frames, 10) == 0
        [imagePoints, boardSize] = detectCheckerboardPoints(img);
        
        pixels_per_inch = sqrt((imagePoints(1,1) - imagePoints(2,1))^2 ...
                             + (imagePoints(1,2) - imagePoints(2,2))^2);

        [x, y] = meshgrid(-4:4, -3:3);
        worldPoints = [x(:), y(:)];   

        [rotation, translation] = extrinsics(imagePoints, worldPoints, cameraParams);

        sampleTimes = 10 * (0:(frames / 10));
        samples(frames/10 + 1, :) = translation;
    end
    
    if frames > 20
        interpolatedPosition = interp1(sampleTimes, samples, frames, 'pchip', 'extrap');
    else
        interpolatedPosition = translation;
    end

    [X Y Z] = sphere(10);

    fvc = surf2patch(X * 2, Y * 2, Z * 2);

    vertices = worldToImage(cameraParams, rotation, interpolatedPosition, fvc.vertices);

    imagesc(img);
    hold on
    patch('Faces', fvc.faces, 'Vertices', vertices, 'FaceAlpha', 0, 'EdgeColor', 'green');
    hold off
    frames = frames + 1;
end
