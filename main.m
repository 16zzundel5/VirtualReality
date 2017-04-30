%% Virtual Reality Renderer for MATLAB
%  BIOEN 3301 Final Project
%  Patrick Pearson, Julie Tang, and Zach Zundel
%% Initial setup of variables
clear('cam');
cam = webcam;

frames = 0;

samples = zeros(1, 3);
interval = 10;

%% Rendering and detection
while 1
    % Collect an image from the camera
    img = snapshot(cam);
    
    % If we're on an interval frame, we should re-detect the checkerboard
    if mod(frames, interval) == 0
        % Detect image points on the 
        [imagePoints, boardSize] = detectCheckerboardPoints(img);
        
        [x, y] = meshgrid(-4:4, -2:3);
        worldPoints = [x(:), y(:)];   
        
        if size(imagePoints) == size(worldPoints)
            [rotation, translation] = extrinsics(imagePoints, worldPoints, cameraParams);
            position = -rotation * translation';
 
        else
            frames = frames - 1;
        end
    end

    [X, Y, Z] = sphere(4);

    fvc = surf2patch(X, Y, Z - 1);

    vertices = worldToImage(cameraParams, rotation, translation, fvc.vertices);

    imagesc(img);
    hold on
    patch('Faces', fvc.faces, 'Vertices', vertices, 'FaceAlpha', 0, 'EdgeColor', 'green');
    hold off
    frames = frames + 1;
end
