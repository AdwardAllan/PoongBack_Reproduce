%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
%x����
Lx=6; Nx=50;
x=Lx/Nx*[-Nx/2:Nx/2-1]'; 
h=2*pi/Nx; column=[0 0.5*(-1).^(1:Nx-1).*cot((1:Nx-1)*h/2)]';
Dx=(2*pi/Lx)*toeplitz(column,column([1 Nx:-1:2]));
column=[-pi^2/(3*h^2)-1/6 -0.5*(-1).^(1:Nx-1)./sin(h*(1:Nx-1)/2).^2];
D2x=(2*pi/Lx)^2*toeplitz(column);
%y����
Ly=2; Ny=20; [Dy,y]=cheb(Ny);
Dy=Dy/(Ly/2); D2y=Dy^2; y=Ly/2*y;
%ŵ�����߽�����
BCy=-Dy([1 Ny+1],[1 Ny+1])\Dy([1 Ny+1],2:Ny);
%��ʼ����
[X,Y]=meshgrid(x,y);
u=exp(-8*((X+1.5).^2+Y.^2));
v=-u*Dx';
uv=[u(:); v(:)];
%���
t=0:2:4;
[t,uvsol]=ode45('wave_tank',t,uv,[],Nx,Ny,D2x,D2y,BCy);
%��ͼ
for n=1:3
subplot(3,1,n)
u=reshape(uvsol(n,1:end/2),Ny+1,Nx);
mesh(x,y,u), view(-10,60), grid off
title(['t=' num2str(t(n))])
xlabel x, ylabel y, zlabel u
axis([-3 3 -1 1 -0.15 1])
end



colormap([0 0 0])
print -dtiff -r600 20.tif
