%Make at least one training and test file to the length of maximum feature vector by adding appropriate number of zeros 

[test_label,data]=libsvmread('my_test8.dat');
feat=Descriptor(Lenna);
data(453,:)=feat;   %test number + 1
data=(data - repmat(min(data,[],1),size(data,1),1))*spdiags(1./(max(data,[],1)-min(data,[],1))',0,size(data,2),size(data,2));
[lab,acc,dec]=svmpredict(1,dat(453,:),CLDmodel)
