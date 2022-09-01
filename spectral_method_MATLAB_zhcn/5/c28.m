%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=120; N=90;
%构造切比雪夫求导矩阵
[D,x]=cheb(N); D=D/(L/2); D2=D^2;
x=L/2*x; y=x;
%边界条件
BCx=-(D([1 N+1],2:N)')/(D([1 N+1],[1 N+1])');
BCy=-D([1 N+1],[1 N+1])\D([1 N+1],2:N);
%初始条件
u_old=zeros(N+1,N+1); v_old=u_old;
u_old(N/2,1:N/2)=0.5; v_old(N/2,1:N/2)=0.5; 
u_old(N/2-1,1:N/2)=1; v_old(N/2+1,1:N/2)=1;
usol(:,:,1)=u_old; vsol(:,:,1)=v_old;
%求解
dt=0.002; epsilon=0.02; a=0.5; b=0.01; d=1.6;
for n=1:3
    for m=1:2500
        u=u_old+dt*(d*(u_old*(D2')+D2*u_old)+ ...
            1/epsilon*u_old.*(1-u_old).*(u_old-(b+v_old)/a));
        v=v_old+dt*(u_old-v_old);
        u([1 N+1],:)=BCy*u(2:N,:); u(:,[1 N+1])=u(:,2:N)*BCx;
        v([1 N+1],:)=BCy*v(2:N,:); v(:,[1 N+1])=v(:,2:N)*BCx;
        u_old=u; v_old=v;
    end
    usol(:,:,n+1)=u; vsol(:,:,n+1)=v;
end
%画图
for n=1:4
    subplot(2,2,n)
    gca=pcolor(x,y,usol(:,:,n));
    set(gca,'LineStyle','none'), axis off
    shading interp, axis square
end





colormap('gray')
print -dtiff -r600 28.tif