function path=direction(path)
v=[0,1,1,0];  %起点方向
i=2;
      while i<=size(path,1)-1
          diffx1=path(i+1,1)-path(i,1);           diffy1=path(i+1,2)-path(i,2);          
          diffx=diffx1/sqrt((diffx1)^2+(diffy1)^2);          diffy=diffy1/sqrt((diffx1)^2+(diffy1)^2);          
          if path(i,4)==2
             v1=[0,1;-1,0]*[diffx;diffy];
          else
             v1=[0,-1;1,0]*[diffx;diffy];
          end
          if path(i+1,3)==path(i,3)
             v=[v;diffx,diffy,v1(1),v1(2);diffx,diffy,v1(1),v1(2)];
             i=i+2;
          else
             v=[v;diffx,diffy,v1(1),v1(2)];
             i=i+1;
          end         
      end
v=[v;1,0,0,1];%终点方向
path=[path,v];
end

