function [FLag,open]=isopen1(point,open)
FLag=0;
       for i=1:size(open,1)
           if distance([open(i,1),open(i,2)],point)<1.5   &&  point(5)~=open(i,5)  &&  point(6)~=open(i,6) %0.6  0.15
              if point(3)<open(i,3)
                 open(i,:)=[];
                 open=[open;point];
              end               
              FLag=1;
              return;
           end               
       end
end