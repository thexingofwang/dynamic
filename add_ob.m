function map_change=add_ob(map_change,add,ob)
map_mid=[];
son=[];
son1=[];
for i=1:size(add,2)-1  %重新排序
    map_mid=[map_mid;[add(1,i),add(2,i),add(1,i),add(2,i),888888]];
end
n=size(map_change,1);
map_change=[map_change;map_mid];
m=size(map_change,1);
for i=n+1:m
    son1=[son1;[i,888888]];
end
for i=1:size(map_change,1)  %加入被障碍物影响的点
    if   isconnet(map_change(i,1:2),map_change(i,3:4),add)==1
        son=[son;[i,map_change(i,5)]];
        map_change(i,5)=888888;
    end    
end
son1=[son1;son];
%%%%%%%%求暂时最短路径
for i=1:size(son1,1)  
    best_d=888888;
    m=0;
    for j=1:size(map_change,1)
        if isconnet(map_change(son1(i,1),1:2),map_change(j,1:2),ob)==0  &&  distance(map_change(son1(i,1),1:2),map_change(j,1:2))+map_change(j,5)<best_d
             best_d=distance(map_change(son1(i,1),1:2),map_change(j,1:2))+map_change(j,5);
             m=j;
        end
    end
    if m~=0
        map_change(son1(i,1),3)=map_change(m,1);map_change(son1(i,1),4)=map_change(m,2);
        map_change(son1(i,1),5)=best_d;
    end    
end
%%%%%%%%%%%%求估价最小点
nice=[];
for i=2:size(son1,1)          
   if map_change(son1(i,1),5)<map_change(son1(1,1),5)
       nice=son1(i,:);
       son1(i,:)=son1(1,:);
       son1(1,:)=nice;
       nice=[];
   end           
end
%%%%%%%%%%%内部迭代
for i=1:size(son1,1)
            best_d=8888888;
            value=[];
            for  k=i+1:size(son1,1)
                if  distance(map_change(son1(i,1),1:2),map_change(son1(k,1),1:2))+map_change(son1(i,1),5)<map_change(son1(k,1),5) && isconnet(map_change(son1(k,1),1:2),map_change(son1(i,1),1:2),ob)==0    
                      value=distance(map_change(son1(i,1),1:2),map_change(son1(k,1),1:2))+map_change(son1(i,1),5);              
                      map_change(son1(k,1),3)=map_change(son1(i,1),1);map_change(son1(k,1),4)=map_change(son1(i,1),2);
                      map_change(son1(k,1),5)=value;
                      if map_change(son1(k,1),5)<best_d              
                          nice=son1(k,:);
                          son1(k,:)=son1(i+1,:);
                          son1(i+1,:)=nice;
                          nice=[];
                          best_d=value;
                      end                  
                end         
            end
            %%%%%%%%%%%%%%%%%无通过i+1的最短路径 ，选次小
            if  best_d==8888888  &&  i+2<=size(son1,1)
                 for j=i+2:size(son1,1)
                        if map_change(son1(j,1),5)<map_change(son1(i+1),5)
                           nice=son1(j,:);
                           son1(j,:)=son1(i+1,:);
                           son1(i+1,:)=nice;
                           nice=[];
                        end       
                 end
            end
end
parent=[];
for i=1:size(son,1)
    parent=[parent;[map_change(son(i,1),1),map_change(son(i,1),2),map_change(son(i,1),5)-son(i,2)]];        
end
map_change=update_map(map_change,ob,parent);
end

