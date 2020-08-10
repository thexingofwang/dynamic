function goal=map()
 for i=0:2:70
       line([0,70],[i,i]); 
       line([i,i],[0,70]);  
 end
 goal=[15;70];  plot(goal(1),goal(2),'d');
end