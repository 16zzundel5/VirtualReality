%% Virtual Reality Renderer for MATLAB
%  BIOEN 3301 Final Project
%  Patrick Pearson, Julie Tang, and Zach Zundel

clear('cam');
cam = webcam;

frames = 0;

while 1
    img = snapshot(cam);
    if mod(frames, 10) == 0
        [imagePoints, boardSize] = detectCheckerboardPoints(img);
        
        if numel(imagePoints) > 0
            pixels_per_inch = sqrt((imagePoints(1,1) - imagePoints(2,1))^2 ...
                                 + (imagePoints(1,2) - imagePoints(2,2))^2);

            [x, y] = meshgrid(-4:4, -3:3);
            worldPoints = [x(:), y(:)];   

            [rotation, translation] = extrinsics(imagePoints, worldPoints, cameraParams);
        else
            frames = frames - 1;
        end
    end

    [X Y Z] = sphere(10);

    fvc = surf2patch(X * 2, Y * 2, Z * 2);

    vertices = worldToImage(cameraParams, rotation, translation, fvc.vertices);

    image(img);
    hold on
    patch('Faces', fvc.faces, 'Vertices', vertices, 'FaceAlpha', 0, 'EdgeColor', 'green');
    hold off

    frames = frames + 1;
end
