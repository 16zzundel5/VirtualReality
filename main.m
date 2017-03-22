%% Virtual Reality Renderer for MATLAB
%  BIOEN 3301 Final Project
%  Patrick Pearson, Julie Tang, and Zach Zundel

%%
clear('cam');

%% Set up webcam
cam = webcam;

%% Set up video writer
writer = VideoWriter('checkerboard.avi', 'MPEG-4');
open(writer)

%% Main VR loop

% First write 30 frames of video with no checkerboard detection
% for k = 1:30
%   writeVideo(writer, snapshot(cam)) 
% end

% Now do checkerboard for 30 frames
for k = 1:1000;
    % Retrieve image
    img = snapshot(cam);
         
    % Get calibration data
%     [imagePoints, boardSize] = detectCheckerboardPoints(img);
%     
%     hold on;
%     if ~isempty(imagePoints)
%         imagePoints(:,3) = 10;
%         img = insertShape(img, 'FilledCircle', imagePoints, 'Color', 'green', 'Opacity', 0.7);
%     end
    
    imshow(img)
    
%     writeVideo(writer, img);
    
    % Render sphere
    % Display result
end

clear('cam');
% close(writer);
