%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=80; N=160;
x=L/N*[-N/2:N/2-1];
%�������󵼾���
h=2*pi/N;
column=[-pi^2/(3*h^2)-1/6 -0.5*(-1).^(1:N-1)./sin(h*(1:N-1)/2).^2];
D2=(2*pi/L)^2*toeplitz(column);
%��ʼ����
u=2*sech(x+10)-2*sech(x-10);
v=zeros(1,N); uv=[u v];
%��ֵ���
a=1; t=0:0.5:20;
[t,uvsol]=ode45('wave1D',t,uv,[],N,D2,a);
%��ͼ
p=[1 11 21 41];
for n=1:4
    subplot(5,2,n)
    plot(x,uvsol(p(n),1:N),'k','LineWidth',1.5), xlabel x, ylabel u
    title(['t=' num2str(t(p(n)))]), axis([-L/2 L/2 -2 2])
end
subplot(5,2,5:10)
waterfall(x,t,uvsol(:,1:N)), view(10,45)
xlabel x, ylabel t, zlabel u, axis([-L/2 L/2 0 t(end) -2 2])


colormap([0 0 0])
print -dtiff -r600 4.tif