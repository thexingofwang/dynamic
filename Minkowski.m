function path=Minkowski(path)
i=2;
       while i<=size(path,1)-1
           if path(i+1,3)==path(i,3) && path(i+1,5)==path(i,5) && path(i+1,6)==path(i,6)
             if path(i,4)==2
                 path(i+1,1)=path(i+1,1)+5*path(i+1,5);
                 path(i+1,2)=path(i+1,2)+5*path(i+1,6);
                 i=i+2;
              else
                 path(i,1)=path(i,1)+2.5*path(i,7);
                 path(i,2)=path(i,2)+2.5*path(i,8); 
                 path(i+1,1)=path(i+1,1)+5*path(i+1,5)+2.5*path(i+1,7);
                 path(i+1,2)=path(i+1,2)+5*path(i+1,6)+2.5*path(i+1,8);
                 i=i+2;
             end
           else
               if path(i,4)==1
                  path(i,1)=path(i,1)+2.5*path(i,7);
                  path(i,2)=path(i,2)+2.5*path(i,8);                 
               end
               i=i+1;
          end                     
       end
end
