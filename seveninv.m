function L=seveninv(ir)

try
ir=rgb2gray(ir);

end
ir=imresize(ir,[256 256],'bicubic');
ir=multiedge(ir,3);
 imshow(ir);
[i,j]=find(ir==1);
longer=nnz(i);
m01=0;m10=0;m00=0;m20=0;m11=0;m02=0;m30=0;m21=0;m12=0;m03=0;m40=0;m31=0;m22=0;m13=0;m04=0;m50=0;m41=0;m32=0;m23=0;m14=0;m05=0;
for ai=min(i):max(i);
for aj=min(j):max(j);
m01=m01+ai^0*aj^1*ir(ai,aj);
m10=m10+ai^1*aj^0*ir(ai,aj);
m00=m00+ai^0*aj^0*ir(ai,aj);
m20=m20+ai^2*aj^0*ir(ai,aj);
m11=m11+ai^1*aj^1*ir(ai,aj);
m02=m02+ai^0*aj^2*ir(ai,aj);



end
end 
n02=0;n20=0;n12=0;n21=0;n03=0;n30=0;n11=0;n00=0;n01=0;n10=0;n40=0;n31=0;n22=0;n13=0;n04=0;n50=0;n41=0;n32=0;n23=0;n14=0;n05=0;
for bi=min(i):max(i);
for bj=min(j):max(j);
n00=n00+((bi-m10/m00)^0)*((bj-m01/m00)^0)*ir(bi,bj);
n01=n01+((bi-m10/m00)^0)*((bj-m01/m00)^1)*ir(bi,bj);
n10=n10+((bi-m10/m00)^1)*((bj-m01/m00)^0)*ir(bi,bj);
n02=n02+((bi-m10/m00)^0)*((bj-m01/m00)^2)*ir(bi,bj);
n20=n20+((bi-m10/m00)^2)*((bj-m01/m00)^0)*ir(bi,bj);
n12=n12+((bi-m10/m00)^1)*((bj-m01/m00)^2)*ir(bi,bj);
n21=n21+((bi-m10/m00)^2)*((bj-m01/m00)^1)*ir(bi,bj);
n03=n03+((bi-m10/m00)^0)*((bj-m01/m00)^3)*ir(bi,bj);
n30=n30+((bi-m10/m00)^3)*((bj-m01/m00)^0)*ir(bi,bj);
n11=n11+((bi-m10/m00)^1)*((bj-m01/m00)^1)*ir(bi,bj);

n40=n40+((bi-m10/m00)^4)*((bj-m01/m00)^0)*ir(bi,bj);
n31=n31+((bi-m10/m00)^3)*((bj-m01/m00)^1)*ir(bi,bj);
n22=n22+((bi-m10/m00)^2)*((bj-m01/m00)^2)*ir(bi,bj);
n13=n13+((bi-m10/m00)^1)*((bj-m01/m00)^3)*ir(bi,bj);
n04=n04+((bi-m10/m00)^0)*((bj-m01/m00)^4)*ir(bi,bj);
n50=n50+((bi-m10/m00)^5)*((bj-m01/m00)^0)*ir(bi,bj);
n41=n41+((bi-m10/m00)^4)*((bj-m01/m00)^1)*ir(bi,bj);
n32=n32+((bi-m10/m00)^3)*((bj-m01/m00)^2)*ir(bi,bj);
n23=n23+((bi-m10/m00)^2)*((bj-m01/m00)^3)*ir(bi,bj);
n14=n14+((bi-m10/m00)^1)*((bj-m01/m00)^4)*ir(bi,bj);
n05=n05+((bi-m10/m00)^0)*((bj-m01/m00)^5)*ir(bi,bj);
end
end 

%normalised central moments
nm02=0;nm20=0;nm12=0;nm21=0;nm03=0;nm30=0;nm11=0;nm00=0;nm01=0;nm10=0;nm40=0;nm31=0;nm22=0;nm13=0;nm04=0;nm50=0;nm41=0;nm32=0;nm23=0;nm14=0;nm05=0;
for bi=min(i):max(i);
for bj=min(j):max(j);
nm00=n00/n00;
nm01=n01/(n00^1.5);
nm10=n10/(n00^1.5);
nm02=n02/(n00^2);
nm20=n20/(n00^2);
nm12=n12/(n00^2.5);
nm21=n21/(n00^2.5);
nm03=n03/(n00^2.5);
nm30=n30/(n00^2.5);
nm11=n11/(n00^2);

nm40=n40/(n00^3);
nm31=n31/(n00^3);
nm22=n22/(n00^3);
nm13=n13/(n00^3);
nm04=n04/(n00^3);
nm50=n50/(n00^3.5);
nm41=n41/(n00^3.5);
nm32=n32/(n00^3.5);
nm23=n23/(n00^3.5);
nm14=n14/(n00^3.5);
nm05=n05/(n00^3.5);
end
end



p02=n02/n00;
p20=n20/n00;
p12=n12/n00^1.25;
p21=n21/n00^1.25;
p03=n03/n00^1.25;
p30=n30/n00^1.25;
p11=n11/n00;
%q1=p20+p02
%q2=(p20-p02)^2+4*p11
%q3=(p30-3*p21)^2+(3*p21-p03)^2
%q4=(p30+p12)^2+(p21+p03)
%q5=(p30-3*p21)*(p21+p30)*((p30+p21)^2-3*(p21+p03)^2)+(3*p21-p03)*(p21+p03)*(3*(p30+p12)^2-(p21+p03)^2)
%q6=(p20-p02)*((p30+p12)^2-(p21+p03)^2)+4*p11*(p30+p12)*(p21+p03)
%q7=(3*p21-p03)*(p30+p12)*((p30+p12)^2-3*(p21+p03)^2)+(p30-3*p12)*(p21+p03)*(3*(p30+p12)^2-(p21+p03)^2)
L=[nm01,nm10,nm00,nm20,nm11,nm02,nm30,nm21,nm12,nm03,nm40,nm31,nm22,nm13,nm04,nm50,nm41,nm32,nm23,nm14,nm05]; 
%L=[q1,q2,q3,q4,q5,q6,q7];

