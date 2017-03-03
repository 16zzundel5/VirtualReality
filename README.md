# Virtual Reality Renderer for MATLAB :fire:
**BIOEN 3301 Computational Methods Project**  
*Patrick Pearson, Julie Tang, and Zach Zundel*

## Abstract
Long confined the to the realm of science fiction, virtual reality has 
many applications across domains as disparate as video gaming and military 
operations. One of the core tasks associated with virtual reality is 
rendering a computer-generated image over a video stream such that it 
appears that the image is integrated with the rest of the stream. Our 
project will render objects in a video stream from a webcam and display 
the results.

Our MATLAB program will connect to a webcam and fetch images one at a time.
There will be a checkerboard image in each frame of the video feed. The 
image will go through several filters to find the location of the corners 
of the checkerboard squares. First, the boundaries of the squares will be 
isolated using edge detection. Next, the equations of the lines that 
represent the boundaries will be calculated. Finally, the intersections of 
these lines will be used to calculate the locations of the corners. These 
locations will be compared to the known size and shape of the checkerboard 
image, and this will be used to determine the distance and orienation of 
the actual checkerboard in space relative to the camer. This will be used 
to calculate the position and orientation of the camera. This will inform 
the program how to render a three-dimensional object over the image.

The image will be rendered using ray-tracing. Rays will be extended out from 
the camera until they come into contact with a surface to display or they 
have traveled some distance without contacting any surface. If a ray 
contacts a surface, the distance will then be calculated between that point 
on the surface and the light source to determine the illumination of the 
surface. If the ray between the surface and the light source crosses any 
other surfaces in its path, the direct illumination will be zero and the 
illumination of that pixel will be determined by the ambient illumination 
of the scene. 
