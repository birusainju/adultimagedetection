function [ norm_data ] = normalizeData( data, maximum )
%NORMALIZEDATA Summary of this function goes here
%   Detailed explanation goes here
    norm_data = floor(data./ceil(max(data)/(maximum+1)));
    
    
    
    