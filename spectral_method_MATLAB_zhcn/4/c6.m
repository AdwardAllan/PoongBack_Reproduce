%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=20; N=100;
t=L/N*[-N/2:N/2-1];
%构造谱求导矩阵
h=2*pi/N;
column=[-pi^2/(3*h^2)-1/6 -0.5*(-1).^(1:N-1)./sin(h*(1:N-1)/2).^2];
D2=(2*pi/L)^2*toeplitz(column);
%初始条件
u=sech(t/2)*0.3+0.5*rand(1,N);
%数值求解
beta2=-1; gamma=1; g0=1; tau=0.2;
alpha0=1.2; P0=1; z=0:30;
[z,usol]=ode45('master',z,u,[],D2,beta2,gamma,g0,tau,alpha0,P0);
%画图
waterfall(t,z,abs(usol)), xlabel t, ylabel z, zlabel |u|




colormap([0 0 0])
print -dtiff -r600 6.tif