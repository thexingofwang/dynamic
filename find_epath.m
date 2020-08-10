function path=find_epath(close,goal)
father(1)=close(size(close,1),5);father(2)=close(size(close,1),6);
path=[close(size(close,1),1),close(size(close,1),2),close(size(close,1),7),close(size(close,1),8)];
while father(1)~=close(1,1)  && father(2)~=close(1,2)
      for i=2:size(close,1)-1
          if close(i,1)==father(1) &&close(i,2)==father(2)
             father(1)=close(i,5);father(2)=close(i,6);
             path=[close(i,1),close(i,2),close(i,7),close(i,8);path];
             break;  
          end         
      end      
end
path=[close(1,1),close(1,2),close(1,7),close(1,8);path];
% path=[close(1,1),close(1,2),close(1,7),close(1,8);path;goal(1),goal(2),0,0];




end