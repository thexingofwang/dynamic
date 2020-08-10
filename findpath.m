function path=findpath(close,goal)
father(1)=close(size(close,1),4);father(2)=close(size(close,1),5);
path=[close(size(close,1),1),close(size(close,1),2),close(size(close,1),6)];
while father(1)~=close(1,1)  && father(2)~=close(1,2)
      for i=2:size(close,1)-1
          if close(i,1)==father(1) &&close(i,2)==father(2)
             father(1)=close(i,4);father(2)=close(i,5);
             path=[close(i,1),close(i,2),close(i,6);path];
             break;  
          end         
      end      
end
path=[close(1,1),close(1,2),close(1,6);path;goal(1),goal(2),0];
end