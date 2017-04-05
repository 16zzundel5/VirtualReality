%% Virtual Reality Renderer for MATLAB
%  BIOEN 3301 Final Project
%  Patrick Pearson, Julie Tang, and Zach Zundel

%%
clear('cam');

%% Set up webcam
%cam = webcam;

%% Set up video writer
%writer = VideoWriter('checkerboard.avi', 'MPEG-4');

%% Main VR loop

% First write 30 frames of video with no checkerboard detection

 for k = 1:30
   writeVideo(writer, snapshot(cam)) 
 end


% Now do checkerboard for 30 frames

%for k = 1:120
    % Retrieve image
    img = imread('test.jpeg');
         
    % Get calibration data

     [imagePoints, boardSize] = detectCheckerboardPoints(img);
     
     hold on;
     if ~isempty(imagePoints)
         imagePoints(:,3) = 10;
         img = insertShape(img, 'FilledCircle', imagePoints, 'Color', 'green', 'Opacity', 0.7);
     end
    
    imshow(img)
    
     writeVideo(writer, img);

    
   imshow(img)
%end
a=[-3:3]
Worldpts=[[a,a,a,a,a,a,a,a,a]',[-4:4,-4:4,-4:4,-4:4,-4:4,-4:4,-4:4]']

[rotation,translation]=extrinsics(imagePoints(:, 1:2), Worldpts, cameraParams);  

ax = imshow(

[X Y Z] = sphere;
surface = surf(X, Y, Z);
axes = surface.Parent;
axes.CameraPosition = translation;
axes.CameraUpVector = 

%     writeVideo(writer, img); 
    % Render sphere
    % Display render image

% average frame rate is 8 frames per second
% 1

%close(writer);

%%


