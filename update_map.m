function map_change=update_map(map_change,ob,parent)
   son=[];
   while size(parent,1)>0  
       
       for i=1:size(parent,1)
           for j=1:size(map_change,1)                
             if map_change(j,3)==parent(i,1)  &&  map_change(j,4)==parent(i,2)
                map_change(j,5)=map_change(j,5)+parent(i,3);
                diff_cost=parent(i,3);
                best_d=map_change(j,5);
                m=0;
                for k=1:size(map_change,1)
                    if isconnet(map_change(k,1:2),map_change(j,1:2),ob)==0   &&    distance(map_change(k,1:2),map_change(j,1:2))+map_change(k,5)<best_d
                         best_d=distance(map_change(k,1:2),map_change(j,1:2))+map_change(k,5);
                         m=k;
                     end
                end
                if m~=0
                    map_change(j,3)=map_change(m,1);  map_change(j,4)=map_change(m,2);
                    diff_cost=diff_cost+best_d-map_change(j,5);
                    map_change(j,5)=best_d;
                    son=[son;[j,diff_cost]];
                else
                    son=[son;[j,diff_cost]];
                end               
             end
           end
       end
       %%%%%%%%%%%找最小
       nice=[];
       for i=2:size(son,1)          
           if map_change(son(i,1),5)<map_change(son(1,1),5)
               nice=son(i,:);
               son(i,:)=son(1,:);
               son(1,:)=nice;
               nice=[];
           end           
       end
       %%%%%%%%%%%%%%%%%%%%%内部迭代
       for i=1:size(son,1)-1
            best_d=8888888;
            value=[];
            for  k=i+1:size(son,1)
                if  distance(map_change(son(i,1),1:2),map_change(son(k,1),1:2))+map_change(son(i,1),5)<map_change(son(k,1),5) && isconnet(map_change(son(k,1),1:2),map_change(son(i,1),1:2),ob)==0    
                      value=distance(map_change(son(i,1),1:2),map_change(son(k,1),1:2))+map_change(son(i,1),5);              
                      map_change(son(k,1),3)=map_change(son(i,1),1);map_change(son(k,1),4)=map_change(son(i,1),2);
                      diff_cost=son(k,2)+value-map_change(son(k,1),5);
                      son(k,2)=diff_cost;
                      map_change(son(k,1),5)=value;
                      if map_change(son(k,1),5)<best_d              
                          nice=son(k,:);
                          son(k,:)=son(i+1,:);
                          son(i+1,:)=nice;
                          nice=[];
                          best_d=value;
                      end                  
                end         
            end
            %%%%%%%%%%%%%%%%%无通过i+1的最短路径 ，选次小
            if  best_d==8888888  &&  i+2<=size(son,1)
                 for j=i+2:size(son,1)
                        if map_change(son(j,1),5)<map_change(son(i+1),5)
                           nice=son(j,:);
                           son(j,:)=son(i+1,:);
                           son(i+1,:)=nice;
                           nice=[];
                        end       
                 end
            end            
       end
      parent=[];
      for i=1:size(son,1)
          parent=[parent;[map_change(son(i,1),1),map_change(son(i,1),2),son(i,2)]];         
      end
      son=[];
   end   
   
end