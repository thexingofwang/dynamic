function field=field_path(ob,map_point)
field=[];
for j=2:2:70
    for i=2:2:70
        v=[i-2,i,i,i-2,i;j,j,j-2,j-2,j];
        ob_sub=find_ob(v,ob);
        if size(ob_sub)==0
           best_d=888888;
           point=[i-1,j-1];
           value=[];
           for k=1:size(map_point,1)
               if  distance(point,map_point(k,1:2))+map_point(k,5)<best_d && isconnet(point,map_point(k,1:2),ob)==0    
                   best_d=distance(point,map_point(k,1:2))+map_point(k,5);
                   value=map_point(k,1:2);                   
               end
           end
           if size(value,1)>0
               line([point(1),value(1)],[point(2),value(2)]);hold on
               diffx1=value(1)-point(1);           diffy1=value(2)-point(2);          
               diffx=diffx1/sqrt((diffx1)^2+(diffy1)^2);          diffy=diffy1/sqrt((diffx1)^2+(diffy1)^2); 
               b=[i;j;diffx;diffy;value(1);value(2)];
               field=[field,b];
               value=[]; 
           end
        end
    end
end
for i=1:size(map_point,1)
     line([map_point(i,1),map_point(i,3)],[map_point(i,2),map_point(i,4)]);hold on
end
end