# Virtual Reality Renderer for MATLAB
**BIOEN 3301 Computational Methods Project**  
*Patrick Pearson, Julie Tang, and Zach Zundel*

**Sponsoring faculty:** [Sarang Joshi](https://www.bioen.utah.edu/directory/profile.php?userID=252)

## Abstract
Long confined the to the realm of science fiction, virtual reality has 
many applications across domains as disparate as video gaming and military 
operations. One of the core tasks associated with virtual reality is 
rendering a computer-generated image over a video stream such that it 
appears that the image is integrated with the rest of the stream. Our 
project will render objects in a video stream from a webcam and display 
the results. In order to make this project more realistic, 
our results will be rendered over and calibrated using a checkerboard. Ultimately 
this will use a combination of 3D rendering techinques and camera calibration. 

## Basic Approach
1. Connect to a webcam and fetch an image
2. Locate the checkerboard pattern and its corners within the image 
3. Calculate position and orientation of the camera relative to the checkerboard
4. Render a 3D object using ray-tracing within the image
   1. Extend a ray from the camera frame towards the object
   2. Record the distance between the viewing frame and the point of collision
   between the ray and the object, or record no collision if the ray travels a
   distance beyond which there are no objects
   3. If the ray collides with an object, extend another ray towards the light 
   source to detect if there are any occluding objects and to calculate shading
5. Display the resulting composite image
6. Repeat with the next image from a webcam

## Level of Difficulty: *High*
The functions for image recognition are already present in MATLAB's Computer Vision
toolbox, but no functions exist for raytracing. These functions must be written and
optimised. Furthermore, the project could be made more difficult by rewriting the 
general-case checkerboard recognition functions within MATLAB for our specific use 
case and comparing the efficiency of the result against MATLAB's functions.
