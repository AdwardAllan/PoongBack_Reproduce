%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=1; h=0.05; x=0:h:L;
u_Euler=zeros(length(x),1); u_Euler(1)=3;
u_pc=u_Euler; u_ode45=u_Euler;
for n=1:length(x)-1
    %ŷ����
    u_Euler(n+1)=u_Euler(n)+h*(-3*u_Euler(n)+6*x(n)+5);
    %Ԥ��-У����
    k1=h*(-3*u_pc(n)+6*x(n)+5);
    k2=h*(-3*(u_pc(n)+k1)+6*(x(n)+h)+5);
    u_pc(n+1)=u_pc(n)+(k1+k2)/2;
end
%ode45
[x,u_ode45]=ode45(@(x,u)[-3*u+6*x+5],x,u_ode45(1));
%������
u_exact=2*exp(-3*x)+2*x+1;
%��ͼ
plot(x,u_Euler,'xk',x,u_pc,'ok',x,u_ode45,'+k',x,u_exact,'k','MarkerSize',10,'LineWidth',1.5)
axis([0 1 2.3 3.15]), set(gca,'Fontsize',16), xlabel x, ylabel u
legend('ŷ����','Ԥ��-У����','ode45','������','location','North')
%�����㷨�����
Error(:,1)=abs(u_Euler-u_exact);
Error(:,2)=abs(u_pc-u_exact);
Error(:,3)=abs(u_ode45-u_exact);



print -dtiff -r600 1.tif