function [ interior,interior_mask,boundary,boundary_mask ] = bicClassifier( img, totalColor )
%BICHISTOGRAM Summary of this function goes here
%   Detailed explanation goes here

    %totalColor = floor(256/colorPerChannel);
    %quantize the image to specified bits per channel
    quantizedImage = floor(double(img)./totalColor);
    
    %extract RGB components of quantizedImage
    red = quantizedImage(:,:,1);
    green = quantizedImage(:,:,2);
    blue = quantizedImage(:,:,3);

    imageDimension = size(img);
    %interior = 255*(ones(imageDimension,'uint8')); 
    %boundary = 255*(ones(imageDimension,'uint8'));
  
    interior = 255*(zeros(imageDimension,'uint8')); 
    interior_mask = zeros(imageDimension(1:2));
    boundary = 255*(zeros(imageDimension,'uint8'));
    boundary_mask = zeros(imageDimension(1:2));
  
    numRows = imageDimension(1);
    numColumns = imageDimension(2);
   
    %initialize the boundary for given image
    boundary_mask(1,:)=1;
    boundary_mask(:,1)=1;
    boundary_mask(numRows,:)=1;
    boundary_mask(:,numColumns)=1;
    
    for row = 2:numRows-1
        for column = 2:numColumns-1
            left_red_color = red(row,column-1);
            left_green_color = green(row,column-1);
            left_blue_color = blue(row,column-1);
            if(red(row-1,column) == left_red_color && red(row,column+1) == left_red_color && red(row+1,column) == left_red_color && green(row-1,column) == left_green_color && green(row,column+1) == left_green_color && green(row+1,column) == left_green_color && blue(row-1,column) == left_blue_color && blue(row,column+1) == left_blue_color && blue(row+1,column) == left_blue_color)
                interior(row,column,:) = img(row,column,:);
                interior_mask(row,column) = 1;
            else
                boundary(row,column,:) = img(row,column,:);
                boundary_mask(row,column)=1;
            end
        end
    end
    
    
    