% Making directories
workingDir = 'frames';
mkdir(workingDir,'receiver_framesRGB');
mkdir(workingDir,'receiver_framesY');
mkdir(workingDir,'receiver_framesU');
mkdir(workingDir,'receiver_framesV');

%=== Get video reader obj for the video ===%
video = VideoReader('reconstructed.mp4');
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
   fullname = fullfile(workingDir,'receiver_framesRGB',filename);
   imwrite(img,fullname);
   % fullname = fullfile(workingDir,'imagesYCbCr',filename);
   % imwrite(YCbCr,fullname);
   fullname = fullfile(workingDir,'receiver_framesY',filename);
   imwrite(Y,fullname);
   fullname = fullfile(workingDir,'receiver_framesU',filename);
   imwrite(U,fullname);
   fullname = fullfile(workingDir,'receiver_framesV',filename);
   imwrite(V,fullname);
   
   i = i+1;
end

%=== Get no of frames of the video ===%
numOfFrames = floor(video.FrameRate*video.Duration) - 1;
disp(numOfFrames);

% Fix a key %
key = 5;

unscramble(key, workingDir, 'receiver_framesY', 'receiver_framesU', 'receiver_framesV');

