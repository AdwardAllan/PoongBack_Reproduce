%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=20; N=256;
x=L/N*[-N/2:N/2-1];
k=(2*pi/L)*[0:N/2-1 -N/2:-1].';
%初始条件
u=2*sech(x); ut=fft(u);
%求解
t=0:0.1:5;
[t,utsol]=ode45('NLSE',t,ut,[],k);
usol=ifft(utsol,[],2);
%画图
subplot(2,2,1)
waterfall(x,t,abs(usol))
axis([-10 10 0 5 0 4]), xlabel x, ylabel t, zlabel |u|
subplot(2,2,2)
waterfall(fftshift(k),t,abs(fftshift(utsol,2)))
axis([-40 40 0 5 0 80]), xlabel k, ylabel t, zlabel |fft(u)|




colormap([0 0 0]); 
print -dtiff -r600 5.tif
