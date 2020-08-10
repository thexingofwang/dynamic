function simulate(start,p0,p1,p2,p3,p4,p5)

for t=0:0.01:1
x=(1-t)^5*p0(1)+5*t*(1-t)^4*p1(1)+10*t^2*(1-t)^3*p2(1)+10*t^3*(1-t)^2*p3(1)+5*t^4*(1-t)*p4(1)+t^5*p5(1);
y=(1-t)^5*p0(2)+5*t*(1-t)^4*p1(2)+10*t^2*(1-t)^3*p2(2)+10*t^3*(1-t)^2*p3(2)+5*t^4*(1-t)*p4(2)+t^5*p5(2);
diffx=x-start(1,1);  diffy=y-start(2,1);
start(1,1)=x;                  start(2,1)=y;
start(1,2)=start(1,2)+diffx;   start(2,2)=start(2,2)+diffy;    
start(1,3)=start(1,3)+diffx;   start(2,3)=start(2,3)+diffy;    
start(1,4)=start(1,4)+diffx;   start(2,4)=start(2,4)+diffy; 
fill(start(1,:),start(2,:),'g');
pause(0.001);
end
  axis([0,70,0,70]);

end
