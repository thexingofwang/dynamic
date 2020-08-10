function direct=find_field(point,field,map_point)
direct=[];
 for i=1:size(field,2)
     if point(1)<=field(1,i) && point(1)>=field(1,i)-2  && point(2)<=field(2,i)  &&point(2)>=field(2,i)-2
         direct=field(3:6,i);
     end
 end
end