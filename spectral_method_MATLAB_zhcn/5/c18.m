%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=4; N=50;
%构造拉普拉斯算符矩阵
[D,x]=cheb(N); x=L/2*x; y=x;
[X,Y]=meshgrid(x,y);
X=X(:); Y=Y(:); D=D/(L/2); D2=D^2;
I=eye(N+1); LA=kron(I,D2)+kron(D2,I);    
%修改拉普拉斯算符矩阵
Hx=kron(D,I); Hy=kron(I,D);
bound1=find(X==-L/2|Y==-L/2);
bound2=find(X==L/2|Y==L/2);
LA(bound1,:)=0; LA(bound1,bound1)=eye(2*N+1);
LA(bound2,:)=repmat(X(bound2)==L/2,1,(N+1)^2).*Hx(bound2,:) ...
    +repmat(Y(bound2)==L/2,1,(N+1)^2).*Hy(bound2,:);
%边界条件
f=-sin((X+2).^2.*(Y+1));
f([bound1;bound2])=0;
f(bound1)=(X(bound1)==-L/2).*sin(pi*Y(bound1))/10;
%求解
u=LA\f; u=reshape(u,N+1,N+1);
%画图
x2=-L/2:0.05:L/2; y2=x2;
u2=interp2(x,y,u,x2,y2','cubic');
mesh(x2,y2,u2), view(-25,45)
xlabel x, ylabel y, zlabel u
axis([-2 2 -2 2 -0.1 0.3])





colormap([0 0 0])
print -dtiff -r600 18.tif