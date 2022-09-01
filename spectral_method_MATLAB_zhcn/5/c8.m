%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2; N=20;
%构造拉普拉斯算符矩阵
[D,x]=cheb(N); D=D/(L/2); D2=D^2;
D2=D2(2:N,2:N);
I=eye(N-1); LA=kron(I,D2)+kron(D2,I);
x=L/2*x; y=x; [x,y]=meshgrid(x,y);
X=x(2:N,2:N); Y=y(2:N,2:N);
f=6*(X(:)+1).*(Y(:)+0.1).^3;
%求解
u=zeros(N+1);
u(2:N,2:N)=reshape(LA\f,N-1,N-1);
%画图
[x2,y2]=meshgrid(-L/2:0.04:L/2,-L/2:0.04:L/2);
u2=interp2(x,y,u,x2,y2,'cubic');
mesh(x2,y2,u2), xlabel x, ylabel y, zlabel u
view(-60,30), axis([-1 1 -1 1 -0.3 0.1])







% colormap([0 0 0])
print -dtiff -r600 8.tif
