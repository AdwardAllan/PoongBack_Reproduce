%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=4; N=10;
[D,x]=cheb(N); D=D/(L/2);
D2=D^2; D2=D2(2:N,2:N); x=L/2*x;
f=x(2:N).^2-x(2:N);
u=D2\f; u=[0;u;0];
error=x.^4/12-x.^3/6+2*x/3-4/3-u;
X=-L/2:0.1:L/2;
exact=X.^4/12-X.^3/6+2*X/3-4/3;
subplot(2,2,1)
plot(X,exact,'k',x,u,'.r','MarkerSize',16,'LineWidth',1.5)
title(['Error_{max}=' num2str(max(abs(error)))]), xlabel x, ylabel u
subplot(2,2,2)
plot(x,error,'.r','MarkerSize',16)
xlabel x, ylabel Error




print -dtiff -r600 5.tif