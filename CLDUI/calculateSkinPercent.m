function percent=calculateSkinPercent(RGBimage) 
    YCbCrimage=rgb2ycbcr(RGBimage); 

    min_Cb = 77;
    max_Cb = 127;
    min_Cr = 133;
    max_Cr = 173;

    % get a desirable binary image with the acquired range 
    imag_row=size(YCbCrimage,1); 
    imag_col=size(YCbCrimage,2); 

    binImage=zeros(imag_row,imag_col); 

    Cb=zeros(imag_row,imag_col); 
    Cr=zeros(imag_row,imag_col); 

    Cb(find((YCbCrimage(:,:,2) >= min_Cb) & (YCbCrimage(:,:,2) <= max_Cb)))=1; 
    Cr(find((YCbCrimage(:,:,3) >= min_Cr) & (YCbCrimage(:,:,3) <= max_Cr)))=1; 
    binImage= (Cb.*Cr);
    skin_pixels = size(nonzeros(binImage));
    skin_pixels_count = skin_pixels(1);
    percent = (skin_pixels_count)/(imag_row*imag_col);