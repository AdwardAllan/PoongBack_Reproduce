%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
%生成网格上的坐标
h=0.01; x=[0:h:2]'; y=[0:h:1]';
N=length(x)-1; M=length(y)-1;
[X,Y]=meshgrid(x,y);
%解析解
u_analytical=exp(X).*sin(pi*Y);
X=X(2:M,2:N); Y=Y(2:M,2:N);
%生成f(x,y)的矩阵
f=(pi^2-1)*exp(X).*sin(pi*Y);
f(:,1)=f(:,1)+sin(pi*y(2:M))/h^2;
f(:,end)=f(:,end)+exp(2)*sin(pi*y(2:M))/h^2;
%构造矩阵D、C、A
e=ones(N-1,1);
C=1/h^2*spdiags([-e 4*e -e],[-1 0 1],N-1,N-1);
D=-1/h^2*eye(N-1);
e=ones(M-1,1);
A=kron(eye(M-1),C)+kron(spdiags([e e],[-1 1],M-1,M-1),D);
%左除求解
f=f'; u=zeros(M+1,N+1);
u(2:M,2:N)=reshape(A\f(:),N-1,M-1)';
u(:,1)=sin(pi*y); u(:,end)=exp(2)*sin(pi*y);
%画图
% figure(1), spy(A,'k',16)
figure(2), subplot(2,2,1), mesh(x,y,u)
xlabel x, ylabel y, zlabel u
subplot(2,2,2), mesh(x,y,u-u_analytical)
% axis([0 2 0 1 0 0.04])
xlabel x, ylabel y, zlabel Error

% 
% colormap([0 0 0])
% print -dtiff -r600 2_1.tif
% close
% print -dtiff -r600 2_2.tif