%=== Set directories to store video frames ===%
workingDir = 'frames';
mkdir(workingDir);
mkdir(workingDir,'framesRGB');
mkdir(workingDir,'framesYCbCr');
mkdir(workingDir,'framesY');
mkdir(workingDir,'framesU');
mkdir(workingDir,'framesV');

%=== Get video reader obj for the video ===%
video = VideoReader('small.mp4');

% construct frames from the video reader object
% store them in these directories
construct_frames(video, workingDir, 'framesRGB', 'framesY', 'framesU', 'framesV');

%=== Get no of frames of the video ===%
numOfFrames = floor(video.FrameRate*video.Duration) - 1;
disp(numOfFrames);

% Fix a key %
key = 5;

% scamble the video frames
scramble(key, workingDir, 'framesY', 'framesU', 'framesV');