function path=R_L(path,ob)
side=[0];
for i=1:size(path,1)-2
    for j=1:size(ob,2)
        x1=path(i+1,1)-path(i,1); y1=path(i+1,2)-path(i,2);
        x2=ob(path(i+1,3),j)-path(i,1);  y2=ob(path(i+1,3)+1,j)-path(i,2);
       if  x1*y2 - x2*y1<0        %◊Û±ﬂ 1
          side=[side;1];
          break;
       elseif  x1*y2 - x2*y1>0    %”“±ﬂ 2
          side=[side;2];
          break;
       end
    end         
end
side=[side;0];
path=[path,side];
end