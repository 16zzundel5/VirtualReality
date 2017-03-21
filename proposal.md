# Virtual Reality Renderer for MATLAB
**BIOEN 3301 Computational Methods Project Proposal**  
*Patrick Pearson, Julie Tang, and Zach Zundel*

**Sponsoring faculty:** [Sarang Joshi](https://www.bioen.utah.edu/directory/profile.php?userID=252)

### Overview of Project
#### What real-world bioengineering problem does this project address?
This project does not address a specific problem in healthcare but the general approach can address a multitude of problems. 
One example is rendering a real time support images over a video feed for a laparoscopic surgery machine. 
This is important because any little detail or piece of information that helps surgeons maximize their probability of success will save lives. Another potential problem this technology could be applied to is help motivate people to exercise. Applying augmented reality technology to games allows games to be more immersive, which makes them more attractive to users. The effectiveness of this approach was demonstrated with the mobile gaming app *Pokémon Go* which increased the average user's step count by nearly 1000 steps per day (doi:10.1136/bmj.i6270). 
While these applications are out of the scope of this project due to their complexity, the conceptual fundamentals of rendering a digital object within a video feed remain the same. 

#### Is the level of difficulty appropriate for a term project?
This project requires a firm grasp of the control structures and best practices taught within the class as well as methods for matrix manipulation to implement a GUI and perform camera calibration. It will be necessary to combine techniques in ways not already practiced, requiring an understanding beyond superficial regurgitation of the in-class or in-text examples. 
Furthermore, some functions from the Image Processing Toolbox will need to be used for corner detection. This will require research and comprehension of the documentation for that toolbox. 
Lastly, the understanding of graphics rendering and ray-tracing algorithms required to implement the object rendering will require research outside of the class curriculum. These three factors together mean that the project as a whole will be difficult but still within appropriate difficulty levels for a term project. 

### Computational Approach
#### What capability of MATLAB will be applied to the problem?  
MATLAB's image processing toolbox will be used to calibrate the image with the known geometry of a checkerboard pattern. The detected geometry will be used to calculate the camera orientation and position relative to the checkerboard. This math will rely on MATLAB's builtin matrix mathematics functions. 

#### What built-in or user-defined functions will be needed?
Built-in functions will be used to perform edge detection and corner detection within each frame of the image. Basic matrix manipulation functions will then be used to calculate the position and orientation of the camera relative to the calibration pattern. **Patrick Pearson** will be responsible for researching and utilizing the image interpretation methods from MATLAB's Image Processing Toolbox and using the detected features to calculate the camera position and orientation. 

Ray-tracing functions will have to be created as user-defined functions. They will use the calibration information, the information about the object to be rendered, and information about the artificial light sources to render the object within the frame of the video stream. **Zach Zundel** will be responsible for writing the ray-tracing functions and the functions for interpreting three-dimensional model files. 

#### What input and/or output capabilities will be utilized?
There will be a selection input that allows the user to select which camera to stream video from and a file input to select the 3D object file to render. Frames will be rendered and displayed to the screen as a video feed. 

#### What will be the user interface?
There will be a basic graphical user interface which allows for selection of the camera feed and the object file to render, and then a simple video frame to display output. **Julie Tang** will be specifically tasked with designing and implementing the user interface, as well as coordinating with the worker functions to ensure that all components of the program communicate efficiently and effectively. 

#### Will plotting or printing be done?
No plotting or printing will be done, but images will be displayed with the rendered object.

#### Will data be generated?
No data will be generated and saved to disk. There will be images generated but they will be simply displayed, not saved. 

#### What is the estimated length of the program?
The ray-tracing functions will occupy between 300 and 400 lines of code. Corner detection will take approximately 10 lines of code because of MATLAB's builtin functionality. Image display and image fetching will also occupy approximate 10 lines of code each. Finally, the initial GUI will occupy approximately 50 lines of code. Allowing for whitespace, commenting, and error handling, the whole project will likely occupy approximately 800 lines of code. 

### Potential Difficulties
#### What are some potential difficulties that may arise as you pursue the project?
One large difficulty will be working with images where the calibration features are not completely detected, or not detected at all. Another is the high computational cost of both image processing and ray-tracing.

An entirely-different type of problem is that of illumination of the rendered object. If too many or too few light sources are used in calculating illumination, then the object will look too unnatural.

#### How might you overcome these?
If no calibration features are detected, the program could interpolate the current position and orientation of the camera from previous values. This could be implemented by default, instead of as an error handling method, which would speed up the processing time for images and address the second problem. Finally, if the camera is not moving very quickly or at all, the raytraced image would not change and rendering could occur much faster as it would simply by superimposing the previously-rendered object over a new image.

The correct number of light sources and the ambient light levels in the room can be estimated by observing the illumination of the calibration pattern. Trial and error will have to be used to map measured illumination to number, position, and intensity of virtual light sources illumination the rendered object.

### Outcome of Project
#### What will be the "deliverable" to the sponsor (i.e., plots, statistics, data, values, images, understanding, etc.)?
The deliverable product will be a GUI application which streams images from a webcam and renders a three-dimensional object within the stream.

