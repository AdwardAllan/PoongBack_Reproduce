%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=4; N=60;
%�������󵼾���
h=2*pi/N;
column=[-pi^2/(3*h^2)-1/6 -0.5*(-1).^(1:N-1)./sin(h*(1:N-1)/2).^2];
D2=(2*pi/L)^2*toeplitz(column);
%��ʼ����
u=rand(N)*0.5+0.5; v=0.5*ones(N);
uv=[u(:); v(:)]; 
%��ֵ���
gamma=100; a=0.1; b=0.8; d=26;
t=0:0.1:0.3;
[t,uvsol]=ode23('schnakenberg',t,uv,[],D2,N,gamma,a,b,d);
%��ͼ
for n=1:4
    subplot(2,2,n)
    gca=pcolor(reshape(uvsol(n,1:N^2),N,N)); axis off
    set(gca,'LineStyle','none'), shading interp
    title(['t=' num2str(t(n))]), axis square
end





print -dtiff -r600 8.tif
colormap('gray')
print -dtiff -r600 8_2.tif