filename = 'message.png';
message = imread(filename);
figure, imshow(message);
message_transpose = message';
one_d = message_transpose(:);

x = zeros(140,200);
count=1;

for i = 1:140
     for j = 1:200
          x(i,j) = one_d(count,1);
          count = count + 1;
     end
end
figure, imshow(x)