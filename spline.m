
p0=[x(i),y(i)];p1=[current(1)+1*current(7),current(2)+1*current(8)];p2=[2*p1(1)-p0(1),2*p1(2)-p0(2)];
p5=[x,y];p4=[x-1*cos(veter1+i),y-1*sin(veter1+i)];p3=[2*p4(1)-p5(1),2*p4(2)-p5(2)];




% % ��ȡ��ֵ����
% a = load('data.txt');
% x = a(:,1)
% y = a(:,2)
% xx = linspace(210,min(x),100);
% yy = spline(x,y,xx);    %����������ֵ
% 
% 
% line(x,y);hold on
% 
% % �����ֵ���
% fileID = fopen('result.txt','w+');
% fprintf(fileID,'%4s %12s\r\n','xx','yy');
% fprintf(fileID,'%6.2f     %12.8f\n',xx,yy);
% fclose(fileID)
% 
% %��ͼ
% plot(x,y,'o',xx,yy,'-r')
% legend('true','cubicSpline')
% saveas(gcf,'out.jpg')