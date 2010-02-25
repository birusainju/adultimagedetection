function dColor=dominantColor(rgbimage)
profile -timer 'cpu'
col_black=[0 0 0];  %black
      col_rb=[0     0     132];  %red-brown
      col_g=[0     132   0];    %green
      col_bg=[0     132   132] ; %brown-green
      col_db=[132   0     0];    %dark blue
      col_p=[132   0     132];  % purple
      col_b_g=[132   132   0];    %blue-green
      col_dg=[132   132   132];  %dark-grey
      col_lg=[198   198   198];  %light-grey
      col_or=[0     0     255];  %orange-red
      col_vg=[0     255   0];    %vivid green
      col_y=[0     255   255];  %yellow
      col_b=[255   0     0];    %blue
      col_pp=[255   0     255];  %pink-purple
      col_lb=[255   255   0];    %light blue
      col_w=[255   255   255];  %white
      
  
Black_cnt=0;
Red_Brown_cnt=0;
Green_cnt=0;
Brown_Green_cnt=0;
Dark_Blue_cnt=0;
Purple_cnt=0;
Blue_Green_cnt=0;
Dark_Grey_cnt=0;
Light_Grey_cnt=0;
Orange_Red_cnt=0;
Vivid_Green_cnt=0;
Yellow_cnt=0;
Blue_cnt=0;
Pink_Purple_cnt=0;
Light_Blue_cnt=0;
White_cnt=0;
rgbimage=imresize(rgbimage,[16 16],'bicubic');
[rows cols map]=size(rgbimage);
for i=1:rows-1
    for j=1:cols-1
        r=rgbimage(i,j,1);
        g=rgbimage(i,j,2);
        b=rgbimage(i,j,3);
        rgb_vect=double([r,g,b]);
        dist_black=distance(rgb_vect,col_black);
        dist_col_rb=distance(rgb_vect,col_rb);
        dist_col_g=distance(rgb_vect,col_g);
        dist_col_bg=distance(rgb_vect,col_bg);
        dist_col_db=distance(rgb_vect,col_db);
        dist_col_p=distance(rgb_vect,col_p);
        dist_col_b_g=distance(rgb_vect,col_b_g);
        dist_col_dg=distance(rgb_vect,col_dg);
        dist_col_lg=distance(rgb_vect,col_lg);
        dist_col_or=distance(rgb_vect,col_or);
        dist_col_vg=distance(rgb_vect,col_vg);
        dist_col_y=distance(rgb_vect,col_y);
        dist_col_b=distance(rgb_vect,col_b);
        dist_col_pp=distance(rgb_vect,col_pp);
        dist_col_lb=distance(rgb_vect,col_lb);
        dist_col_w=distance(rgb_vect,col_w);
        dist=[dist_black,dist_col_rb,dist_col_g,dist_col_bg,dist_col_db,dist_col_p,dist_col_b_g,dist_col_dg,dist_col_lg,dist_col_or,dist_col_vg,dist_col_y,dist_col_b,dist_col_pp,dist_col_lb,dist_col_w]
        [minm,ind]=min(dist);
        switch(ind)
            case 1
                Black_cnt=Black_cnt+1
            case 2
                Red_Brown_cnt=Red_Brown_cnt+1
            case 3
                Green_cnt=Green_cnt+1
            case 4
                Brown_Green_cnt=Brown_Green_cnt+1
            case 5
                Dark_Blue_cnt=Dark_Blue_cnt+1
            case 6
                Purple_cnt=Purple_cnt+1
            case 7
                Blue_Green_cnt=Blue_Green_cnt+1
            case 8
                Dark_Grey_cnt=Dark_Grey_cnt+1
            case 9
                Light_Grey_cnt=Light_Grey_cnt+1
            case 10
                Orange_Red_cnt=Orange_Red_cnt+1
            case 11
                Vivid_Green_cnt=Vivid_Green_cnt+1
            case 12
                Yellow_cnt=Yellow_cnt+1
            case 13
                Blue_cnt=Blue_cnt+1
            case 14
                Pink_Purple_cnt=Pink_Purple_cnt+1
            case 15
                Light_Blue_cnt=Light_Blue_cnt+1
            case 16
                White_cnt=White_cnt+1
        end
    end
end
dom_colors=[Black_cnt,Red_Brown_cnt,Green_cnt,Brown_Green_cnt,Dark_Blue_cnt,Purple_cnt,Blue_Green_cnt,Dark_Grey_cnt,Light_Grey_cnt,Orange_Red_cnt,Vivid_Green_cnt,Yellow_cnt,Blue_cnt,Pink_Purple_cnt,Light_Blue_cnt,White_cnt];
dominant_color_index=[]
dominant_color=sort(dom_colors,'descend');
[domimnant_color_2,index]=max(dom_colors);
dominant_color_index(1)=index;
dom_colors(index)=0;
[domimnant_color_2,index]=max(dom_colors);
dominant_color_index(2)=index;
dom_colors(index)=0;
[domimnant_color_2,index]=max(dom_colors);
dominant_color_index(3)=index;
dom_colors(index)=0;
[domimnant_color_2,index]=max(dom_colors);
dominant_color_index(4)=index;
dom_colors(index)=0;
total=sum(dominant_color);
dColor=[dominant_color_index(1),dominant_color_index(2),dominant_color_index(3),dominant_color_index(4),(dominant_color(1)/total),(dominant_color(2)/total),(dominant_color(3)/total),(dominant_color(4)/total)]