function FLag=grow_continue(p0,p2,p3,p5)   
flag1=0;
        x1=p2(1)-p0(1); y1=p2(2)-p0(2);
        x2=p3(1)-p0(1); y2=p3(2)-p0(2);
        x3=p5(1)-p0(1); y3=p5(2)-p0(2);
        if  (x1*y2 - x2*y1)*(x1*y3 - x3*y1)>=0  && p2(1)<70  && p2(1)>-70  && p3(1)>-70 && p3(1)<70   %  约束条件后改
              flag1=1;     
        end       
        x1=p3(1)-p5(1); y1=p3(2)-p5(2);
        x2=p0(1)-p5(1); y2=p0(2)-p5(2);
        x3=p2(1)-p5(1); y3=p2(2)-p5(2);
        if  (x1*y2 - x2*y1)*(x1*y3 - x3*y1)>=0  && flag1==1 
              FLag=1;
        else
              FLag=0;              
        end        
             
end