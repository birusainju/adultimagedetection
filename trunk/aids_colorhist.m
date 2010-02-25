function colorhist = aids_colorhist(rgb)

% input:
%   MxNx3 image data, in RGB
% output:
%   1x256 colorhistogram <== (HxSxV = 16x4x4)
% as the MPEG-7 generic color histogram descriptor


% globals
H_BITS = 4;
S_BITS = 1;
V_BITS = 1;
% convert to hsv
hsv = uint8(255*rgb2hsv(rgb));

imgsize = size(hsv);

try
for i = 1 : 2^H_BITS
    for j = 1 : 2^S_BITS
        for k = 1 : 2^V_BITS
            colorhist(i,j,k) = sum(sum( ...
                bitshift(hsv(:,:,1),-(8-H_BITS))==i-1 &...
                bitshift(hsv(:,:,2),-(8-S_BITS))==j-1 &...
                bitshift(hsv(:,:,3),-(8-V_BITS))==k-1 ));            
        end        
    end
end
colorhist = reshape(colorhist, 1, 2^(H_BITS+S_BITS+V_BITS));
% normalize
colorhist = colorhist/sum(colorhist);
catch
    colorhist=zeros(1, 2^(H_BITS+S_BITS+V_BITS));
end