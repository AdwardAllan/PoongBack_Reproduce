%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=4; N=60;
x=L/N*[-N/2:N/2-1]; y=x;
[X,Y]=meshgrid(x,y);
%�������󵼾���
h=2*pi/N;
column=[-pi^2/(3*h^2)-1/6 -0.5*(-1).^(1:N-1)./sin(h*(1:N-1)/2).^2];
D2=(2*pi/L)^2*toeplitz(column);
%��ʼ����
u=exp(-20*((X-0.4).^2+(Y+0.4).^2))-exp(-20*((X+0.4).^2+(Y-0.4).^2));
v=zeros(N); uv=[u(:) v(:)];
%��ֵ���
a=1; t=[0 0.25 0.5 1];
[t,uvsol]=ode45('wave2D',t,uv,[],N,D2,a);
%��ͼ
for n=1:4
     subplot(2,2,n)
     mesh(x,y,reshape(uvsol(n,1:N^2),N,N))
     title(['t=' num2str(t(n))]), xlabel x, ylabel y, zlabel u
     axis([-L/2 L/2 -L/2 L/2 -1 1])
end



colormap([0 0 0])
print -dtiff -r600 5.tif