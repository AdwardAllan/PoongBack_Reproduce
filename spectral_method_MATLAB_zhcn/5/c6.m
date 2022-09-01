%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=4; N=10;
[D,x]=cheb(N); D=D/(L/2); x=L/2*x;
%方法1
D2=D^2; D2=D2(2:N,2:N);
f=x(2:N).^2-x(2:N);
u1=D2\f; u1=[0;u1;0];
u1=u1+0.75*x+0.5;
%方法2
D2=D^2; D2([1 N+1],:)=0;
D2(1,1)=1; D2(N+1,N+1)=1;
f=x(2:N).^2-x(2:N);
f=[2;f;-1]; u2=D2\f;
%误差
exact=x.^4/12-x.^3/6+17*x/12-5/6;
error1=abs(exact-u1);
error2=abs(exact-u2);
subplot(2,2,1)
plot(x,u1,'or',x,u2,'+b',x,exact,'k','MarkerSize',10,'LineWidth',1.5)
title({['Error1_{max}=' num2str(max(error1))]; ...
    ['Error2_{max}=' num2str(max(error2))]})
xlabel x, ylabel u
legend({'方法1','方法2'})
subplot(2,2,2)
plot(x,error1,'or',x,error2,'+b','MarkerSize',10,'LineWidth',1.5)
xlabel x, ylabel Error
legend({'方法1','方法2'})





% print -dtiff -r600 6.tif