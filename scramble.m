% Scrambles a frame based on the key 
function scramble(key, height, width , noOfFrames, workingDir, frameLocationY, frameLocationU, frameLocationV) 
    % Determining the number of slots based on key
    cycle = floor(height/key);

	% Making sure that there are even slots
    if mod(cycle,2) == 1
        cycle = cycle - 1;
    end

    for i = 1:noOfFrames
        % Reading images from 1 to noOfFrames
        filename = [sprintf('%d',i) '.bmp'];
        fullname = fullfile(workingDir, frameLocationV, filename);
        frame = imread(fullname);
        abc = frame;
		
		% Iterating from 1st to cycle/2 slots
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

    % Determining the number of slots based on key

    cycle = floor(width/key);

	% Making sure that there are even slots

    if mod(cycle,2) == 1
        cycle = cycle - 1;
    end

    for i = 1:noOfFrames
        % Reading images from 1 to noOfFrames

        filename = [sprintf('%d',i) '.bmp'];
        fullname = fullfile(workingDir,frameLocationV,filename);
        frame = imread(fullname);
		% Iterating from 1st to cycle/2 slots

        for j = 1:cycle/2        
            endpart1 = cycle - j;
            endpart = (endpart1*key)+1;
            if mod(j,2) == 1
                continue;
            end
            % Swapping xth slot with cycle-x th slot

            temp = frame(:,(j-1)*key+1:j*key);
            frame(:,(j-1)*key+1:j*key) = frame(:,endpart:endpart+key-1);
            frame(:,endpart:endpart+key-1) = temp;
        end
        %figure, imshow(frame);
        imwrite(frame,fullname);

    end

    % Repeating the scrambling procedure for Y and U as well

    % Determining the number of slots based on key

    cycle = floor(height/key);

	% Making sure that there are even slots

    if mod(cycle,2) == 1
        cycle = cycle - 1;
    end

    for i = 1:noOfFrames
        % Reading images from 1 to noOfFrames

        filename = [sprintf('%d',i) '.bmp'];
        fullname = fullfile(workingDir,frameLocationU,filename);
        frame = imread(fullname);
        abc = frame;
		% Iterating from 1st to cycle/2 slots

        for j = 1:cycle/2        
            endpart1 = cycle - j;
            endpart = (endpart1*key)+1;
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

    % Determining the number of slots based on key

    cycle = floor(width/key);

	% Making sure that there are even slots

    if mod(cycle,2) == 1
        cycle = cycle - 1;
    end

    for i = 1:noOfFrames
        % Reading images from 1 to noOfFrames

        filename = [sprintf('%d',i) '.bmp'];
        fullname = fullfile(workingDir,frameLocationU,filename);
        frame = imread(fullname);
		% Iterating from 1st to cycle/2 slots

        for j = 1:cycle/2        
            endpart1 = cycle - j;
            endpart = (endpart1*key)+1;
            if mod(j,2) == 1
                continue;
            end
            % Swapping xth slot with cycle-x th slot

            temp = frame(:,(j-1)*key+1:j*key);
            frame(:,(j-1)*key+1:j*key) = frame(:,endpart:endpart+key-1);
            frame(:,endpart:endpart+key-1) = temp;
        end
        %figure, imshow(frame);
        imwrite(frame,fullname);

    end

    % Determining the number of slots based on key

    cycle = floor(height/key);

	% Making sure that there are even slots

    if mod(cycle,2) == 1
        cycle = cycle - 1;
    end

    for i = 1:noOfFrames
        % Reading images from 1 to noOfFrames

        filename = [sprintf('%d',i) '.bmp'];
        fullname = fullfile(workingDir,frameLocationY,filename);
        frame = imread(fullname);
        abc = frame;
		% Iterating from 1st to cycle/2 slots

        for j = 1:cycle/2        
            endpart1 = cycle - j;
            endpart = (endpart1*key)+1;
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

    % Determining the number of slots based on key

    cycle = floor(width/key);

	% Making sure that there are even slots

    if mod(cycle,2) == 1
        cycle = cycle - 1;
    end

    for i = 1:noOfFrames
        % Reading images from 1 to noOfFrames

        filename = [sprintf('%d',i) '.bmp'];
        fullname = fullfile(workingDir,frameLocationY,filename);
        frame = imread(fullname);
		% Iterating from 1st to cycle/2 slots

        for j = 1:cycle/2        
            endpart1 = cycle - j;
            endpart = (endpart1*key)+1;
            if mod(j,2) == 1
                continue;
            end
            % Swapping xth slot with cycle-x th slot

            temp = frame(:,(j-1)*key+1:j*key);
            frame(:,(j-1)*key+1:j*key) = frame(:,endpart:endpart+key-1);
            frame(:,endpart:endpart+key-1) = temp;
        end
        %figure, imshow(frame);
        imwrite(frame,fullname);
    end
end
