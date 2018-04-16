%=== Set directory of frames ===%
workingDir = 'frames';
mkdir(workingDir,'embeddedFramesRGB');

% Unscramble each of the frames Y, U, V
unscramble(key, height, width, noOfFrames, workingDir, 'framesY', 'framesU', 'framesV');

% read Y, U, V frames, convert and combine them into single RGB frame
for i = 1:noOfFrames
    % Get Y component
    filename = [sprintf('%d',i) '.bmp'];
    fullname = fullfile(workingDir,'framesY',filename);
    Y = imread(fullname);
    % Get U component
    filename = [sprintf('%d',i) '.bmp'];
    fullname = fullfile(workingDir,'framesU',filename);
    U = imread(fullname);
    % Get V component
    filename = [sprintf('%d',i) '.bmp'];
    fullname = fullfile(workingDir,'framesV',filename);
    V = imread(fullname);
    
    % convert and combine Y, U, V components into RGB frame
    % YCbCr = cat(3, Y, U, V); 
    % RGB = ycbcr2rgb(YCbCr);
    RGB = yuv2rgb(Y, U, V);
    
    % store the RGB frame
    filename = [sprintf('%d',i) '.bmp'];
    fullname = fullfile(workingDir, 'embeddedFramesRGB',  filename);
    imwrite(RGB,fullname);   
end