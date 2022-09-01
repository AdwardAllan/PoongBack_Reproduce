%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=4; N=64;
x=L/N*[-N/2:N/2-1]; y=x;
kx=2*pi/L*[0:N/2-1 -N/2:-1]; ky=kx;
[X,Y]=meshgrid(x,y);
[kX,kY]=meshgrid(kx,ky);
K2=kX.^2+kY.^2;
%��ʼ����
u=sech(4*X.^2+4*Y.^2);
ut=fft2(u);
%���
v=0.01; t=0:0.4:1.2;
[t,utsol]=ode45('burgers',t,ut(:),[],N,kX,kY,K2,v);
%��ͼ
for n=1:4
    subplot(2,2,n)
    mesh(x,y,real(ifft2(reshape(utsol(n,:),N,N))))
    axis([-2 2 -2 2 0 1]), xlabel x, ylabel y, zlabel u
    view(46,20), title(['t=' num2str(t(n))])
end





colormap([0 0 0])
print -dtiff -r600 8.tif
