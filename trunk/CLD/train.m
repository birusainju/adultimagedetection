%directory='F:\Majors\datasets\notporn\notporn1/*.jpg';
%directory='E:\dataset_red\porn\atrain*/*.jpg';
%base_dir='F:\Majors\datasets\notporn\notporn1\';
%base_dir='E:\dataset_red\porn\atrain\';
directory='F:\fuchhe dataset\dataset\nonporn_test\*.jpg';
base_dir='F:\fuchhe dataset\dataset\nonporn_test\';
files=dir(directory);
fileIndex = find(~[files.isdir]);
for i = 1:length(fileIndex)
    
    fileName = files(fileIndex(i)).name;
    name=[base_dir,fileName];
    try
        img=imread(name);
        feature=Descriptor(img);
        
    catch
        libsvmwrite('log.txt',-1,fileName);
    end
    sp=sparse(feature);
   
    svmfile=['U:\fuchhe8\test\nonporn_test',fileName,'.txt'];
    libsvmwrite(svmfile,-1,sp);
    i
    % Do stuff

end