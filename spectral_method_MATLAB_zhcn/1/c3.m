%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
beta=1; omega=10; xspan=[0 5];
[x,usol]=ode45('damp',xspan,[1 0],[],beta,omega);
plot(x,usol(:,1),'k','LineWidth',1.5)
xlabel x, ylabel u




print -dtiff -r600 3.tif