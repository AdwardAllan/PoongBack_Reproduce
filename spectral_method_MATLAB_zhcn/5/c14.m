%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2; N=20;
%构造切比雪夫求导矩阵
[D,x]=cheb(N); D=D/(L/2);
D2=D^2; x=L/2*x; y=x;
[X,Y]=meshgrid(x,y);
%初始条件
u=max(0,1-sqrt((X-1).^2+Y.^2));
%求解
t=[0 0.001 0.02 0.5];
[t,usol]=ode45('heat2',t,u(:),[],N,D2);
%画图
for n=1:4
    subplot(2,2,n)
    surfl(x,y,reshape(usol(n,:),N+1,N+1))
    axis([-1 1 -1 1 0 1]), shading interp
    xlabel x, ylabel y, zlabel u
    title(['t=' num2str(t(n))]);
end





colormap(gray)
print -dtiff -r600 14.tif