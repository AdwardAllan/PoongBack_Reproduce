%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
x=linspace(0,pi,20);
solinit=bvpinit(x,[2 2]);
%bvp4c解边值问题
sol=bvp4c(@shoot2,@bc,solinit);
%从结构体sol获取指定位置的数值结果
u=deval(sol,x);
%解析解
u_exact=cos(x)+x.*exp(-x);
%画图
plot(x,u(1,:),'+k',x,u_exact,'k','MarkerSize',10,'LineWidth',1.5)
set(gca,'Fontsize',16), xlabel x, ylabel u
legend('bvp4c','解析解',0), axis([0 pi -1 1.5])


print -dtiff -r600 5.tif