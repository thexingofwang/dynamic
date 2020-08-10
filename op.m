function [path,signal]=op(path1,path,op_an,angle,i)
path2=path1;  %path1 Ô­Î´¶¯¹ý
signal=0;
       
       if path1(i+1,5)*op_an(i+1,2)-path1(i+1,6)*op_an(i+1,1)>=0
           if path1(i+1,5)*path(i+1,6)-path1(i+1,6)*path(i+1,5)>=0
              a=[cos(pi/180),-sin(pi/180);sin(pi/180),cos(pi/180)]*[path(i+1,5);path(i+1,6)];
              if a(1)*angle(i+1,4)-a(2)*angle(i+1,3)<0
              a=[cos(pi/180),sin(pi/180);-sin(pi/180),cos(pi/180)]*[path1(i+1,5);path1(i+1,6)];
                  if a(1)*angle(i+1,2)-a(2)*angle(i+1,1)>0
                      signal=1;
                      return;
                  end
              end
           else
              a=[cos(pi/180),sin(pi/180);-sin(pi/180),cos(pi/180)]*[path(i+1,5);path(i+1,6)];
               if a(1)*angle(i+1,2)-a(2)*angle(i+1,1)>0
                      signal=1; 
                      return;
               end
           end           
       else
           if path1(i+1,5)*path(i+1,6)-path1(i+1,6)*path(i+1,5)<=0
              a=[cos(pi/180),sin(pi/180);-sin(pi/180),cos(pi/180)]*[path(i+1,5);path(i+1,6)];
              if a(1)*angle(i+1,2)-a(2)*angle(i+1,1)>0
              a=[cos(pi/180),-sin(pi/180);sin(pi/180),cos(pi/180)]*[path1(i+1,5);path1(i+1,6)];
                  if a(1)*angle(i+1,4)-a(2)*angle(i+1,3)<0
                      signal=1;
                      return;
                  end  
              end
           else
              a=[cos(pi/180),-sin(pi/180);sin(pi/180),cos(pi/180)]*[path(i+1,5);path(i+1,6)];
              if a(1)*angle(i+1,4)-a(2)*angle(i+1,3)<0
                      signal=1; 
                      return;
              end 
           end                
       end 
       
               path2(i+1,5)=a(1); path2(i+1,6)=a(2);
               if path1(i+1,4)==2
               v1=[0,1;-1,0]*[path2(i+1,5);path2(i+1,6)];
               path2(i+1,7)=v1(1);path2(i+1,8)=v1(2);
               else
               v1=[0,-1;1,0]*[path2(i+1,5);path2(i+1,6)];
               path2(i+1,7)=v1(1);path2(i+1,8)=v1(2);
               end
 path=Minkowski(path2);      
end