%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=16; N=64;
kx=2*pi/L*[0:N/2-1 -N/2:-1]; ky=kx;
[kX,kY]=meshgrid(kx,ky);
K2=kX.^2+kY.^2;
%初始条件
u=zeros(N); u(N/2,N/2)=1; v=ones(N);
ut=fft2(u); vt=fft2(v);
uvt=[ut(:); vt(:)];
%求解
a=0.1; b=0.8; d=26; gamma=100; t=[0:0.1:0.3];
[t,uvtsol]=ode45('schnakenberg',t,uvt,[],K2,N,gamma,a,b,d);
%画图
for n=1:4
    subplot(2,2,n)
    gca=pcolor(ifft2(reshape(uvtsol(n,1:N^2),N,N))); axis off
    set(gca,'LineStyle','none'), shading interp
    title(['t=' num2str(t(n))]), axis('square'), colormap('gray')
end







print -dtiff -r600 9.tif