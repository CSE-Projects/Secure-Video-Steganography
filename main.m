%=== Set directories to store video frames ===%
workingDir = 'frames';
mkdir(workingDir);
mkdir(workingDir,'imagesRGB');
mkdir(workingDir,'imagesYCbCr');
mkdir(workingDir,'imagesY');
mkdir(workingDir,'imagesU');
mkdir(workingDir,'imagesV');

%=== Get video reader obj for the video ===%
video = VideoReader('small.mp4');
i = 1;

%=== Convert each video frame into different formats and store them ===%
while hasFrame(video)
    
   % Read frame from the video %
   img = readFrame(video);
   % Get YCbCr format from inbuilt function %
   YCbCr = rgb2ycbcr(img);
   % Get YUV format from function defined in rgb2yuv.m %
   % each frame's Y, U, V component to be stored separately %
   [Y, U, V] = rgb2yuv(img);
   % Naming for each frame %
   filename = [sprintf('%03d',i) '.jpg'];
   
   %=== Store the frames in their respective directories ===%
   fullname = fullfile(workingDir,'imagesRGB',filename);
   imwrite(img,fullname);
   fullname = fullfile(workingDir,'imagesYCbCr',filename);
   imwrite(YCbCr,fullname);
   fullname = fullfile(workingDir,'imagesY',filename);
   imwrite(Y,fullname);
   fullname = fullfile(workingDir,'imagesU',filename);
   imwrite(U,fullname);
   fullname = fullfile(workingDir,'imagesV',filename);
   imwrite(V,fullname);
   
   i = i+1;
end