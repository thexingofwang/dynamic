function F=F_value(current,start,goal)
    F=sqrt((current(1)-start(1))^2+(current(2)-start(2))^2)+sqrt((current(1)-goal(1))^2+(current(2)-goal(2))^2);
end