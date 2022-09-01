%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=16; N=64;
kx=2*pi/L*[0:N/2-1 -N/2:-1]; ky=kx;
[kX,kY]=meshgrid(kx,ky);
K2=kX.^2+kY.^2;
%��ʼ����
u=zeros(N); u(N/2,N/2)=1; v=ones(N);
ut=fft2(u); vt=fft2(v);
uvt=[ut(:); vt(:)];
%���
a=0.1; b=0.8; d=26; gamma=100; t=[0:0.1:0.3];
[t,uvtsol]=ode45('schnakenberg',t,uvt,[],K2,N,gamma,a,b,d);
%��ͼ
for n=1:4
    subplot(2,2,n)
    gca=pcolor(ifft2(reshape(uvtsol(n,1:N^2),N,N))); axis off
    set(gca,'LineStyle','none'), shading interp
    title(['t=' num2str(t(n))]), axis('square'), colormap('gray')
end







print -dtiff -r600 9.tif