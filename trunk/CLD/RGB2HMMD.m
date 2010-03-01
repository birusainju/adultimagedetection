function [dif,sum]=RGB2HMMD(r,g,b)

    maxm = max(max(r,g),max(g,b));
    minm= min(min(r,g),min(g,b));
    dif = (maxm - minm);
    sum = ((maxm + minm) / 2);

   % dif=dif/2;
   