%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=1; h=0.05; x=0:h:L;
u_Euler=zeros(length(x),1); u_Euler(1)=3;
u_pc=u_Euler; u_ode45=u_Euler;
for n=1:length(x)-1
    %欧拉法
    u_Euler(n+1)=u_Euler(n)+h*(-3*u_Euler(n)+6*x(n)+5);
    %预测-校正法
    k1=h*(-3*u_pc(n)+6*x(n)+5);
    k2=h*(-3*(u_pc(n)+k1)+6*(x(n)+h)+5);
    u_pc(n+1)=u_pc(n)+(k1+k2)/2;
end
%ode45
[x,u_ode45]=ode45(@(x,u)[-3*u+6*x+5],x,u_ode45(1));
%解析解
u_exact=2*exp(-3*x)+2*x+1;
%画图
plot(x,u_Euler,'xk',x,u_pc,'ok',x,u_ode45,'+k',x,u_exact,'k','MarkerSize',10,'LineWidth',1.5)
axis([0 1 2.3 3.15]), set(gca,'Fontsize',16), xlabel x, ylabel u
legend('欧拉法','预测-校正法','ode45','解析解','location','North')
%三种算法的误差
Error(:,1)=abs(u_Euler-u_exact);
Error(:,2)=abs(u_pc-u_exact);
Error(:,3)=abs(u_ode45-u_exact);



print -dtiff -r600 1.tif