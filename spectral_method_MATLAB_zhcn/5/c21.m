%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2; N=24;
%构造切比雪夫求导矩阵
[D,x]=cheb(N); D=D/(L/2);
D4=(diag(1-x.^2)*D^4-diag(8*x)*D^3-12*D^2)*diag([1./(1-x.^2)]);
D4=D4(2:N,2:N);
%求解
f=sin(pi*x(2:N)); u=[0;D4\f;0];
%画图
exact=sin(pi*x)/pi^4+(x.^3-x)./(2*pi^3);
error=abs(exact-u);
subplot(2,2,1)
plot(x,exact,'k',x,u,'.r','MarkerSize',15,'LineWidth',1.5)
title(['Error_{max}=' num2str(max(error))])
xlabel x,ylabel u
subplot(2,2,2)
plot(x,error,'.r','MarkerSize',15)
xlabel x,ylabel Error




print -dtiff -r600 21.tif