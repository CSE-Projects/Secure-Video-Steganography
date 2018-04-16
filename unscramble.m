% Unscrambles a frame based on the key
function unscramble(key, height, width, noOfFrames, workingDir, frameLocationY, frameLocationU, frameLocationV) 
    % Following the reverse procedure of scrambling
	
	% Determine number of slots
    cycle = floor(width/key);

	% Making number of cycles even
    if mod(cycle,2) == 1
        cycle = cycle - 1;
    end

    for i = 1:noOfFrames
		% Read images from 1 to noOfFrames
        filename = [sprintf('%d',i) '.bmp'];
        fullname = fullfile(workingDir,frameLocationV,filename);
        frame = imread(fullname);
        for j = 1:cycle/2        
            endpart1 = cycle - j;
            endpart = (endpart1*key)+1;
	
			% Skipping odd slots            
			if mod(j,2) == 1
                continue;
            end
            
			% Swapping of slots
			temp = frame(:,(j-1)*key+1:j*key);
            frame(:,(j-1)*key+1:j*key) = frame(:,endpart:endpart+key-1);
            frame(:,endpart:endpart+key-1) = temp;
        end
        %figure, imshow(frame);
        imwrite(frame,fullname);

    end

	% Determine number of slots

    cycle = floor(height/key);

	% Making number of cycles even
    if mod(cycle,2) == 1
        cycle = cycle - 1;
    end

    for i = 1:noOfFrames
		% Read images from 1 to noOfFrames

        filename = [sprintf('%d',i) '.bmp'];
        fullname = fullfile(workingDir,frameLocationV,filename);
        frame = imread(fullname);
        abc = frame;
        for j = 1:cycle/2        
            endpart1 = cycle - j;
            endpart = (endpart1*key)+1;
			% Skipping odd slots            

            if mod(j,2) == 1
                continue;
            end
			% Swapping of slots

            temp = frame((j-1)*key+1:j*key,:);
            frame((j-1)*key+1:j*key,:) = frame(endpart:endpart+key-1,:);
            frame(endpart:endpart+key-1,:) = temp;
        end
        imwrite(frame,fullname);
    end

	% Determine number of slots

    cycle = floor(width/key);

	% Making number of cycles even
    if mod(cycle,2) == 1
        cycle = cycle - 1;
    end

    for i = 1:noOfFrames
		% Read images from 1 to noOfFrames

        filename = [sprintf('%d',i) '.bmp'];
        fullname = fullfile(workingDir,frameLocationU,filename);
        frame = imread(fullname);
        for j = 1:cycle/2        
            endpart1 = cycle - j;
            endpart = (endpart1*key)+1;
			% Skipping odd slots            

            if mod(j,2) == 1
                continue;
            end
			% Swapping of slots

            temp = frame(:,(j-1)*key+1:j*key);
            frame(:,(j-1)*key+1:j*key) = frame(:,endpart:endpart+key-1);
            frame(:,endpart:endpart+key-1) = temp;
        end
        %figure, imshow(frame);
        imwrite(frame,fullname);

    end

	% Determine number of slots

    cycle = floor(height/key);

	% Making number of cycles even
    if mod(cycle,2) == 1
        cycle = cycle - 1;
    end

    for i = 1:noOfFrames
		% Read images from 1 to noOfFrames

        filename = [sprintf('%d',i) '.bmp'];
        fullname = fullfile(workingDir,frameLocationU,filename);
        frame = imread(fullname);
        abc = frame;
        for j = 1:cycle/2        
            endpart1 = cycle - j;
            endpart = (endpart1*key)+1;
			% Skipping odd slots            

            if mod(j,2) == 1
                continue;
            end
			% Swapping of slots

            temp = frame((j-1)*key+1:j*key,:);
            frame((j-1)*key+1:j*key,:) = frame(endpart:endpart+key-1,:);
            frame(endpart:endpart+key-1,:) = temp;
        end
        imwrite(frame,fullname);
    end

	% Determine number of slots

    cycle = floor(width/key);

	% Making number of cycles even
    if mod(cycle,2) == 1
        cycle = cycle - 1;
    end

    for i = 1:noOfFrames
		% Read images from 1 to noOfFrames

        filename = [sprintf('%d',i) '.bmp'];
        fullname = fullfile(workingDir,frameLocationY,filename);
        frame = imread(fullname);
        for j = 1:cycle/2        
            endpart1 = cycle - j;
            endpart = (endpart1*key)+1;
			% Skipping odd slots            

            if mod(j,2) == 1
                continue;
            end
			% Swapping of slots

            temp = frame(:,(j-1)*key+1:j*key);
            frame(:,(j-1)*key+1:j*key) = frame(:,endpart:endpart+key-1);
            frame(:,endpart:endpart+key-1) = temp;
        end
        %figure, imshow(frame);
        imwrite(frame,fullname);

    end

	% Determine number of slots

    cycle = floor(height/key);

	% Making number of cycles even
    if mod(cycle,2) == 1
        cycle = cycle - 1;
    end

    for i = 1:noOfFrames
		% Read images from 1 to noOfFrames

        filename = [sprintf('%d',i) '.bmp'];
        fullname = fullfile(workingDir,frameLocationY,filename);
        frame = imread(fullname);
        abc = frame;
        for j = 1:cycle/2        
            endpart1 = cycle - j;
            endpart = (endpart1*key)+1;
			% Skipping odd slots            

            if mod(j,2) == 1
                continue;
            end
			% Swapping of slots

            temp = frame((j-1)*key+1:j*key,:);
            frame((j-1)*key+1:j*key,:) = frame(endpart:endpart+key-1,:);
            frame(endpart:endpart+key-1,:) = temp;
        end
        imwrite(frame,fullname);
    end
end
