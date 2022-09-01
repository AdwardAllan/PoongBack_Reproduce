%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=20; N=128;
x=L/N*[-N/2:N/2-1]; y=x;
kx=(2*pi/L)*[0:N/2-1 -N/2:-1];
kx(1)=1e-6; ky=kx;
[X,Y]=meshgrid(x,y);
[kX,kY]=meshgrid(kx,ky);
K2=kX.^2+kY.^2;
%�������󵼾���
h=2*pi/N; column=[0 0.5*(-1).^(1:N-1).*cot((1:N-1)*h/2)]';
D=(2*pi/L)*toeplitz(column,column([1 N:-1:2]));
column=[-pi^2/(3*h^2)-1/6 -0.5*(-1).^(1:N-1)./sin(h*(1:N-1)/2).^2];
D2=(2*pi/L)^2*toeplitz(column);
%��ʼ����
w=sech(X.^2+Y.^2/20);
%��ֵ���
v=0.001; t=0:10:30;
[t,wsol]=ode45('advection_diffusion',t,w(:),[],N,D,D2,K2,v);
%��ͼ
for n=1:4
    subplot(2,2,n)
    gca=pcolor(reshape(wsol(n,:),N,N)); axis off
    set(gca,'LineStyle','none'), shading interp
    title(['t=' num2str(t(n))]), axis square
end






%colormap('gray')
print -dtiff -r600 9.tif