clear;
clc;
tic
ob=zeros(8,5);
ob(1,1)=10;ob(2,1)=40;ob(1,2)=20;ob(2,2)=40;ob(1,3)=20;ob(2,3)=30;ob(1,4)=10;ob(2,4)=30;ob(1,5)=10;ob(2,5)=40;fill(ob(1,:),ob(2,:),'K');%hold on  
ob(3,1)=5;ob(4,1)=25;ob(3,2)=21;ob(4,2)=25;ob(3,3)=21;ob(4,3)=15;ob(3,4)=5;ob(4,4)=15;ob(3,5)=5;ob(4,5)=25;fill(ob(3,:),ob(4,:),'K');hold on 
ob(5,1)=12.5;ob(6,1)=60;ob(5,2)=30;ob(6,2)=60;ob(5,3)=30;ob(6,3)=50;ob(5,4)=12.5;ob(6,4)=50;ob(5,5)=12.5;ob(6,5)=60;fill(ob(5,:),ob(6,:),'K');hold on 
ob(7,1)=20;ob(8,1)=9;ob(7,2)=22;ob(8,2)=9;ob(7,3)=22;ob(8,3)=5;ob(7,4)=20;ob(8,4)=5;ob(7,5)=20;ob(8,5)=9;fill(ob(7,:),ob(8,:),'K');hold on
start=zeros(2,4);
start(1,1)=15;start(2,1)=5;start(1,2)=17.5;start(2,2)=5;start(1,3)=17.5;start(2,3)=0;start(1,4)=15;start(2,4)=0; fill(start(1,:),start(2,:),'b');
goal=map();
map_point=drivable(ob,goal);
field=field_path(ob,map_point);
toc
path=E(field,goal,ob,map_point);

tic
ob=zeros(8,5);
% ob(1,1)=10;ob(2,1)=40;ob(1,2)=20;ob(2,2)=40;ob(1,3)=20;ob(2,3)=30;ob(1,4)=10;ob(2,4)=30;ob(1,5)=10;ob(2,5)=40;fill(ob(1,:),ob(2,:),'K');hold on  
ob(3,1)=5;ob(4,1)=25;ob(3,2)=21;ob(4,2)=25;ob(3,3)=21;ob(4,3)=15;ob(3,4)=5;ob(4,4)=15;ob(3,5)=5;ob(4,5)=25;fill(ob(3,:),ob(4,:),'K');hold on 
ob(5,1)=12.5;ob(6,1)=60;ob(5,2)=30;ob(6,2)=60;ob(5,3)=30;ob(6,3)=50;ob(5,4)=12.5;ob(6,4)=50;ob(5,5)=12.5;ob(6,5)=60;fill(ob(5,:),ob(6,:),'K');hold on 
ob(7,1)=20;ob(8,1)=9;ob(7,2)=22;ob(8,2)=9;ob(7,3)=22;ob(8,3)=5;ob(7,4)=20;ob(8,4)=5;ob(7,5)=20;ob(8,5)=9;fill(ob(7,:),ob(8,:),'K');hold on
map_change=map_point;
change_ob=zeros(2,5);
change_ob(1,1)=10;change_ob(2,1)=40;change_ob(1,2)=20;change_ob(2,2)=40;change_ob(1,3)=20;change_ob(2,3)=30;change_ob(1,4)=10;change_ob(2,4)=30;change_ob(1,5)=10;change_ob(2,5)=40;  
% change_ob(1,1)=20;change_ob(2,1)=9;change_ob(1,2)=22;change_ob(2,2)=9;change_ob(1,3)=22;change_ob(2,3)=5;change_ob(1,4)=20;change_ob(2,4)=5;change_ob(1,5)=20;change_ob(2,5)=9;
for i=1:size(change_ob,2)-1
    x=change_ob(1,i); y=change_ob(2,i);
    for j=1:size(map_change,1)
      if map_change(j,1)==x  &&  map_change(j,2)==y
           map_change(j,:)=[];
           break;
      end
    end  
end

parent=[];
for  i=1:size(change_ob,2)-1
    x=change_ob(1,i); y=change_ob(2,i);
    parent=[parent;[x,y,0]];
end
map_change=update_map(map_change,ob,parent);
% for i=1:size(map_change,1)
%      line([map_change(i,1),map_change(i,3)],[map_change(i,2),map_change(i,4)]);hold on
% end

ob=zeros(8,5);
ob(1,1)=10;ob(2,1)=40;ob(1,2)=20;ob(2,2)=40;ob(1,3)=20;ob(2,3)=30;ob(1,4)=10;ob(2,4)=30;ob(1,5)=10;ob(2,5)=40;fill(ob(1,:),ob(2,:),'K');%hold on  
ob(3,1)=5;ob(4,1)=25;ob(3,2)=21;ob(4,2)=25;ob(3,3)=21;ob(4,3)=15;ob(3,4)=5;ob(4,4)=15;ob(3,5)=5;ob(4,5)=25;fill(ob(3,:),ob(4,:),'K');hold on 
ob(5,1)=12.5;ob(6,1)=60;ob(5,2)=30;ob(6,2)=60;ob(5,3)=30;ob(6,3)=50;ob(5,4)=12.5;ob(6,4)=50;ob(5,5)=12.5;ob(6,5)=60;fill(ob(5,:),ob(6,:),'K');hold on 
ob(7,1)=20;ob(8,1)=9;ob(7,2)=22;ob(8,2)=9;ob(7,3)=22;ob(8,3)=5;ob(7,4)=20;ob(8,4)=5;ob(7,5)=20;ob(8,5)=9;fill(ob(7,:),ob(8,:),'K');hold on
add=zeros(2,5);
add(1,1)=10;add(2,1)=30;add(1,2)=10;add(2,2)=40;add(1,3)=20;add(2,3)=30;add(1,4)=20;add(2,4)=40;add(1,5)=10;add(2,5)=40;
map_change=add_ob(map_change,add,ob);
for i=1:size(map_change,1)
     line([map_change(i,1),map_change(i,3)],[map_change(i,2),map_change(i,4)]);hold on
end


toc

% gtext('目标节点','FontSize',20);
% plot(15,20,'d'); hold on
% plot(15,70,'d'); hold on
% line([15,12.5],[70,60]); 
% line([15,30],[70,60]); 
% line([10,12.5],[40,60])
% line([10,12.5],[40,60]); 
% line([20,12.5],[40,50]); 
% line([20,30],[40,50]); 
% line([5,12.5],[25,60]); 
% line([5,10],[25,30]); 
% line([5,20],[25,30]); 
% line([21,30],[25,50]); 
% line([21,20],[25,40]); 
% line([30,20],[50,30]); 
% line([5,20],[15,9]); 
% line([21,20],[15,9]);
% line([30,20],[50,9]); 
% line([21,20],[25,30]); 
% line([21,10],[25,30]); 
% line([10,30],[40,50]); 
% line([10,12.5],[40,50]); 

% map_point=ob;
% map_point(:,end)=[];
% map_mid=[];
% for i=1:2:size(map_point,1)-1  %重新排序
%     map_mid=[map_mid,map_point(i:i+1,:)];
% end
% map_mid
% for i=1:size(map_mid,2)-1
%     for j=i+1:size(map_mid,2)
%         if isconnet(map_mid(1:2,i),map_mid(1:2,j),ob)==0
%             line([map_mid(1,i),map_mid(1,j)],[map_mid(2,i),map_mid(2,j)]);
%         end
%     end
% end



% short_dis([1,1])





% a=find_field(point,field,map_point)












% field=[];
% for j=2:2:70
%     for i=2:2:70
%         v=[i-2,i,i,i-2,i;j,j,j-2,j-2,j];
%         ob_sub=find_ob(v,ob);
%         if size(ob_sub)==0
%            best_d=888888;
%            point=[i-1,j-1];
%            value=[];
%            for k=1:size(map_point,1)
%                if  distance(point,map_point(k,1:2))+map_point(k,5)<best_d && isconnet(point,map_point(k,1:2),ob)==0    
%                    best_d=distance(point,map_point(k,1:2))+map_point(k,5);
%                    value=map_point(k,1:2);                   
%                end
%            end
%            if size(value,1)>0
%                line([point(1),value(1)],[point(2),value(2)]);hold on
%                diffx1=value(1)-point(1);           diffy1=value(2)-point(2);          
%                diffx=diffx1/sqrt((diffx1)^2+(diffy1)^2);          diffy=diffy1/sqrt((diffx1)^2+(diffy1)^2); 
%                b=[i;j;diffx;diffy];
%                field=[field,b];
%                value=[]; 
%            end
%         end
%     end
% end
% for i=1:size(map_point,1)
%      line([map_point(i,1),map_point(i,3)],[map_point(i,2),map_point(i,4)]);hold on
% end







% map_point=ob;
% map_point(:,end)=[];
% map_mid=[];
% for i=1:2:size(map_point,1)-1
%     map_mid=[map_mid,map_point(i:i+1,:)];
% end
% map_point=[goal(1),goal(2),goal(1),goal(2),0];
% nice=[];
% n=1;
% m=1;
% while size(map_mid,2)>0
%         for i=1:size(map_mid,2)       
%                best_d=8888888;
%                best_point=[];
%                    for j=n:m
%                          if  isconnet(map_mid(1:2,i),map_point(j,1:2),ob)==0  &&  distance(map_mid(1:2,i),map_point(j,1:2))+map_point(j,5)<best_d
%                                 best_d=distance(map_mid(1:2,i),map_point(j,1:2))+map_point(j,5);
%                                 best_point=[map_point(j,1:2)];                    
%                         end                
%                    end
%                    if size(best_point,1)>0
%                           map_point=[map_point;map_mid(1,i),map_mid(2,i),best_point(1),best_point(2),best_d];
%                           best_point=[];
%                           map_mid(:,i)=[1,1];
%                    end               
%         end  
%     for j=1:size(map_mid,2)
%         if map_mid(1,j)~=1 && map_mid(2,j)~=1
%             nice=[nice,map_mid(:,j)];
%         end
%     end
%     map_mid=nice;
%     nice=[];   
%     n=m+1;
%     m=size(map_point,1);    
%     for j=n+1:m
%         if map_point(j,5)<map_point(n,5)
%            nice=map_point(j,:);
%            map_point(j,:)=map_point(n,:);
%            map_point(n,:)=nice;
%            nice=[];
%         end       
%     end
%     
%     for j=n:m-1
%         best_d=8888888;
%         for  k=n+1:m
%             if  distance(map_point(k,1:2),map_point(j,1:2))+map_point(j,5)<map_point(k,5) && isconnet(map_point(k,1:2),map_point(j,1:2),ob)==0    
%                   value=distance(map_point(k,1:2),map_point(j,1:2))+map_point(j,5);              
%                   map_point(k,3)=map_point(j,1);map_point(k,4)=map_point(j,2);
%                   map_point(k,5)=value;                  
%                   if map_point(k,5)<best_d              
%                       nice=map_point(k,:);
%                       map_point(k,:)=map_point(j+1,:);
%                       map_point(j+1,:)=nice;
%                       nice=[];
%                       best_d=value;
%                   end
%             end
%         end
%     end        
% end


