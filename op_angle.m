function op_an=op_angle(path)
    op_an=[];
            for i=1:size(path)-1
             diffx1=path(i+1,1)-path(i,1);diffy1=path(i+1,2)-path(i,2);
             diffx=diffx1/sqrt((diffx1)^2+(diffy1)^2);          diffy=diffy1/sqrt((diffx1)^2+(diffy1)^2);
             cos=path(i,5)*diffx+path(i,6)*diffy; sin=sqrt(1-cos^2);
             if diffx*path(i,6)-diffy*path(i,5)>=0
                a=[cos,sin;-sin,cos]*[cos,sin;-sin,cos]*[path(i,5);path(i,6)];
                op_an=[op_an;a(1),a(2)];
             else
                a=[cos,-sin;sin,cos]*[cos,-sin;sin,cos]*[path(i,5);path(i,6)];
                op_an=[op_an;a(1),a(2)];
             end
            end
    op_an=[0,0;op_an];    
end