%=== Set directory of frames ===%
workingDir = 'frames';

imageNames = dir(fullfile(workingDir,'embeddedFramesRGB','*.bmp'));
imageNames = {imageNames.name}';

video1 = VideoReader('small.mp4');

outputVideo = VideoWriter('small1.avi', 'Uncompressed AVI');
outputVideo.FrameRate = video1.FrameRate
open(outputVideo);

for ii = 1:length(imageNames)
   img = imread(fullfile(workingDir,'embeddedFramesRGB',imageNames{ii}));
   writeVideo(outputVideo,img)
end
close(outputVideo);

video = VideoReader('small1.avi');
i = 1;

count = 0;
%=== Convert each video frame into different formats and store them ===%
while hasFrame(video)
    
   % Read frame from the video %
   img = readFrame(video);
   %=== Store the frames in their respective directories ===%
   filename = [sprintf('%d',i) '.bmp'];
   fullname = fullfile(workingDir,'receiver_embeddedFramesRGB',filename);
   imwrite(img,fullname);
   img1 = imread(fullfile(workingDir,'receiver_embeddedFramesRGB',filename));
   img2 = imread(fullfile(workingDir,'embeddedFramesRGB',filename));
   img1 = img1(:,:,1);
   img2 = img2(:,:,1);
   if img1 == img2
       count = count + 1;
   end
   i = i+1;
end

disp(count);
 
    % Constructing video from embeddedFramesRGB frames
    % ffmpeg -start_number 1 -i %d.bmp -vcodec mpeg4 reconstructed.mp4
    % https://github.com/FFmpeg/FFmpeg