function Flag=goal_oritation(goal,current,ob)
     goal_d=[0,1];
     diffs=1;
     flag=0;
     while  flag==0     
         p0=[current(1),current(2)];p1=[current(1)+diffs*current(7),current(2)+diffs*current(8)];p2=[2*p1(1)-p0(1),2*p1(2)-p0(2)];
         p5=[goal(1),goal(2)];p4=[goal(1)-diffs*goal_d(1),goal(2)-diffs*goal_d(2)];p3=[2*p4(1)-p5(1),2*p4(2)-p5(2)];
         aa=detect(p0,p1,p2,p3,p4,p5,ob);
         if aa==0
             Flag=[1,0,0]; %%%%%找到路径            
             Plotbe(p0,p1,p2,p3,p4,p5,1);
             return;
         else
             diffs=diffs+1;
             p0=[current(1),current(2)];p1=[current(1)+diffs*current(7),current(2)+diffs*current(8)];p2=[2*p1(1)-p0(1),2*p1(2)-p0(2)];
             p5=[goal(1),goal(2)];p4=[goal(1)-diffs*goal_d(1),goal(2)-diffs*goal_d(2)];p3=[2*p4(1)-p5(1),2*p4(2)-p5(2)];
             veter=[0,1;-1,0]*[goal(1);goal(2)];
             point1(1)=p5(1)+0.1*veter(1);point1(2)=p5(2)+0.1*veter(2);
             veter=[0,1;-1,0]*[current(7);current(8)];
             point2(1)=p0(1)+0.1*veter(1);point2(2)=p0(2)+0.1*veter(2); 
             if grow_continue(p0,p2,point1,p5)==0 || grow_continue(p0,p2,p3,p5)==0 || grow_continue(p0,point2,p3,p5)==0
                 p1(1)=current(1)+2*current(7);  p1(2)=current(2)+2*current(8);
                 p2(1)=goal(1)-2*goal_d(1);   p2(2)=goal(2)-2*goal_d(2); 
                 t=0.2;
                 diffx1=3*(p1(1)-current(1))*(1-t)^2-6*p1(1)*(1-t)*t+6*p2(1)*t-9*p2(1)*t^2+3*goal(1)*t^2;
                 diffy1=3*(p1(2)-current(2))*(1-t)^2-6*p1(2)*(1-t)*t+6*p2(2)*t-9*p2(2)*t^2+3*goal(2)*t^2;
                 diffx=diffx1/sqrt((diffx1)^2+(diffy1)^2);          diffy=diffy1/sqrt((diffx1)^2+(diffy1)^2);     
                 Flag=[0,diffx,diffy];    %%%%%%%%未找到路径               
                 return;                 
             end             
         end        
     end

end
% else
%              point1(1)=p5(1)+0.1*path(i+1,7);point1(2)=p5(2)+0.1*path(i+1,8);
%              point2(1)=p0(1)+0.1*path(i,7);point2(2)=p0(2)+0.1*path(i,8);
% if aa==0  
%             Flag=1; 
%          
%          end
%          if grow_continue(p0,p2,point1,p5)==0 || grow_continue(p0,p2,p3,p5)==0 || grow_continue(p0,point2,p3,p5)==0
%          end