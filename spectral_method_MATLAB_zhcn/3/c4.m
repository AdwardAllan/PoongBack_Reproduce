%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=4; N=64;
x=L/N*[-N/2:N/2-1]; y=x;
kx=(2*pi/L)*[0:N/2-1 -N/2:-1]; ky=kx;
[X,Y]=meshgrid(x,y);
[kX,kY]=meshgrid(kx,ky);
K2=kX.^2+kY.^2;
%初始条件
u=exp(-20*((X-0.4).^2+(Y+0.4).^2))+exp(-20*((X+0.4).^2+(Y-0.4).^2));
ut=fft2(u); vt=zeros(N); uvt=[ut(:); vt(:)];
%求解
a=1; t=[0 0.25 0.5 1];
[t,uvtsol]=ode45('wave2D',t,uvt,[],N,K2(:),a);
%画图
for n=1:4
     subplot(2,2,n)
     mesh(x,y,ifft2(reshape(uvtsol(n,1:N^2),N,N))), view(10,45)
     title(['t=' num2str(t(n))]), axis([-L/2 L/2 -L/2 L/2 0 1])
     xlabel x, ylabel y, zlabel u
end



colormap([0 0 0])
print -dtiff -r600 4.tif