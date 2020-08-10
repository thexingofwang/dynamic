function map_point=drivable(ob,goal)

map_point=ob;
map_point(:,end)=[];
map_mid=[];
for i=1:2:size(map_point,1)-1  %重新排序
    map_mid=[map_mid,map_point(i:i+1,:)];
end

map_point=[goal(1),goal(2),goal(1),goal(2),0]; %  目标节点
nice=[];
n=1;
m=1;
while size(map_mid,2)>0
        for i=1:size(map_mid,2)       
               best_d=8888888;
               best_point=[];
                   for j=n:m
                         if  isconnet(map_mid(1:2,i),map_point(j,1:2),ob)==0  &&  distance(map_mid(1:2,i),map_point(j,1:2))+map_point(j,5)<best_d
                                best_d=distance(map_mid(1:2,i),map_point(j,1:2))+map_point(j,5);
                                best_point=[map_point(j,1:2)];                    
                        end                
                   end
                   if size(best_point,1)>0
                          map_point=[map_point;map_mid(1,i),map_mid(2,i),best_point(1),best_point(2),best_d];
                          best_point=[];
                          map_mid(:,i)=[1,1];
                   end               
        end  
    for j=1:size(map_mid,2)
        if map_mid(1,j)~=1 && map_mid(2,j)~=1
            nice=[nice,map_mid(:,j)];
        end
    end
    map_mid=nice;
    nice=[];   
    n=m+1;
    m=size(map_point,1);    
    for j=n+1:m
        if map_point(j,5)<map_point(n,5)
           nice=map_point(j,:);
           map_point(j,:)=map_point(n,:);
           map_point(n,:)=nice;
           nice=[];
        end       
    end
    
    for j=n:m-1
        best_d=8888888;
        value=[];
        for  k=j+1:m
            if  distance(map_point(k,1:2),map_point(j,1:2))+map_point(j,5)<map_point(k,5) && isconnet(map_point(k,1:2),map_point(j,1:2),ob)==0    
                  value=distance(map_point(k,1:2),map_point(j,1:2))+map_point(j,5);              
                  map_point(k,3)=map_point(j,1);map_point(k,4)=map_point(j,2);
                  map_point(k,5)=value;
                  if map_point(k,5)<best_d              
                      nice=map_point(k,:);
                      map_point(k,:)=map_point(j+1,:);
                      map_point(j+1,:)=nice;
                      nice=[];
                      best_d=value;
                  end                  
            end         
        end
        if  best_d==8888888  &&   j+2<=m
             for i=j+2:m
                    if map_point(i,5)<map_point(j+1,5)
                       nice=map_point(j+1,:);
                       map_point(j+1,:)=map_point(i,:);
                       map_point(i,:)=nice;
                       nice=[];
                    end       
            end
        end           
    end
end
end