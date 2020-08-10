function s_ob=car_ob(p0,p1,p2,p3,p4,p5,t,ob_v)
           x=(1-t)^5*p0(1)+5*t*(1-t)^4*p1(1)+10*t^2*(1-t)^3*p2(1)+10*t^3*(1-t)^2*p3(1)+5*t^4*(1-t)*p4(1)+t^5*p5(1);
           y=(1-t)^5*p0(2)+5*t*(1-t)^4*p1(2)+10*t^2*(1-t)^3*p2(2)+10*t^3*(1-t)^2*p3(2)+5*t^4*(1-t)*p4(2)+t^5*p5(2);
           diffx1=5*(p1(1)-p0(1))*(1-t)^4+20*(p2(1)-p1(1))*t*(1-t)^3+30*(p3(1)-p2(1))*t^2*(1-t)^2+20*(p4(1)-p3(1))*t^3*(1-t)+5*(p5(1)-p4(1))*t^4;
           diffy1=5*(p1(2)-p0(2))*(1-t)^4+20*(p2(2)-p1(2))*t*(1-t)^3+30*(p3(2)-p2(2))*t^2*(1-t)^2+20*(p4(2)-p3(2))*t^3*(1-t)+5*(p5(2)-p4(2))*t^4;
           diffx=diffx1/sqrt((diffx1)^2+(diffy1)^2);          diffy=diffy1/sqrt((diffx1)^2+(diffy1)^2); 
           v1=[0,1;-1,0]*[diffx;diffy];       
           x1=x+2.5*v1(1);
           y1=y+2.5*v1(2);
           x2=x1-5*diffx;
           y2=y1-5*diffy;
           x3=x-5*diffx;
           y3=y-5*diffy;
           v=[x,x1,x2,x3,x;y,y1,y2,y3,y];
           v=roundn(v,-5);
           s_ob=size(find_ob(v,ob_v),2);
end