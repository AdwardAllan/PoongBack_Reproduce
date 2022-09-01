%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2; N=20; h=0.1;
%构造切比雪夫求导矩阵
[D,x]=cheb(N); D=D/(L/2);
D2=D^2; x=L/2*x;
%初始条件
u=1+cos(pi*x);
%洛平边界条件
A=h*[1 0;0 -1];
BC=-(A*D([1 N+1],[1 N+1])+[1 0;0 1])\(A*D([1 N+1],2:N));
%求解
t=0:0.03:1.5;
[t,usol]=ode45('heat1D',t,u,[],N,D2,BC);
%画图
X=L/2:-0.05:-L/2;
u=interp2(x,t,usol,X,t,'cubic');
waterfall(X,t,u)
xlabel x, ylabel t, zlabel u
axis([-1 1 0 1.5 0 2]), view(-130,30)
%误差
E=usol+h*(D*usol')'; max(abs(E(:,1)))



colormap([0 0 0])
print -dtiff -r600 25.tif