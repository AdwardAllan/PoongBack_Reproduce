%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=40; N=64;
x=L/N*[-N/2:N/2-1]; y=x;
kx=2*pi/L*[0:N/2-1 -N/2:-1]; ky=kx;
[X,Y]=meshgrid(x,y);
[kX,kY]=meshgrid(kx,ky);
%��ʼ����
e=0.1*exp(-X.^2/10-Y.^2/10)+0.1;
et=fft2(e); ut=zeros(N^2,1); vt=zeros(N^2,1);
euvt=[et(:); ut; vt;];
%���
t=[0 5 10 25]; g=1;
[t,euvtsol]=ode45('shallow_water',t,euvt,[],kX,kY,N,g);
%��ͼ
for n=1:4
    subplot(2,2,n)
    mesh(x,y,real(ifft2(reshape(euvtsol(n,1:N^2),N,N))))
    axis([-20 20 -20 20 0.1 0.2]), title(['t=' num2str(t(n))])
    xlabel x, ylabel y, zlabel \eta, view(-80,45)
end






colormap([0 0 0])
print -dtiff -r600 7.tif