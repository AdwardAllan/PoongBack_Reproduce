%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=20; N=100;
t=L/N*[-N/2:N/2-1];
%�������󵼾���
h=2*pi/N;
column=[-pi^2/(3*h^2)-1/6 -0.5*(-1).^(1:N-1)./sin(h*(1:N-1)/2).^2];
D2=(2*pi/L)^2*toeplitz(column);
%��ʼ����
u=sech(t/2)*0.3+0.5*rand(1,N);
%��ֵ���
beta2=-1; gamma=1; g0=1; tau=0.2;
alpha0=1.2; P0=1; z=0:30;
[z,usol]=ode45('master',z,u,[],D2,beta2,gamma,g0,tau,alpha0,P0);
%��ͼ
waterfall(t,z,abs(usol)), xlabel t, ylabel z, zlabel |u|




colormap([0 0 0])
print -dtiff -r600 6.tif