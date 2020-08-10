function Flag=isconnet(point1,point2,ob)
   Flag=0;
   diffy=point2(2)-point1(2);    diffx=point2(1)-point1(1);
   for i=1:2:size(ob,1)-1
       if isinside((point1(1)+point2(1))*0.5,(point1(2)+point2(2))*0.5,ob([i i+1],:))
            Flag=1;
            return;             
       end 
       for j=1:size(ob,2)-1            
         diffobx=ob(i,j)-ob(i,j+1); diffoby=ob(i+1,j)-ob(i+1,j+1);
         if (diffx*diffoby-diffy*diffobx)==0  %%判断平行             
             continue;           
         end
         if diffx==0         %%判断是否垂直
             x=point2(1);    s_2=diffoby/diffobx;   y=(x-ob(i,j))*s_2+ob(i+1,j);         
         elseif diffobx==0
             x=ob(i,j);      s_1=diffy/diffx;       y=(x-point1(1))*s_1+point1(2);
         else
          s_1=diffy/diffx;
          s_2=diffoby/diffobx;
          x=(s_1*point1(1)-point1(2)-s_2*ob(i,j)+ob(i+1,j))/(s_1-s_2); %(s1-s2)x=s1*x1-y1-s2*xb1+yb1
          y=(x-point1(1))*s_1+point1(2);                   
         end
         x=roundn(x,-5);
         y=roundn(y,-5); 
         %%%%%%%%判断大小%%%%%%%%%%
         if point1(1)>=point2(1)
            xmax=point1(1);xmin=point2(1);
         else
            xmax=point2(1);xmin=point1(1);
         end
         if point1(2)>=point2(2)
            ymax=point1(2);ymin=point2(2);
         else
            ymax=point2(2);ymin=point1(2);
         end         
         if ob(i,j)>=ob(i,j+1)
            xbmax=ob(i,j);xbmin=ob(i,j+1);
         else
            xbmax=ob(i,j+1);xbmin=ob(i,j);
         end
         if ob(i+1,j)>=ob(i+1,j+1)
            ybmax=ob(i+1,j);ybmin=ob(i+1,j+1);
         else
            ybmax=ob(i+1,j+1);ybmin=ob(i+1,j);
         end               
        if (x==point1(1) && y==point1(2) ) ||   (x==point2(1) && y==point2(2) )  || (x==ob(i,j) && y==ob(i+1,j)) || (x==ob(i,j+1) && y==ob(i+1,j+1))
           continue; 
        end 
        if  x<=xmax &&  x>=xmin  &&  x<=xbmax  &&  x>=xbmin  &&  y<=ymax  && y>=ymin  && y<=ybmax && y>=ybmin 
             Flag=1;
             return;            
        end
      end
     end       
end

