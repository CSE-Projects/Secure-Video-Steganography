%rgb2yuv Convert RBG frame to separate Y, U, V components
function [Y, U, V] = rgb2yuv( RGB )
	% Get R, G, B components of the frame
    R = RGB(:,:,1); 
    G = RGB(:,:,2); 
    B = RGB(:,:,3); 
    % Conversion formula RGB to YUV
    Y = 0.299 * R + 0.587 * G + 0.114 * B; 
    U = (-0.14713 * R )- (0.28886 * G) + (0.436 * B); 
    V = 0.615 * R - 0.51499 * G - 0.10001 * B; 
    % imshow(Y);
    % imshow(U);
    % imshow(V);
end