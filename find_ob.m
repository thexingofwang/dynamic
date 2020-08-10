function ob_sub=find_ob(v,ob_v)
        ob_sub=[];
        xmax=max(v(1,:));
        xmin=min(v(1,:));
        ymax=max(v(2,:));
        ymin=min(v(2,:));
        flag2=0;
        flag1=0;
        
        for i=1:2:size(ob_v,1)-1
            
           if min(ob_v(i,:))>=xmax || max (ob_v(i,:))<=xmin || min(ob_v(i+1,:))>=ymax || max(ob_v(i+1,:))<=ymin              
           else               
               for j=1:size(ob_v,2)-1
                  if isinside((ob_v(i,j+1)+ob_v(i,j))*0.5,(ob_v(i+1,j+1)+ob_v(i+1,j))*0.5,v) 
                     ob_sub=[ob_sub,i];
                     flag2=1;
                     break;
                  end
               end
               if flag2==0
                  for j=1:size(v,2)-1
                      if isinside((v(1,j+1)+v(1,j))*0.5,(v(2,j+1)+v(2,j))*0.5,ob_v([i i+1],:))
                         ob_sub=[ob_sub,i];
                         flag2=1;
                         break;
                      end                  
                  end
               end
              if flag2==0
                  for j=1:size(ob_v,2)-1
                      for k=1:size(v,2)-1
                          x1=ob_v(i,j+1)-ob_v(i,j); y1=ob_v(i+1,j+1)-ob_v(i+1,j);
                          x2=v(1,k)-ob_v(i,j); y2=v(2,k)-ob_v(i+1,j);
                          x3=v(1,k+1)-ob_v(i,j); y3=v(2,k+1)-ob_v(i+1,j);
                          if  (x1*y2 - x2*y1)*(x1*y3 - x3*y1)<0
                               flag1=1;
                          end                      
                          x1=v(1,k+1)-v(1,k); y1=v(2,k+1)-v(2,k);
                          x2=ob_v(i,j)-v(1,k); y2=ob_v(i+1,j)-v(2,k);
                          x3=ob_v(i,j+1)-v(1,k); y3=ob_v(i+1,j+1)-v(2,k);
                          if  (x1*y2 - x2*y1)*(x1*y3 - x3*y1)<0  && flag1
                          ob_sub=[ob_sub,i];
                          flag2=1;
                          break;                          
                          end
                          flag1=0;
                      end
                      if flag2==1
                         flag2=0;
                         break;
                      end                      
                  end
              end                             
          end            
        end 
end