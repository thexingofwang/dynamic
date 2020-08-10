function FLag=isclose1(point,close)
FLag=0;
     for i=1:size(close,1)
           if distance([close(i,1),close(i,2)],point)<1.5   &&  point(5)~=close(i,5)  &&  point(6)~=close(i,6)       %0.6 0.15
              FLag=1; 
           end
     end
end
