function test()
     p0=[0,0];p1=[2.5,0];p2=[2.5,5];p3=[5,5];%p4=[7.5,10];p5=[10,10];
     
     for t=0:0.01:1
         x=(1-t)^3*p0(1)+3*t^1*(1-t)^2*p1(1)+3*t^2*(1-t)^1*p2(1)+t^3*p3(1);
         y=(1-t)^3*p0(2)+3*t^1*(1-t)^2*p1(2)+3*t^2*(1-t)^1*p2(2)+t^3*p3(2);
%          x=(1-t)^5*p0(1)+5*t*(1-t)^4*p1(1)+10*t^2*(1-t)^3*p2(1)+10*t^3*(1-t)^2*p3(1)+5*t^4*(1-t)*p4(1)+t^5*p5(1);
%          y=(1-t)^5*p0(2)+5*t*(1-t)^4*p1(2)+10*t^2*(1-t)^3*p2(2)+10*t^3*(1-t)^2*p3(2)+5*t^4*(1-t)*p4(2)+t^5*p5(2);            
         plot(x,y,'.');hold on 
     end     
     
         plot(p0(1),p0(2),'*','MarkerSize',10);hold on ; 
         gtext('p0');
         plot(p1(1),p1(2),'*','MarkerSize',10);hold on ; 
         gtext('p1');
         plot(p2(1),p2(2),'*','MarkerSize',10);hold on ; 
         gtext('p2');
         plot(p3(1),p3(2),'*','MarkerSize',10);hold on ; 
         gtext('p3');
%          plot(p4(1),p4(2),'*','MarkerSize',10);hold on ; 
%          gtext('p4');
%          plot(p5(1),p5(2),'*','MarkerSize',10);hold on ;
%          gtext('p5');
         line([p0(1),p5(1)],[p0(2),p5(2)]) 
         
         
%       p0=[10,10];p1=[12.5,10];p2=[15,10];p3=[20,5];p4=[20,2.5];p5=[20,0];
% 
%    for t=0:0.01:1
%          x=(1-t)^5*p0(1)+5*t*(1-t)^4*p1(1)+10*t^2*(1-t)^3*p2(1)+10*t^3*(1-t)^2*p3(1)+5*t^4*(1-t)*p4(1)+t^5*p5(1);
%          y=(1-t)^5*p0(2)+5*t*(1-t)^4*p1(2)+10*t^2*(1-t)^3*p2(2)+10*t^3*(1-t)^2*p3(2)+5*t^4*(1-t)*p4(2)+t^5*p5(2);            
%          plot(x,y,'.');hold on 
%    end    
%       plot(p0(1),p0(2),'*','MarkerSize',10);hold on ; 
%          gtext('2.p0');
%          plot(p1(1),p1(2),'*','MarkerSize',10);hold on ; 
%          gtext('2.p1');
%          plot(p2(1),p2(2),'*','MarkerSize',10);hold on ; 
%          gtext('2.p2');
%          plot(p3(1),p3(2),'*','MarkerSize',10);hold on ; 
%          gtext('2.p3');
%          plot(p4(1),p4(2),'*','MarkerSize',10);hold on ; 
%          gtext('2.p4');
%          plot(p5(1),p5(2),'*','MarkerSize',10);hold on ;
%          gtext('2.p5');
%          line([p0(1),p5(1)],[p0(2),p5(2)]) 







%          figure(2)
%               for t=0:0.01:1
% 
%          diffx1= 5*(p1(1)-p0(1))*(1-t)^4+20*(p2(1)-p1(1))*t*(1-t)^3+30*(p3(1)-p2(1))*t^2*(1-t)^2+20*(p4(1)-p3(1))*t^3*(1-t)+5*(p5(1)-p4(1))*t^4;
%             diffy1= 5*(p1(2)-p0(2))*(1-t)^4+20*(p2(2)-p1(2))*t*(1-t)^3+30*(p3(2)-p2(2))*t^2*(1-t)^2+20*(p4(2)-p3(2))*t^3*(1-t)+5*(p5(2)-p4(2))*t^4;        
%             diffx2= 20*(p2(1)-2*p1(1)+p0(1))*(1-t)^3+60*(p3(1)-2*p2(1)+p1(1))*t*(1-t)^2+60*(p4(1)-2*p3(1)+p2(1))*t^2*(1-t)+20*(p5(1)-2*p4(1)+p3(1))*t^3;
%             diffy2= 20*(p2(2)-2*p1(2)+p0(2))*(1-t)^3+60*(p3(2)-2*p2(2)+p1(2))*t*(1-t)^2+60*(p4(2)-2*p3(2)+p2(2))*t^2*(1-t)+20*(p5(2)-2*p4(2)+p3(2))*t^3;
%              k=abs(diffx1*diffy2-diffy1*diffx2)/(sqrt(diffx1^2+diffy1^2))^3;
%                       plot(t,k,'.');hold on 
% 
%              
%               end
     

end
% tic
% clc
% clear
% close all
% fun=@(x) -(sin(x)+x*cos(x));
% x0=2;
% A=[];
% b=[];
% Aeq=[];
% beq=[];
% vlb=[-10];
% vub=[10];
% exitflag=1;
% % options=optimset('Algorithm','sqp','TolFun',1e-16);
% [x,fval,exitflag]=fmincon(fun,x0,A,b,Aeq,beq,vlb,vub,'mycon')
% 
%       for x=-10:0.01:10
%           f=-(sin(x)+x*cos(x));
%           plot(x,f,'.');hold on
%       end
% toc




% tic
% kmax=0;
%   for s=0:0.001:5
%       for t=0:0.01:1
%         p0=[0,0];p1=[p0(1)+s*0,p0(2)+s*1];p2=[2*p1(1)-p0(1),2*p1(2)-p0(2)];
%         p5=[10,10];p4=[p5(1)-s*1,p5(2)-s*0];p3=[2*p4(1)-p5(1),2*p4(2)-p5(2)]; 
%         
%         diffx1=5*(p1(1)-p0(1))*(1-t)^4+20*(p2(1)-p1(1))*t*(1-t)^3+30*(p3(1)-p2(1))*t^2*(1-t)^2+20*(p4(1)-p3(1))*t^3*(1-t)+5*(p5(1)-p4(1))*t^4;
%         diffy1=5*(p1(2)-p0(2))*(1-t)^4+20*(p2(2)-p1(2))*t*(1-t)^3+30*(p3(2)-p2(2))*t^2*(1-t)^2+20*(p4(2)-p3(2))*t^3*(1-t)+5*(p5(2)-p4(2))*t^4;        
%         diffx2=20*(p2(1)-2*p1(1)+p0(1))*(1-t)^3+60*(p3(1)-2*p2(1)+p1(1))*t*(1-t)^2+60*(p4(1)-2*p3(1)+p2(1))*t^2*(1-t)+20*(p5(1)-2*p4(1)+p3(1))*t^3;
%         diffy2=20*(p2(2)-2*p1(2)+p0(2))*(1-t)^3+60*(p3(2)-2*p2(2)+p1(2))*t*(1-t)^2+60*(p4(2)-2*p3(2)+p2(2))*t^2*(1-t)+20*(p5(2)-2*p4(2)+p3(2))*t^3;
%         k=abs(diffx1*diffy2-diffy1*diffx2)/(sqrt(diffx1^2+diffy1^2))^3;
%         if k>kmax
%             kmax=k
%         end
%       end
%       plot(s,kmax,'.');hold on
%       kamx=0;
%   end
%   toc





% clc;clear;close all;
% tic
% %% ��ʼ����Ⱥ
% f= @(x) -(sin(x)+x.*cos(x)); % �������ʽ
% % figure(1);ezplot(f,[-10,0.01,10]);
% N = 2;                         % ��ʼ��Ⱥ����
% d = 1;                          % �ռ�ά��
% ger = 100;                      % ����������     
% limit = [0, 1];                % ����λ�ò�������
% vlimit = [-1, 1];               % �����ٶ�����
% w = 0.8;                        % ����Ȩ��
% c1 = 0.5;                       % ����ѧϰ����
% c2 = 0.5;                       % Ⱥ��ѧϰ���� 
% for i = 1:d
%     x = limit(i, 1) + (limit(i, 2) - limit(i, 1)) * rand(N, d);%��ʼ��Ⱥ��λ��
% end
% v = rand(N, d);                  % ��ʼ��Ⱥ���ٶ�
% xm = x;                          % ÿ���������ʷ���λ��
% ym = zeros(1, d);                % ��Ⱥ����ʷ���λ��
% fxm = zeros(N, 1);               % ÿ���������ʷ�����Ӧ��
% fym = -inf;                      % ��Ⱥ��ʷ�����Ӧ��
% % hold on
% % plot(xm, f(xm), 'ro');title('��ʼ״̬ͼ');
% figure(2)
% %% Ⱥ�����
% iter = 1;
% record = zeros(ger, 1);          % ��¼��
% while iter <= ger
%      fx = f(x) ; % ���嵱ǰ��Ӧ��   
%      for i = 1:N      
%         if fxm(i) < fx(i)
%             fxm(i) = fx(i);     % ���¸�����ʷ�����Ӧ��
%             xm(i,:) = x(i,:);   % ���¸�����ʷ���λ��
%         end 
%      end
% if fym < max(fxm)
%         [fym, nmax] = max(fxm);   % ����Ⱥ����ʷ�����Ӧ��
%         ym = xm(nmax, :);      % ����Ⱥ����ʷ���λ��
%  end
%     v = v * w + c1 * rand * (xm - x) + c2 * rand * (repmat(ym, N, 1) - x);% �ٶȸ���
%     % �߽��ٶȴ���
%     v(v > vlimit(2)) = vlimit(2);
%     v(v < vlimit(1)) = vlimit(1);
%     x = x + v;% λ�ø���
%     % �߽�λ�ô���
%     x(x > limit(2)) = limit(2);
%     x(x < limit(1)) = limit(1);
%     record(iter) = fym;%���ֵ��¼
% %     x0 = 0 : 0.01 : 20;
% %     plot(x0, f(x0), 'b-', x, f(x), 'ro');title('״̬λ�ñ仯')
% %     pause(0.1)
%     iter = iter+1;
% end
% % figure(3);plot(record);title('��������')
% % x0 = 0 : 0.01 : 20;
% % figure(4);plot(x0, f(x0), 'b-', x, f(x), 'ro');title('����״̬λ��')
% disp(['���ֵ��',num2str(fym)]);
% disp(['����ȡֵ��',num2str(ym)]);
% 
%  toc      
% end



%    p0=[0,0];p1=[0,2];p2=[0,5];p3=[0,10];p4=[2.5,10];p5=[10,10];       
%          k1=0;
%          syms t
%         diffx1=@(t) 5*(p1(1)-p0(1))*(1-t)^4+20*(p2(1)-p1(1))*t*(1-t)^3+30*(p3(1)-p2(1))*t^2*(1-t)^2+20*(p4(1)-p3(1))*t^3*(1-t)+5*(p5(1)-p4(1))*t^4;
%         diffy1=@(t) 5*(p1(2)-p0(2))*(1-t)^4+20*(p2(2)-p1(2))*t*(1-t)^3+30*(p3(2)-p2(2))*t^2*(1-t)^2+20*(p4(2)-p3(2))*t^3*(1-t)+5*(p5(2)-p4(2))*t^4;        
%         diffx2=@(t) 20*(p2(1)-2*p1(1)+p0(1))*(1-t)^3+60*(p3(1)-2*p2(1)+p1(1))*t*(1-t)^2+60*(p4(1)-2*p3(1)+p2(1))*t^2*(1-t)+20*(p5(1)-2*p4(1)+p3(1))*t^3;
%         diffy2=@(t) 20*(p2(2)-2*p1(2)+p0(2))*(1-t)^3+60*(p3(2)-2*p2(2)+p1(2))*t*(1-t)^2+60*(p4(2)-2*p3(2)+p2(2))*t^2*(1-t)+20*(p5(2)-2*p4(2)+p3(2))*t^3;
%         [xmax]=fminbnd(inline(-(abs(diffx1(t)*diffy2(t)-diffy1(t)*diffx2(t))/(sqrt((diffx1(t))^2+(diffy1(t))^2))^3)),0,1)
%         for t=0:0.01:1
%              diffx1= 5*(p1(1)-p0(1))*(1-t)^4+20*(p2(1)-p1(1))*t*(1-t)^3+30*(p3(1)-p2(1))*t^2*(1-t)^2+20*(p4(1)-p3(1))*t^3*(1-t)+5*(p5(1)-p4(1))*t^4;
%             diffy1= 5*(p1(2)-p0(2))*(1-t)^4+20*(p2(2)-p1(2))*t*(1-t)^3+30*(p3(2)-p2(2))*t^2*(1-t)^2+20*(p4(2)-p3(2))*t^3*(1-t)+5*(p5(2)-p4(2))*t^4;        
%             diffx2= 20*(p2(1)-2*p1(1)+p0(1))*(1-t)^3+60*(p3(1)-2*p2(1)+p1(1))*t*(1-t)^2+60*(p4(1)-2*p3(1)+p2(1))*t^2*(1-t)+20*(p5(1)-2*p4(1)+p3(1))*t^3;
%             diffy2= 20*(p2(2)-2*p1(2)+p0(2))*(1-t)^3+60*(p3(2)-2*p2(2)+p1(2))*t*(1-t)^2+60*(p4(2)-2*p3(2)+p2(2))*t^2*(1-t)+20*(p5(2)-2*p4(2)+p3(2))*t^3;
%              k=abs(diffx1*diffy2-diffy1*diffx2)/(sqrt(diffx1^2+diffy1^2))^3;
%              if k>k1
%                  k1=k;
%              end
%              plot(t,diffx1,'.');hold on
%              plot(t,diffy1,'.');hold on
%              plot(t,k,'.');hold on
%         end
%         k1

        
        
%  end       
        
        
        
        
  %          k1=0;
%          k2=1000000000;
%          xx=0;
%          yy=0;
      
        
        
%          for i=0.1:0.05:10
%              for j=0.1:0.05:10
%                  p2(2)=i;p1(2)=i*0.5;   p3(1)=10-j*0.5; p3(2)=10-j*sqrt(3)*0.5; p4(1)=(p5(1)+p3(1))*0.5; p4(2)=(p5(2)+p3(2))*0.5;         
                
%                   for t=0:0.01:1
%          x=(1-t)^5*p0(1)+5*t*(1-t)^4*p1(1)+10*t^2*(1-t)^3*p2(1)+10*t^3*(1-t)^2*p3(1)+5*t^4*(1-t)*p4(1)+t^5*p5(1);
%          y=(1-t)^5*p0(2)+5*t*(1-t)^4*p1(2)+10*t^2*(1-t)^3*p2(2)+10*t^3*(1-t)^2*p3(2)+5*t^4*(1-t)*p4(2)+t^5*p5(2);
%          plot(x,y,'.');hold on        
        
 %          plot(p0(1),p0(2),'*','MarkerSize',10);hold on ; 
% %          gtext('p0');
%          plot(p1(1),p1(2),'*','MarkerSize',10);hold on ; 
% %          gtext('p1');
%          plot(p2(1),p2(2),'*','MarkerSize',10);hold on ; 
% %          gtext('p2');
%          plot(p3(1),p3(2),'*','MarkerSize',10);hold on ; 
% %          gtext('p3');
%          plot(p4(1),p4(2),'*','MarkerSize',10);hold on ; 
% %          gtext('p4');
%          plot(p5(1),p5(2),'*','MarkerSize',10);hold on ;
% %          gtext('p5');
%          line([p0(1),p5(1)],[p0(2),p5(2)])       
        
        
        
        
%         k=abs(diffx1*diffy2-diffy1*diffx2)/(sqrt(diffx1^2+diffy1^2))^3;
%          plot(t,diffx2,'.');hold on
%         plot(t,k,'.');hold on

%                   end
%          syms x
%         f=@(x) abs(sin(x)+x*cos(x));
%         [xmax]=fminbnd(inline(-f(x)),0,5)




         
%          if k>k1
%             k1=k;t1=t;xx=i;yy=j;
%          end           
%                   end
%                   k1
                  %         if k1<k2
%          k2=k1;xx1=xx;yy1=yy;t2=t1;
%         end
%                  k1=0;                  
%              end
%          end        
%          k2  
%          xx1
%          yy1
%          t2



% clc
% clear
% close all
% fun=@(x) -(sin(x)+x*cos(x));
% x0=2;
% A=[];
% b=[];
% Aeq=[];
% beq=[];
% vlb=[-10];
% vub=[10];
% exitflag=1;
% % options=optimset('Algorithm','sqp','TolFun',1e-16);
% [x,fval,exitflag]=fmincon(fun,x0,A,b,Aeq,beq,vlb,vub,'mycon')
% 
%       for x=-10:0.01:10
%           f=-(sin(x)+x*cos(x));
%           plot(x,f,'.');hold on
%       end


