# Virtual Reality Renderer for MATLAB
**BIOEN 3301 Computational Methods Project Proposal**  
*Patrick Pearson, Julie Tang, and Zach Zundel*

**Sponsoring faculty:** [Sarang Joshi](https://www.bioen.utah.edu/directory/profile.php?userID=252)

### Overview of Project
 This project does not address a specific problem in healthcare but can address a multitude of problems. One problem it can
 address is it can help surgeon in while preforming  surgery by rendering a real time image of a tumor or body part. This is
 important because any little detail that helps surgeons maximize their probability of success will save lives. 
 Another potential problem this technology could be applied to is help motivate people to exersize. Appling the augmented 
 reality technology to games could help motivate people to exersize by allowing them to play a game simulatously. This 
 can already be seen in the app 'Pokemon Go' which motivated people to walk around in order to find Pokemon. While we will 
 not be rendering a tumor or Pokemon in real time, the rendering of an object in real time is the fundamentals behind it.
 While this itself isnt life savingly important, it can help people develop healthy habits. This project is no doubt enough 
 for a term project given its level of difficultly and its applicability to the real world. 

### Computational Approach
#### What capability of MATLAB will be applied to the problem?  
MATLAB's image processing toolbox will be used to calibrate the image with the known geometry of a checkerboard pattern. The detected geometry will be used to calculate the camera orientation and position relative to the checkerboard. This math will rely on MATLAB's builtin matrix mathematics functions. 

#### What built-in or user-defined functions will be needed?
Built-in functions will be used to perform edge detection and corner detection within each frame of the image. Basic matrix manipulation functions will then be used to calculate the position and orientation of the camera relative to the calibration pattern.

Ray-tracing functions will have to be created as user-defined functions. They will use the calibration information, the information about the object to be rendered, and information about the artificial light sources to render the object within the frame of the video stream.

#### What input and/or output capabilities will be utilized?
There will be a selection input that allows the user to select which camera to stream video from and a file input to select the 3D object file to render. Frames will be rendered and displayed to the screen as a video feed. 

#### What will be the user interface?
There will be a basic graphical user interface which allows for selection of the camera feed and the object file to render, and then a simple video frame to display output.

#### Will plotting or printing be done?
No plotting or printing will be done, but images will be displayed with the rendered object.

#### Will data be generated?
No data will be generated and saved to disk. There will be images generated but they will be simply displayed, not saved. 

#### What is the estimated length of the program?
The ray-tracing functions will occupy between 300 and 400 lines of code. Corner detection will take approximately 10 lines of code because of MATLAB's builtin functionality. Image display and image fetching will also occupy approximate 10 lines of code each. Finally, the initial GUI will occupy approximately 50 lines of code. Allowing for whitespace, commenting, and error handling, the whole project will likely occupy approximately 800 lines of code. 

### Potential Difficulties
 - What are some potential difficulties that may arise as you pursue the project?
 - How might you overcome these?

### Outcome of Project
#### What will be the "deliverable" to the sponsor (i.e., plots, statistics, data, values, images, understanding, etc.)?
The deliverable product will be a GUI application which streams images from a webcam and renders a three-dimensional object within the stream.

