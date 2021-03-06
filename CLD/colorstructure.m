function color=colorstructure(hue,sum,dif)
    quantizationLevels=64;
    h=zeros(64,1);
    t=zeros(64,1);
    E = 16;
    quantTable =[1,8,4,4,6,4,4,4,4,4];
    k=2;
    for y=1:2:496
        for x=1:2:496
            for m=1:64
                t(m)=0;
            end
            for yy=y:k:y+16
                for xx=x:k:x+16
                    if dif(xx,yy)<7
                        subspace=0;
                    elseif dif(xx,yy)>6 & dif(xx,yy)<21
                        subspace=1;
                    elseif dif(xx,yy)>19 & dif(xx,yy)<60
                        subspace=2;
                    elseif dif(xx,yy)>59 & dif(xx,yy)<110
                        subspace=3;
                    elseif dif(xx,yy)>109 & dif(xx,yy)<256
                        subspace=4;
                    end
                     m = ceil(((hue(xx,yy) / quantizationLevels) * quantTable(subspace+1) + (sum(xx,yy) / quantizationLevels) * quantTable(subspace+2)));
                    t(m+1)=t(m+1)+1;
                end
            end
            for bi=1:64
                if(t(bi)>0)
                    h(bi)=h(bi)+1;
                end
            end

        end
    end
    color=h;
