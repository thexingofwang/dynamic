function  h=local_skip(x,y,diffx,diffy,diffx2,diffy2,path,i,ob)
        p0=[x,y];p1=[diffx*0.2+p0(1),diffy*0.2+p0(2)];p2=[diffx2*0.05-p0(1)+2*p1(1),diffy2*0.05-p0(2)+2*p1(2)];
        t=0;    %时间参数t
        s=0.1;  %控制点得步长
        h=0;    % 是否找到曲线 标志位
        ob_v=[];
        car_diameter=6;
       while t<=1           
        p4=[path(i,1)-s*path(i,5),path(i,2)-s*path(i,6)];p5=[path(i,1),path(i,2)];p3=[2*p4(1)-p5(1),2*p4(2)-p5(2)];
        diffx1=5*(p1(1)-p0(1))*(1-t)^4+20*(p2(1)-p1(1))*t*(1-t)^3+30*(p3(1)-p2(1))*t^2*(1-t)^2+20*(p4(1)-p3(1))*t^3*(1-t)+5*(p5(1)-p4(1))*t^4;
        diffy1=5*(p1(2)-p0(2))*(1-t)^4+20*(p2(2)-p1(2))*t*(1-t)^3+30*(p3(2)-p2(2))*t^2*(1-t)^2+20*(p4(2)-p3(2))*t^3*(1-t)+5*(p5(2)-p4(2))*t^4;        
        diffx2=20*(p2(1)-2*p1(1)+p0(1))*(1-t)^3+60*(p3(1)-2*p2(1)+p1(1))*t*(1-t)^2+60*(p4(1)-2*p3(1)+p2(1))*t^2*(1-t)+20*(p5(1)-2*p4(1)+p3(1))*t^3;
        diffy2=20*(p2(2)-2*p1(2)+p0(2))*(1-t)^3+60*(p3(2)-2*p2(2)+p1(2))*t*(1-t)^2+60*(p4(2)-2*p3(2)+p2(2))*t^2*(1-t)+20*(p5(2)-2*p4(2)+p3(2))*t^3;
        k=abs(diffx1*diffy2-diffy1*diffx2)/(sqrt(diffx1^2+diffy1^2))^3;        
        if t==0        
          diffx=diffx1/sqrt((diffx1)^2+(diffy1)^2);          diffy=diffy1/sqrt((diffx1)^2+(diffy1)^2);          
          v1=[0,1;-1,0]*[diffx;diffy];        
          point1(1)=p0(1)+0.1*v1(1);point1(2)=p0(2)+0.1*v1(2);
          if grow_continue(p0,p1,p3,p5)==0 || grow_continue(p0,point1,p3,p5)==0  || grow_continue(p0,p2,p3,p5)==0
             h=1;
             return;
          end
          xmax=max([p0(1) p1(1) p2(1) p3(1) p4(1) p5(1)])+car_diameter;
          xmin=min([p0(1) p1(1) p2(1) p3(1) p4(1) p5(1)])-car_diameter;
          ymax=max([p0(2) p1(2) p2(2) p3(2) p4(2) p5(2)])+car_diameter;
          ymin=min([p0(2) p1(2) p2(2) p3(2) p4(2) p5(2)])-car_diameter;
          v=[xmin,xmax,xmax,xmin,xmin;ymax,ymax,ymin,ymin,ymax];
          ob_sub=find_ob(v,ob);
          if size(ob_sub)>0
               for j=1:size(ob_sub,2)
                   ob_v=[ob_v;ob([ob_sub(j) ob_sub(j)+1],:)];
               end               
          end
        end
        if size(ob_sub)>0                     
           s_ob=car_ob(p0,p1,p2,p3,p4,p5,t,ob_v);
        end 
        t=t+0.1;         
        if  k>0.4 ||  s_ob>0 
            s=s+0.1;
            t=0;
            ob_v=[];
            s_ob=0;
        end       
       end       
       if h==0 
           Plotbe(p0,p1,p2,p3,p4,p5,1);        
       end        
end
 %            i
%            p0
%            p1
%            p2
%            p3
%            p4
%            p5