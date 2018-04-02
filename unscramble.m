key = 5;

cycle = floor(560/key);

if mod(cycle,2) == 1
    cycle = cycle - 1;
end

for i = 1:166
    filename = [sprintf('%d',i) '.bmp'];
    fullname = fullfile(workingDir,'imagesV',filename);
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
    fullname = fullfile(workingDir,'imagesV',filename);
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
    fullname = fullfile(workingDir,'imagesU',filename);
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
    fullname = fullfile(workingDir,'imagesU',filename);
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
    fullname = fullfile(workingDir,'imagesY',filename);
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
    fullname = fullfile(workingDir,'imagesY',filename);
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