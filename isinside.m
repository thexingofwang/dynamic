function FLag=isinside(x,y,v)
k=0;
FLag=0;
   for j=1:size(v,2)-1
       x1=v(1,j+1)-v(1,j); y1=v(2,j+1)-v(2,j);
       x2=x-v(1,j);      y2=y-v(2,j);
       if  x1*y2 - x2*y1>=0
           break;
       else
           k=k+1; 
       end
   end
if k==size(v,2)-1
    FLag=1;
end
end



% function FLag=isinside(x,y,v)
% k=0;
% FLag=0;
%    for j=1:size(v,2)-1
%        x1=v(1,j+1)-v(1,j); y1=v(2,j+1)-v(2,j);
%        x2=x-v(1,j);      y2=y-v(2,j);
%        if  x1*y2 - x2*y1>=0
%            break;
%        else
%            k=k+1; 
%        end
%    end
% if k==size(v,2)-1
%     FLag=1;
% end
% end


% function FLag=isinside(point1,point2,ob,i)
% x=(point1(1)+point2(1))*0.5;
% y=(point1(2)+point2(2))*0.5;
% k=0;
% FLag=0;
%    for j=1:size(ob,2)-1
%        x1=ob(i,j+1)-ob(i,j); y1=ob(i+1,j+1)-ob(i+1,j);
%        x2=x-ob(i,j+1);      y2=y-ob(i+1,j+1);
%        if  x1*y2 - x2*y1<0
%        k=k+1;      
%        end
%    end
% if k==size(ob,2)-1
%     FLag=1;
% end
% end