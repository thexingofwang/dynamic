function path=AS(ob,start,goal)
open=[];
if  isconnet(start(:,1),goal,ob)==0
    path=[start(:,1),goal]
    return;
end
current=start(:,1);
close =[start(1,1),start(2,1), F_value(current,start(:,1),goal),start(1,1),start(2,1),0];
while isconnet(current,goal,ob)==1
    for i=1:2:size(ob,1)-1
           for j=1:size(ob,2)-1            
                if  isconnet(current,[ob(i,j);ob(i+1,j)],ob)==0  && isclose([ob(i,j);ob(i+1,j)],close)==0  %ÇóÐÂµã
                    [FLag,open]=isopen([ob(i,j);ob(i+1,j)],current,start(:,1),goal,open);
                    if FLag==0  
                       open1=[ob(i,j),ob(i+1,j),F_value([ob(i,j);ob(i+1,j)],start(:,1),goal),current(1),current(2),i];
                       open=[open;open1];                        
                    end 
                end
           end
    end
[F,num]=min(open(:,3));
close=[close;open(num,:)];
current=[open(num,1),open(num,2)];
open(num,:)=[];
end
path=findpath(close,goal);
path=R_L(path,ob);
path=direction(path)
angle=find_angle(path,ob)
op_an=op_angle(path);
bei_point(path,op_an,angle,ob);
end
