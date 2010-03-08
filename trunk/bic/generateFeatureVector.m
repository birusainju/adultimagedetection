function features = generateFeatureList( img )
%GENERATEFEATURELIST generates the feature vectors (histogram)
%Input: 
%     @img : image matrix of input image
%Output: 
%     @data : matrix containing the features(historgram) of the images in
%     the sourcedir
     [ interior,interior_mask,boundary,boundary_mask ] = bicClassifier( img, 64 );
     [ hist_count ] = generateHistogramOptimized( img,interior_mask,64,128);
     [ norm_data ] = normalizeData( hist_count, 255 );
     [ dlog_data ]= generateDlogHistogram( norm_data );
     skin_percent = calculateSkinPercent(img);
     features  = [dlog_data skin_percent];
     
  