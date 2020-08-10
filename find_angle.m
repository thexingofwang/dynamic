function angle=find_angle(path,ob)
    angle=[];
    angle1=[];
         for i=2:size(path,1)-1
             diffx1=path(i,1)-path(i-1,1);diffy1=path(i,2)-path(i-1,2);
             diffx=diffx1/sqrt((diffx1)^2+(diffy1)^2);          diffy=diffy1/sqrt((diffx1)^2+(diffy1)^2);          
             v1=[0,1;-1,0]*[diffx;diffy];      %左旋转
             v2=[0,-1;1,0]*[diffx;diffy];      %右旋转
             angle=[angle;v1(1),v1(2),v2(1),v2(2)];
             for j=1:size(ob,2)-1                  %前一个点顺时针旋转到后一个点
                 if ob(path(i,3),j)==path(i,1) &&ob(path(i,3)+1,j)==path(i,2)
                    if j==1
                        diffx1=path(i,1)-ob(path(i,3),size(ob,2)-1);   diffy1=path(i,2)-ob(path(i,3)+1,size(ob,2)-1);
                        diffx=diffx1/sqrt((diffx1)^2+(diffy1)^2);          diffy=diffy1/sqrt((diffx1)^2+(diffy1)^2);
                        v1=[diffx;diffy];
                        diffx1=ob(path(i,3),j+1)-path(i,1);   diffy1=ob(path(i,3)+1,j+1)-path(i,2);
                        diffx=diffx1/sqrt((diffx1)^2+(diffy1)^2);          diffy=diffy1/sqrt((diffx1)^2+(diffy1)^2);
                        v2=[diffx;diffy];                        
                        angle1=[angle1;v2(1),v2(2),v1(1),v1(2)];                        
                    else
                        diffx1=ob(path(i,3),j-1)-path(i,1);   diffy1=ob(path(i,3)+1,j-1)-path(i,2);
                        diffx=diffx1/sqrt((diffx1)^2+(diffy1)^2);          diffy=diffy1/sqrt((diffx1)^2+(diffy1)^2);
                        v1=[diffx;diffy];
                        diffx1=path(i,1)-ob(path(i,3),j+1);   diffy1=path(i,2)-ob(path(i,3)+1,j+1);
                        diffx=diffx1/sqrt((diffx1)^2+(diffy1)^2);          diffy=diffy1/sqrt((diffx1)^2+(diffy1)^2);
                        v2=[diffx;diffy];
                        if path(i,4)==2
                        angle1=[angle1;v2(1),v2(2),v1(1),v1(2)];
                        else                        
                        angle1=[angle1;-v2(1),-v2(2),-v1(1),-v1(2)];
                        end
                    end
                    break;                    
                end                     
             end             
         end
         for i=1:size(angle,1)
             if  angle(i,1)*angle1(i,2)-angle(i,2)*angle1(i,1)>0
                 angle(i,1)=angle1(i,1);angle(i,2)=angle1(i,2);              
             end
             if  angle(i,1)*angle1(i,4)-angle(i,2)*angle1(i,3)>0
                 angle(i,3)=angle1(i,3);angle(i,4)=angle1(i,4);
             end             
         end
        angle=[0,0,0,0;angle;0,0,0,0];   
end