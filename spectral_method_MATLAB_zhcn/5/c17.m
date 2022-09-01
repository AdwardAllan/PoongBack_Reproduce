%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=4; N=17;
%构造切比雪夫求导矩阵
[D,x]=cheb(N); D=D/(L/2); x=L/2*x;
D2=D^2; D2(1,:)=D(1,:);
D2=D2(1:N,1:N);
%求解
f=exp(x(1:N)); f(1)=0;
u=D2\f; u=[u;0];
exact=exp(x)-exp(2)*x-exp(-2)-2*exp(2);
error=abs(exact-u);
%画图
subplot(2,2,1)
plot(x,exact,'k',x,u,'.r','MarkerSize',16,'LineWidth',1.5)
title(['Error_{max}=' num2str(max(error))]), xlabel x, ylabel u
subplot(2,2,2)
plot(x,error,'.r','MarkerSize',16)
xlabel x, ylabel Error






print -dtiff -r600 17.tif