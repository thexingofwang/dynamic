function [FLag,open]=isopen(point,current,start,goal,open)
FLag=0;
F1=distance(current,start(:,1))+distance(current,point)+distance(point,goal);
       for i=1:size(open,1)
           if point(1)==open(i,1) && point(2)==open(i,2)
              if F1<open(i,3)
                 open(i,3)=F1;
                 open(i,4)=current(1);
                 open(i,5)=current(2);
              end               
              FLag=1;
              return;
           end               
       end
end