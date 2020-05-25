%=== Set directories to store video frames ===%
workingDir = 'frames';
%=== exist with two arguments is better than single argument as it searches for all categories (file, dir, var, func, buitlin etc) ===%
%=== when a single argument is given. So, its better to provide specific category as second argument to search for... ===%
if( exist(workingDir, 'dir') )
    rmdir(workingDir, 's');
end
mkdir(workingDir);
mkdir(workingDir,'framesRGB');
mkdir(workingDir,'framesY');
mkdir(workingDir,'framesU');
mkdir(workingDir,'framesV');

%=== Get video reader obj for the video ===%
video = VideoReader('small.mp4');

%=== construct frames and get their dimentions from the video reader object ===%
%=== store them in these directories ===%
[height, width] = construct_frames(video, workingDir, 'framesRGB', 'framesY', 'framesU', 'framesV');

%=== Get no of frames of the video ===%
noOfFrames = floor(video.FrameRate*video.Duration) - 1;
disp(noOfFrames);

%=== Fix a key ===%
key = 5;

%=== scamble the video frames ===%
scramble(key, height, width, noOfFrames, workingDir, 'framesY', 'framesU', 'framesV');
