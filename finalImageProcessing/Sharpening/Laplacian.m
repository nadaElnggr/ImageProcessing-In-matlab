function[out] = Laplacian(originalImage)
[rows ,cols ,layers]=size(originalImage);
if layers > 1
    originalImage=rgb2gray(originalImage);
end
gray_image = double(originalImage);
[rows,cols]=size(gray_image);
mask = [0,-1,0;-1,4,-1;0,-1,0];
out = gray_image;
for i=2:rows-1
 for j=2:cols-1
     temp = mask.*gray_image(i-1:i+1,j-1:j+1);
     value = sum(temp(:));
     out(i, j) = gray_image(i , j) + value ;
end
end
out = uint8(out);
end
