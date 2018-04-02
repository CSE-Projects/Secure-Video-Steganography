filename = 'message.png';
message = imread(filename);
figure, imshow(message);
message_transpose = message';
one_d = message_transpose(:);

count=1;

% Hamming code added
key = 5;

temp = one_d(1:key,1);

for i = key+1:28000
    one_d (i-key,1) = one_d (i, 1);
end

for i = 28000-key+1:28000
    one_d (i,1) = temp (i-28000+key,1);
end

G = [1 1 0 1 0 0 0; 0 1 1 0 1 0 0; 1 1 1 0 0 1 0; 1 0 1 0 0 0 1];
xor_key = 8;
embed_key = 3;
image_count = 1;
position = 1;
workingDir = 'frames';

fullnameV;
fullnameU;
fullnameY;

frameV = zeros(320,560);
frameU = zeros(320,560);
frameY = zeros(320,560);

for i = 1:4:28000
    
    if i+3>28000
        break;
    end
    
    temp = one_d(i:i+3,1);
    temp = temp'*G;
    
    for j = 1:7
        temp(1,j) = mod(temp(1,j),2);
        temp(1,j) = xor(temp(1,j),xor_key);
    end
    
    if position == 181
        position = 1;
        image_count = image_count + 1;
    end
    
    if position == 1
        filename = [sprintf('%d',image_count) '.bmp'];
        fullnameV = fullfile(workingDir,'imagesV',filename);
        frameV = imread(fullnameV);

        filename = [sprintf('%d',image_count) '.bmp'];
        fullnameU = fullfile(workingDir,'imagesU',filename);
        frameU = imread(fullnameU);

        filename = [sprintf('%d',image_count) '.bmp'];
        fullnameY = fullfile(workingDir,'imagesY',filename);
        frameY = imread(fullnameY);
    end
        
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
    
    position = position + 1;
end
