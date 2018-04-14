workingDir = 'frames';
video = VideoReader('em_small.avi');
construct_frames(video, workingDir, 'receiver_embeddedFramesRGB', 'framesY', 'framesU', 'framesV');

scramble(key, workingDir, 'framesY', 'framesU', 'framesV');
read_message = zeros(28000,1);
count = 1;
position = 1;
image_count = 1;

frameV = zeros(320,560);
frameU = zeros(320,560);

for i= 1:28000
    if count>=28001
        break
    end
    
    if position == 181
        position = 1;
        image_count = image_count + 1;
    end
    
    if position == 1
        filename = [sprintf('%d',image_count) '.bmp'];
        fullnameV = fullfile(workingDir,'framesV',filename);
        frameV = imread(fullnameV);

        filename = [sprintf('%d',image_count) '.bmp'];
        fullnameU = fullfile(workingDir,'framesU',filename);
        frameU = imread(fullnameU);
    end
    
    
    
    read_message(count,1)=~frameU(3,(position-1)*2+1);
    read_message(count+1,1)=~frameU(3,(position-1)*2+2);
    
    read_message(count+2,1)=~frameV(3,(position-1)*2+1);
    read_message(count+3,1)=~frameV(3,(position-1)*2+2);
    
    count = count + 4;
    position = position + 1;
    
end

temp = read_message(27997:28000,1);

for i= 27996:-1:1
    read_message(i+4,1)=read_message(i,1);
end
read_message(1,1)=temp(1,1);
read_message(2,1)=temp(2,1);
read_message(3,1)=temp(3,1);
read_message(4,1)=temp(4,1);

xe = zeros(140,200);
count=1;

for i = 1:140
     for j = 1:200
          xe(i,j) = read_message(count,1);
          count = count + 1;
     end
end
figure, imshow(xe)