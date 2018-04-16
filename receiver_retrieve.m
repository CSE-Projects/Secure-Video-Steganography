workingDir = 'frames';

% Read video
video = VideoReader('em_video.avi');

% Constructing frames
construct_frames(video, workingDir, 'receiver_embeddedFramesRGB', 'framesY', 'framesU', 'framesV');

% Fix the same key
key = 5;

% Scrambling frames
scramble(key, height, width, noOfFrames, workingDir, 'framesY', 'framesU', 'framesV');
read_message = zeros(28000,1);

% Initializing matrices for hamming correction
r = zeros(1,7);
ht = [1 0 0; 0 1 0; 0 0 1; 1 1 0; 0 1 1; 1 1 1; 1 0 1];
count = 1;
position = 1;

% Used to keep image count
image_count = 1;

% Key to xor
xor_key = 8;

% intializations
count_diff = 1;

frameY = zeros(height,width);
frameV = zeros(height,width);
frameU = zeros(height,width);


% Iterating over each pixel
for i= 1:28000
    if count>=28001
        break
    end
    
    % Going to next image once we are done with the current one
    if position == 181
        position = 1;
        image_count = image_count + 1;
    end
    
    % Opening a new image
    if position == 1
        % Get Y component
        filename = [sprintf('%d',image_count) '.bmp'];
        fullnameY = fullfile(workingDir,'framesY',filename);
        frameY = imread(fullnameY);
        % Get V component
        filename = [sprintf('%d',image_count) '.bmp'];
        fullnameV = fullfile(workingDir,'framesV',filename);
        frameV = imread(fullnameV);
        % Get U component
        filename = [sprintf('%d',image_count) '.bmp'];
        fullnameU = fullfile(workingDir,'framesU',filename);
        frameU = imread(fullnameU);
    end
    
    % Assigning values to read matrix
    r(1,1)=xor(xor_key,frameY(3,(position-1)*3+1));
%     r(1,1)=mod(r(1,1),2);
    r(1,2)=xor(xor_key,frameY(3,(position-1)*3+2));
%     r(1,2)=mod(r(1,2),2);
    r(1,3)=xor(xor_key,frameY(3,(position-1)*3+3));
%     r(1,3)=mod(r(1,3),2);
    r(1,4)=xor(xor_key,frameU(3,(position-1)*2+1));
%     r(1,4)=mod(r(1,4),2);
    r(1,5)=xor(xor_key,frameU(3,(position-1)*2+2));
%     r(1,5)=mod(r(1,5),2);
    r(1,6)=xor(xor_key,frameV(3,(position-1)*2+1));
%     r(1,6)=mod(r(1,6),2);
    r(1,7)=xor(xor_key,frameV(3,(position-1)*2+2));
%     r(1,7)=mod(r(1,7),2);
    

    % Calculating syndrome
    z = r * ht;

    z(1,1)=mod(z(1,1),2);
    z(1,2)=mod(z(1,2),2);
    z(1,3)=mod(z(1,3),2);
    z
    
    %=== Hamming (7, 4) correction ===%
    % Making corrections using syndrome 
    if (z(1,1)==0) && (z(1,2)==0) && (z(1,3)==0)
        % No error
        count_diff = count_diff + 1;
        read_message(count)  =r(1,4);
        read_message(count+1)=r(1,5);
        read_message(count+2)=r(1,6);
        read_message(count+3)=r(1,7);
    
    % Making corrections using syndrome
    elseif (z(1,1)==1) && (z(1,2)==1) && (z(1,3)==0)
        % Error in 1st bit
        read_message(count)  =~r(1,4);
        read_message(count+1)=r(1,5);
        read_message(count+2)=r(1,6);
        read_message(count+3)=r(1,7);
    
    % Making corrections
    elseif (z(1,1)==0) && (z(1,2)==1) && (z(1,3)==1)
        % Error in 2nd bit
        read_message(count)  =r(1,4);
        read_message(count+1)=~r(1,5);
        read_message(count+2)=r(1,6);
        read_message(count+3)=r(1,7);
    
    % Making corrections
    elseif (z(1,1)==1) && (z(1,2)==1) && (z(1,3)==1)
        % Error in 3rd bit
        read_message(count)  =r(1,4);
        read_message(count+1)=r(1,5);
        read_message(count+2)=~r(1,6);
        read_message(count+3)=r(1,7);
    
    % Making corrections
    elseif (z(1,1)==1) && (z(1,2)==0) && (z(1,3)==1)
        % Error in 4th bit
        read_message(count)  =r(1,4);
        read_message(count+1)=r(1,5);
        read_message(count+2)=r(1,6);
        read_message(count+3)=~r(1,7);
        
    % Making corrections
    else 
        % Error in the redundant bits
        read_message(count)  =r(1,4);
        read_message(count+1)=r(1,5);
        read_message(count+2)=r(1,6);
        read_message(count+3)=r(1,7);
        
    end   
    count = count + 4;
    position = position + 1;
    
end


% Performing cyclic shift of image pixels using key
temp = read_message(27996:28000,1);
for i= 27995:-1:1
    read_message(i+5,1)=read_message(i,1);
end
read_message(1,1)=temp(1,1);
read_message(2,1)=temp(2,1);
read_message(3,1)=temp(3,1);
read_message(4,1)=temp(4,1);
read_message(5,1)=temp(5,1);


% Constructing the image
xe = zeros(140,200);
count=1;

for i = 1:140
     for j = 1:200
          xe(i,j) = read_message(count,1);
          count = count + 1;
     end
end
figure, imshow(xe)
imwrite(xe, 'r_message.png');
% xe - message