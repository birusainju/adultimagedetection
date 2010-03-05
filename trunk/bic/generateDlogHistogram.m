function [ dlogHistogram ] = generateDlogHistogram( histogramCounts )
%GENERATEDLOGHISTOGRAM Summary of this function goes here
%   Detailed explanation goes here
    dlogHistogram = zeros(size(histogramCounts));
    for i= 1 : length(histogramCounts)
        value = histogramCounts(i);
        if(value == 0)
            dlogHistogram(i) = 0;
        elseif(value ==1)
            dlogHistogram(i) = 1;
        else
            dlogHistogram(i) = round(log2(value)+1);
       end
    end
