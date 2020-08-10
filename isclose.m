function FLag=isclose(point,close)
FLag=0;
     for i=1:size(close,1)
           if point(1)==close(i,1) && point(2)==close(i,2)
              FLag=1; 
           end
     end
end