filename = 'message.png';

% Read message
message = imread(filename);
figure, imshow(message);
message_transpose = message';

% Converting the 2-D image into 1-D matrix 
one_d = message_transpose(:);

count=1;

% key = 5;

% Cyclic shift for the message matrix using the key
temp = one_d(1:key,1);

for i = key+1:28000
    one_d (i-key,1) = one_d (i, 1);
end

for i = 28000-key+1:28000
    one_d (i,1) = temp (i-28000+key,1);
end

% Using G for calculating Hamming code
G = [1 1 0 1 0 0 0; 0 1 1 0 1 0 0; 1 1 1 0 0 1 0; 1 0 1 0 0 0 1];
% Using xor_key for xoring the bits of the message matrix 
xor_key = 8;
% Using embed_key for determining the row where the message should be embedded
embed_key = 3;
% image_count keeps track of which image is being modified 
image_count = 1;
% position keeps track of where the message pixels are to be embedded
position = 1;
workingDir = 'frames';

fullnameV = '';
fullnameU = '';
fullnameY = '';

frameV = zeros(height,width);
frameU = zeros(height,width);
frameY = zeros(height,width);

for i = 1:4:28000
    if i+3>28000
        break;
    end
    temp = one_d(i:i+3,1);
	% Applying Hamming code
    temp = temp'*G;
	% Calculating the xor and taking mod 2
    for j = 1:7
        temp(1,j) = mod(temp(1,j),2);
        temp(1,j) = xor(temp(1,j),xor_key);
    end
    
    %temp(1,1)+temp(1,4)+temp(1,6)+temp(1,7)+temp(1,1)

	% Shifting the image_count for message embedding
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

        filename = [sprintf('%d',image_count) '.bmp'];
        fullnameY = fullfile(workingDir,'framesY',filename);
        frameY = imread(fullnameY);
    end
    
	% Embedding the message    
    frameY(embed_key,(position-1)*3+1) = temp(1,1);
    frameY(embed_key,(position-1)*3+2) = temp(1,2);
    frameY(embed_key,(position-1)*3+3) = temp(1,3);
    
    frameU(embed_key,(position-1)*2+1) = temp(1,4);
    frameU(embed_key,(position-1)*2+2) = temp(1,5);
    
    frameV(embed_key,(position-1)*2+1) = temp(1,6);
    frameV(embed_key,(position-1)*2+2) = temp(1,7);
    
    imwrite(frameU,fullnameU);
    imwrite(frameV,fullnameV);
    imwrite(frameY,fullnameY);
   	
	% Shifting the position for message embedding 
    position = position + 1;
end
