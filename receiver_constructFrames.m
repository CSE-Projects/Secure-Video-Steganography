% Making directories
workingDir = 'frames';
mkdir(workingDir,'receiver_framesRGB');
mkdir(workingDir,'receiver_framesYCbCr');
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

% Determining the number of slots based on key
cycle = floor(320/key);

if mod(cycle,2) == 1
    cycle = cycle - 1;
end

for i = 1:166
	% Reading images from 1 to 166
    filename = [sprintf('%d',i) '.bmp'];
    fullname = fullfile(workingDir,'receiver_framesV',filename);
    frame = imread(fullname);
    abc = frame;
    for j = 1:cycle/2        
        endpart1 = cycle - j;
        endpart = (endpart1*key)+1;
		% Skipping odd slots
        if mod(j,2) == 1
            continue;
        end
		% Swapping xth slot with cycle-x th slot
        temp = frame((j-1)*key+1:j*key,:);
        frame((j-1)*key+1:j*key,:) = frame(endpart:endpart+key-1,:);
        frame(endpart:endpart+key-1,:) = temp;
    end
    imwrite(frame,fullname);
end

% Repeating the swapping procedure column wise

cycle = floor(560/key);

if mod(cycle,2) == 1
    cycle = cycle - 1;
end

for i = 1:166
    filename = [sprintf('%d',i) '.bmp'];
    fullname = fullfile(workingDir,'receiver_framesV',filename);
    frame = imread(fullname);
    for j = 1:cycle/2        
        endpart1 = cycle - j;
        endpart = (endpart1*key)+1;
        if mod(j,2) == 1
            continue;
        end
        temp = frame(:,(j-1)*key+1:j*key);
        frame(:,(j-1)*key+1:j*key) = frame(:,endpart:endpart+key-1);
        frame(:,endpart:endpart+key-1) = temp;
    end
    %figure, imshow(frame);
    imwrite(frame,fullname);

end

% Repeating the scrambling procedure for Y and U as well
cycle = floor(320/key);

if mod(cycle,2) == 1
    cycle = cycle - 1;
end

for i = 1:166
    filename = [sprintf('%d',i) '.bmp'];
    fullname = fullfile(workingDir,'receiver_framesY',filename);
    frame = imread(fullname);
    abc = frame;
    for j = 1:cycle/2        
        endpart1 = cycle - j;
        endpart = (endpart1*key)+1;
        if mod(j,2) == 1
            continue;
        end
        temp = frame((j-1)*key+1:j*key,:);
        frame((j-1)*key+1:j*key,:) = frame(endpart:endpart+key-1,:);
        frame(endpart:endpart+key-1,:) = temp;
    end
    imwrite(frame,fullname);
end

cycle = floor(560/key);

if mod(cycle,2) == 1
    cycle = cycle - 1;
end

for i = 1:166
    filename = [sprintf('%d',i) '.bmp'];
    fullname = fullfile(workingDir,'receiver_framesY',filename);
    frame = imread(fullname);
    for j = 1:cycle/2        
        endpart1 = cycle - j;
        endpart = (endpart1*key)+1;
        if mod(j,2) == 1
            continue;
        end
        temp = frame(:,(j-1)*key+1:j*key);
        frame(:,(j-1)*key+1:j*key) = frame(:,endpart:endpart+key-1);
        frame(:,endpart:endpart+key-1) = temp;
    end
    %figure, imshow(frame);
    imwrite(frame,fullname);

end


cycle = floor(320/key);

if mod(cycle,2) == 1
    cycle = cycle - 1;
end

for i = 1:166
    filename = [sprintf('%d',i) '.bmp'];
    fullname = fullfile(workingDir,'receiver_framesU',filename);
    frame = imread(fullname);
    abc = frame;
    for j = 1:cycle/2        
        endpart1 = cycle - j;
        endpart = (endpart1*key)+1;
        if mod(j,2) == 1
            continue;
        end
        temp = frame((j-1)*key+1:j*key,:);
        frame((j-1)*key+1:j*key,:) = frame(endpart:endpart+key-1,:);
        frame(endpart:endpart+key-1,:) = temp;
    end
    imwrite(frame,fullname);
end

cycle = floor(560/key);

if mod(cycle,2) == 1
    cycle = cycle - 1;
end

for i = 1:166
    filename = [sprintf('%d',i) '.bmp'];
    fullname = fullfile(workingDir,'receiver_framesU',filename);
    frame = imread(fullname);
    for j = 1:cycle/2        
        endpart1 = cycle - j;
        endpart = (endpart1*key)+1;
        if mod(j,2) == 1
            continue;
        end
        temp = frame(:,(j-1)*key+1:j*key);
        frame(:,(j-1)*key+1:j*key) = frame(:,endpart:endpart+key-1);
        frame(:,endpart:endpart+key-1) = temp;
    end
    %figure, imshow(frame);
    imwrite(frame,fullname);
end