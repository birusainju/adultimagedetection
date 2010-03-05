function [ hist_count ] = generateHistogramOptimized( img,BicMask,totalColor,nbins)
%GENERATEHISTOGRAMOPTIMIZED Summary of this function goes here
%   Detailed explanation goes here
    quantizedImage = uint8(floor(double(img)./totalColor));

    %extract RGB components of quantizedImage
    red = quantizedImage(:,:,1);
    green = quantizedImage(:,:,2);
    blue = quantizedImage(:,:,3);
    
    imageDimension = size(img);
    numRows = imageDimension(1);
    numColumns = imageDimension(2);
    
    interiorPointsCount = length(nonzeros(BicMask));
    boundaryPointsCount = (numRows*numColumns) - interiorPointsCount;
    boundary_data = zeros(1,boundaryPointsCount);
    interior_data = zeros(1,interiorPointsCount);
    interior_counter = 1;
    boundary_counter = 1;
    
    for row = 1:numRows
        for column = 1:numColumns
            value = red(row,column)*16+green(row,column)*4+blue(row,column)*1;
            if(BicMask(row,column)~=0)
                %interior_data = [interior_data value];
                interior_data(interior_counter) = value;
                interior_counter = interior_counter+1;
            else
                boundary_data(boundary_counter) = value;
                boundary_counter = boundary_counter + 1;
                %boundary_data = [boundary_data value];
            end
        end
    end
    
    boundary_data = boundary_data(1:boundary_counter-1);
    interior_data = interior_data(1:interior_counter-1);
    data = [interior_data boundary_data];
    hist_count = hist(double(data),nbins);
    