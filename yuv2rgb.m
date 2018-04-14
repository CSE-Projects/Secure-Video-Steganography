%yuv2rgb Convert Y, U, V components of a frame to a RGB frame
function [RGB] = yuv2rgb( Y, U, V )
    % Conversion formula YUV to RGB
    R = Y + 1.139834576 * V;
    G = Y -.3946460533 * U -.58060 * V;
    B = Y + 2.032111938 * U;

    % combine components
    RGB = cat(3,R,G,B);
    imshow(RGB);
end