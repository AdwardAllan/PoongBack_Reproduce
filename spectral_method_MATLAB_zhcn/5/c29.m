%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=20; N=60;
%构造拉普拉斯算符矩阵并求逆
[D,x]=cheb(N); x=L/2*x; y=x;
[X,Y]=meshgrid(x(2:N),y(2:N));
D=D/(L/2); D2=D^2;
D=D(2:N,2:N); D2=D2(2:N,2:N);
I=eye(N-1); LA=kron(I,D2)+kron(D2,I);
LA_inv=inv(LA);
%初始条件
w=sech((X+2).^2+Y.^2/20)+sech((X-2).^2+Y.^2/20);
%求解
v=0.001; t=0:5:15;
[t,wsol]=ode113('advection_diffusion',t,w(:),[],N,D,D2,LA_inv,v);
%画图
x2=-L/2:0.2:L/2; y2=x2;
for n=1:4
    subplot(2,2,n)
    w=zeros(N+1);
    w(2:N,2:N)=reshape(wsol(n,:),N-1,N-1);
    w=interp2(x,y,w,x2,y2','cubic');
    gca=pcolor(w); set(gca,'LineStyle','none'), shading interp
    title(['t=' num2str(t(n))]), axis('square'), axis off
end





%colormap('gray')
print -dtiff -r600 29.tif
