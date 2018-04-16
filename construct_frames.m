% Construct frames from video and store in respective directories
function [height, width] = construct_frames(video, workingDir, frameLocationRGB, frameLocationY, frameLocationU, frameLocationV) 
   
    i = 1;
    %=== Convert each video frame into different formats and store them ===%
    while hasFrame(video)
       % read frame from the video %
       img = readFrame(video);
       height = size(img,1);
       width = size(img,2);
       % get YUV format from function defined in rgb2yuv.m %
       % each frame's Y, U, V component to be stored separately %
       [Y, U, V] = rgb2yuv(img);
       
       % maming for each frame %
       filename = [sprintf('%d',i) '.bmp'];

       %=== Store the frames in their respective directories ===%
       fullname = fullfile(workingDir,frameLocationRGB,filename);
       imwrite(img,fullname);
       fullname = fullfile(workingDir,frameLocationY,filename);
       imwrite(Y,fullname);
       fullname = fullfile(workingDir,frameLocationU,filename);
       imwrite(U,fullname);
       fullname = fullfile(workingDir,frameLocationV,filename);
       imwrite(V,fullname);
       i = i+1;
    end
end
