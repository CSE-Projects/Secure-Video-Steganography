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
   filename = [sprintf('%d',i) '.jpg'];
   
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

%=== Get no of frames of the video ===%
numOfFrames = floor(video.FrameRate*video.Duration) - 1;
disp(numOfFrames);

% Fix a key %
key = 6;

%== Shift row wise ==%
for i = 1:3
    filename = [sprintf('%d',i) '.jpg'];
    fullname = fullfile(workingDir,'imagesV',filename);
    frame = imread(fullname);
    
    for j = 1:key:320        
       tmp = frame(j,:);
       
       for k = j:j+key
           if k == 320
               break;
           end
           frame(k,:) = frame(k+1,:);
       end    
       frame(j+key-1,:) = tmp; 
    end    
    imwrite(frame,fullname);
    
end

%== Shift column wise ==%
for i = 1:3
    filename = [sprintf('%d',i) '.jpg'];
    fullname = fullfile(workingDir,'imagesV',filename);
    frame = imread(fullname);
    
    for j = 1:key:560
        if j+key-1 > 560
           break;
       end
       tmp = frame(:,j);
       
       for k = j+1:j+key
           if k == 560
               break;
           end
           frame(:,k) = frame(:,k+1);
       end    
       frame(:,j+key-1) = tmp; 
    end    
    figure, imshow(frame);
    imwrite(frame,fullname);
end






