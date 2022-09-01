%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
[T,U]=ode15s(@vdp,[0 3000],[2 0]);
plot(T,U(:,1),'k','LineWidth',1.5)
xlabel x, ylabel u_1







print -dtiff -r600 2.tif