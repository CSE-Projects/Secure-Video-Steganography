%=== Set directory of frames ===%
workingDir = 'frames';
mkdir(workingDir,'receiver_embeddedFramesRGB');

%=== Get embedded RGB frames ===%
imageNames = dir(fullfile(workingDir,'embeddedFramesRGB','*.bmp'));
imageNames = {imageNames.name}';
% for ii = 1:length(imageNames)
%    disp(imageNames{ii});
% end

% original video
video1 = VideoReader('small.mp4');

%=== Set output video writer object ===%
outputVideo = VideoWriter('em_video.avi', 'Uncompressed AVI');
% set lossless compression
ouputVideo.LosslessCompression  = true;
% Set same frame rate as original video
outputVideo.FrameRate = video1.FrameRate
open(outputVideo);

%=== Frames to Video ===%
for ii = 1:length(imageNames)
   % read a RGB frame
   img = imread(fullfile(workingDir,'embeddedFramesRGB',[sprintf('%d',ii) '.bmp']));
   % put the frame in the video writer object
   writeVideo(outputVideo,img)
end
close(outputVideo);


%=== Check if the frames after video formation ===% 
%=== are same as the frames before =====%

video = VideoReader('em_video.avi');
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
   if img1 == img2
       count = count + 1;
   end
   i = i+1;
end

disp(count);
 
