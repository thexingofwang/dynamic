function path=E(field,goal,ob,map_point)
start=[15;5];s_orient=[0,1];v=0.5;diffs=5;
% open=[start(1,1),start(2,1), distance(start,goal),0,start(1,1),start(2,1),s_orient];
open=[];
current=[];
current=[start(1,1),start(2,1),distance(start,goal),0,start(1,1),start(2,1),s_orient];
% current=[22.4662,37.0302, distance(start,goal),0,start(1,1),start(2,1),0.1079,0.9942,0,0]
%open变量每一行  [节点坐标，代价值F=G+H,代价值G,父节点坐标,航向]
close =[start(1,1),start(2,1), F_value([current(1),current(2)],start,goal),0,start(1,1),start(2,1),s_orient];
l=3
while     distance(([current(1),current(2)]),goal)>5  %l>0  isconnet([current(1),current(2)],goal,ob)==1  &&
    if  isconnet([current(1),current(2)],goal,ob)==0
        flag=goal_oritation(goal,current,ob);
        if flag(1,1)==1
            break;
        else
            veter=flag(1,2:3);
        end
    end
    veter=find_field([current(1),current(2)],field,map_point);
    if size(veter,1)>0   
          if      veter(1)<0 && veter(2)>0   
          veter1=atan(veter(2)/veter(1))+pi;      
          elseif  veter(1)<0 && veter(2)<0          
          veter1=atan(veter(2)/veter(1))-pi;
          else
          veter1=atan(veter(2)/veter(1));
          end
          
          if      current(7)<0 && current(8)>0   
          veter2=atan(current(8)/current(7))+pi;      
          elseif  current(7)<0 && current(8)<0          
          veter2=atan(current(8)/current(7))-pi;
          else
          veter2=atan(current(8)/current(7));  
          end       
          delta_vet=veter1-veter2;
          for i=-0.6:0.1:0.6  %0.3  0.6
              if delta_vet+i==0
                  x=current(1)+5*current(7);
                  y=current(2)+5*current(8);
              else
                 delta_v_mid=delta_vet+i;
                 rota_angle=[cos(delta_v_mid/2),-sin(delta_v_mid/2);sin(delta_v_mid/2),cos(delta_v_mid/2)]*[current(7);current(8)];
                 k=0;
                 diff_s=2*diffs/(delta_v_mid)*sin(delta_v_mid/2)+k;
                 x=current(1)+rota_angle(1)*diff_s;
                 y=current(2)+rota_angle(2)*diff_s;
                 k=0;
                 a=[21,21,20,12.5,12.5,;15,25,40,50,60];
                 
%                  bb=2356565;
%                  for j=1:size(a,2)
%                      if distance([x,y],a(:,j))<bb
%                          bb=distance([x,y],a(:,j));
%                      end
%                  end                      
              end        
             
              value=find_field([x,y],field,map_point);
              p0=[current(1),current(2)];p1=[current(1)+1*current(7),current(2)+1*current(8)];p2=[2*p1(1)-p0(1),2*p1(2)-p0(2)];
              p5=[x,y];p4=[x-1*cos(veter1+i),y-1*sin(veter1+i)];p3=[2*p4(1)-p5(1),2*p4(2)-p5(2)];
              aa=detect(p0,p1,p2,p3,p4,p5,ob);
              if size(value,2)>0   &&  aa==0               
              value1=cos(veter1+i)*value(1)+sin(veter1+i)*value(2); 
              for j=1:size(map_point,1)
                  if map_point(j,1)==value(3)  && map_point(j,2)==value(4)
                      bb=map_point(j,5);
                  end
              end             
              open1=[x,y,(distance([x,y],[value(3),value(4)])+bb+current(4)),current(4)+diff_s,current(1),current(2),cos(veter1+i),sin(veter1+i)];
              if  isclose1(open1,close)==0  && isopen1(open1,open)==0
                     open=[open;open1];
%                      Plotbe(p0,p1,p2,p3,p4,p5,1);
%                      pause(0.000001);
              end
              end
          end
    end
[F,num]=min(open(:,3));
close=[close;open(num,:)];
current=[open(num,:)];
open(num,:)=[];
% l=l-1;
end
path=find_epath(close,goal)
for i=1:size(path,1)-1
    p0=[path(i,1),path(i,2)];p1=[path(i,1)+1*path(i,3),path(i,2)+1*path(i,4)];p2=[2*p1(1)-p0(1),2*p1(2)-p0(2)];
    p5=[path(i+1,1),path(i+1,2)];p4=[path(i+1,1)-1*path(i+1,3),path(i+1,2)-1*path(i+1,4)];p3=[2*p4(1)-p5(1),2*p4(2)-p5(2)];
    Plotbe(p0,p1,p2,p3,p4,p5,1);
end
end



% x=current(1)+diffs*(sin(veter1)-sin(veter2))/delta_vet;
%       y=current(2)+diffs*(sin(veter1)-sin(veter2))/delta_vet; 
%       open1=[x,y,F_value([x,y],[current(1),current(2)],goal)+current(4),current(4)+distance([x,y],[current(1),current(2)]),current(1),current(2),cos(deg2rad(veter1)),sin(deg2rad(veter1))];
%       open=[open;open1];
%       delta_vet=delta_vet+5;
%       x=current(1)+diffs*(sin(veter1+5)-sin(veter2))/delta_vet;
%       y=current(2)+diffs*(sin(veter1+5)-sin(veter2))/delta_vet;
%       open1=[x,y,F_value([x,y],[current(1),current(2)],goal)+current(4),current(4)+distance([x,y],[current(1),current(2)]),current(1),current(2),cos(deg2rad(veter1+5)),sin(deg2rad(veter1+5))];
%       open=[open;open1];
%       delta_vet=(veter1-veter2)-5;distance([x,y],goal)+
%       x=current(1)+diffs*(sin(veter1-5)-sin(veter2))/delta_vet;
%       y=current(2)+diffs*(sin(veter1-5)-sin(veter2))/delta_vet;
%       open1=[x,y,F_value([x,y],[current(1),current(2)],goal)+current(4),current(4)+distance([x,y],[current(1),current(2)]),current(1),current(2),cos(deg2rad(veter1-5)),sin(deg2rad(veter1-5))];
%       open=[open;open1];
%       isclose1([ob(i,j);ob(i+1,j)],close)==0
% rad2deg
% atan
%    x=current(1)+diffs*(sin(veter1+i)-sin(veter2))/(delta_vet+i);
%    y=current(2)-diffs*(cos(veter1+i)-cos(veter2))/(delta_vet+i);