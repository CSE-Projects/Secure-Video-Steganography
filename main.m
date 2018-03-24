%=== Set directories to store images ===%
workingDir = 'frames';
mkdir(workingDir);
mkdir(workingDir,'imagesRGB');
mkdir(workingDir,'imagesYCbCr');

%=== Get video reader obj for the video ===%
video = VideoReader('small.mp4');
i = 1;

%=== Convert each video frame into different formats and save frames in different formats ===%
while hasFrame(video)
   img = readFrame(video);
   new = rgb2ycbcr(img);
   filename = [sprintf('%03d',i) '.jpg'];
   fullname = fullfile(workingDir,'imagesRGB',filename);
   imwrite(img,fullname);
   fullname = fullfile(workingDir,'imagesYCbCr',filename);
   imwrite(new,fullname);
   i = i+1;
end