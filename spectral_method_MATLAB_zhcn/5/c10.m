%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2; N=40;
%构造拉普拉斯算符矩阵
[D,x]=cheb(N); D=D/(L/2); D2=D^2;
I=eye(N+1); LA=kron(I,D2)+kron(D2,I);
x=L/2*x; y=x; [x,y]=meshgrid(x,y);
X=x(:); Y=y(:);
%修改拉普拉斯算符矩阵
bound=find(abs(X)==L/2|abs(Y)==L/2);
LA(bound,:)=0; LA(bound,bound)=eye(4*N);
%给f(x)加入边界条件
f=6*(X+1).*(Y+0.1).^3;
f(bound)=(Y(bound)==L/2).*sinc(4*X(bound))/2+...
    (X(bound)==L/2).*max(0,(0.5-abs(Y(bound))));
%求解
u=reshape(LA\f,N+1,N+1);
%画图
x2=-L/2:0.04:L/2; y2=x2;
u2=interp2(x,y,u,x2,y2','cubic');
mesh(x2,y2,u2)
view(-60,30), axis([-1 1 -1 1 -0.25 0.5])
xlabel x, ylabel y, zlabel u




colormap([0 0 0])
print -dtiff -r600 10.tif
