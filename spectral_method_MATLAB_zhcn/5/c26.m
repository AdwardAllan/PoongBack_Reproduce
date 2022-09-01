%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2; N=20; h=0.1;
%构造切比雪夫求导矩阵
[D,x]=cheb(N); D=D/(L/2);
D2=D^2; x=L/2*x; y=x;
%初始条件
[X,Y]=meshgrid(x,y);
u=(1+cos(pi*X)).*(1+cos(pi*Y));
%边界条件
BCx=-(h*D([1 N+1],[1 N+1])+[1 0;0 0])\(h*D([1 N+1],2:N));
BCy=-D([1 N+1],[1 N+1])\D([1 N+1],2:N);
%求解
t=[0 0.05 0.2 4];
[t,usol]=ode45('heat2D',t,u(:),[],N,D2,BCx,BCy);
%画图
for n=1:4
    subplot(2,2,n)
    u=reshape(usol(n,:),N+1,N+1);
    surfl(x,y,u), shading interp
    axis([-1 1 -1 1 0 4]), view(15,15)
    xlabel x, ylabel y, zlabel u
    title(['t=' num2str(t(n))])
    %误差
    E=h*u*D'+u; max(abs(E(:,1)))
end





colormap(gray)
print -dtiff -r600 26.tif