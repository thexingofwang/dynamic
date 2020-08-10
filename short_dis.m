function dis=short_dis(point)
    a=[15,21,30,30;5,15,50,60];
    dis=88888888;
  for i=1:size(a,2)-1
      A=a(2,i+1)-a(2,i)
      B=a(1,i)-a(1,i+1)
      C=a(1,i)*a(2,i+1)-a(2,i)*a(1,i+1)
      abc=abs(A*point(1)+B*point(2)+C)/sqrt(A*A+B*B)
      if abc<dis
          dis=abc;
      end      
      
  end
     
end