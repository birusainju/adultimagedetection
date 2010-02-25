function edgehist = aids_edgehist(rgb)

% input:
%   MxNx3 image data, in RGB
%   or MxN luminance channel
% output:
%   1x5 edgehistogram <== global 5 bins (0, 45, 90, 135, no-oreintation)
% roughly as the MPEG-7 edge histogram descriptor

% check input
if length(size(rgb)) == 2
    % take as luminance directly
    lum = rgb;
elseif size(rgb,3) == 3
    % convert to luminance
    lum = rgb2ycbcr(rgb);
    lum = lum(:,:,1);
end


imgsize = size(lum);

edgemask(:,:,1) = [1 -1; 1 -1];
edgemask(:,:,4) = [1 1; -1 -1];
edgemask(:,:,2) = [sqrt(2) 0; 0 -sqrt(2)];
edgemask(:,:,3) = [0 sqrt(2); -sqrt(2) 0];
edgemask(:,:,5) = [2 -2; -2 2];

TH = 100*ones(1,5);
edgedir = [{'0^o'} {'45^o'} {'-45^o'} {'90^o'} {'iso'}];
for i = 1:5
    gradient = filter2(edgemask(:,:,i), lum, 'same');
    edgehist(i) = sum(abs(gradient(:))>TH(i));
  
end

edgehist = edgehist/prod(imgsize);