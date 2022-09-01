%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=4; N=18; h=2;
%构造切比雪夫求导矩阵并修改
[D,x]=cheb(N); D=D/(L/2); x=L/2*x;
D2=D^2; I=eye(N+1);
D2([1 N+1],:)=h*D([1 N+1],:)+I([1 N+1],:);
%求解
f=exp(x(1:N+1)); f([1 N+1])=1; u=D2\f;
%画图
exact=exp(x)+3/4*(exp(-2)-exp(2))*x+1-3*exp(-2);
error=abs(exact-u);
subplot(2,2,1)
plot(x,exact,'k',x,u,'.r','MarkerSize',16,'LineWidth',1.5)
title(['Error_{max}=' num2str(max(error))]), xlabel x, ylabel u
subplot(2,2,2)
plot(x,error,'.r','MarkerSize',16)
xlabel x, ylabel Error






print -dtiff -r600 23.tif