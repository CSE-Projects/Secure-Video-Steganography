%=== Set directory of frames ===%
workingDir = 'frames';

imageNames = dir(fullfile(workingDir,'embeddedFramesRGB','*.bmp'));
imageNames = {imageNames.name}';

outputVideo = VideoWriter('small1.avi');
outputVideo.FrameRate = 30;
open(outputVideo);

for ii = 1:length(imageNames)
   img = imread(fullfile(workingDir,'embeddedFramesRGB',imageNames{ii}));
   writeVideo(outputVideo,img)
end
close(outputVideo);

video = VideoReader('small1.mp4');
i = 1;


%=== Convert each video frame into different formats and store them ===%
while hasFrame(video)
    
   % Read frame from the video %
   img = readFrame(video);
   %=== Store the frames in their respective directories ===%
   filename = [sprintf('%d',i) '.bmp'];
   fullname = fullfile(workingDir,'receiver_embeddedFramesRGB',filename);
   imwrite(img,fullname);
   
   i = i+1;
end

 
    % Constructing video from embeddedFramesRGB frames
    % ffmpeg -start_number 1 -i %d.bmp -vcodec mpeg4 reconstructed.mp4
    % https://github.com/FFmpeg/FFmpeg