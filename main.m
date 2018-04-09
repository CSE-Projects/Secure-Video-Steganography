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
i = 1;


%=== Convert each video frame into different formats and store them ===%
while hasFrame(video)
    
   % Read frame from the video %
   img = readFrame(video);
   % Get YCbCr format from inbuilt function %
   % YCbCr = rgb2ycbcr(img);
   % Get YUV format from function defined in rgb2yuv.m %
   % each frame's Y, U, V component to be stored separately %
   [Y, U, V] = rgb2yuv(img);
   % Naming for each frame %
   filename = [sprintf('%d',i) '.bmp'];
   
   %=== Store the frames in their respective directories ===%
   fullname = fullfile(workingDir,'framesRGB',filename);
   imwrite(img,fullname);
   % fullname = fullfile(workingDir,'imagesYCbCr',filename);
   % imwrite(YCbCr,fullname);
   fullname = fullfile(workingDir,'framesY',filename);
   imwrite(Y,fullname);
   fullname = fullfile(workingDir,'framesU',filename);
   imwrite(U,fullname);
   fullname = fullfile(workingDir,'framesV',filename);
   imwrite(V,fullname);
   
   i = i+1;
end

%=== Get no of frames of the video ===%
numOfFrames = floor(video.FrameRate*video.Duration) - 1;
disp(numOfFrames);

% Fix a key %
key = 5;

scramble(key, workingDir, 'framesY', 'framesU', 'framesV');
