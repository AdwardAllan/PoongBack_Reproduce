%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=100; N=100;
t=L/N*[-N/2:N/2-1];
%�������󵼾���
h=2*pi/N;
column=[-pi^2/(3*h^2)-1/6 -0.5*(-1).^(1:N-1)./sin(h*(1:N-1)/2).^2];
D2=(2*pi/L)^2*toeplitz(column);
%��ʼ����
u1=0.3*sech(t/4)+0.6*rand(1,N);
u2=zeros(1,N); u3=zeros(1,N);
u=[u1 u2 u3];
%��ֵ���
k12=0.3; k23=k12; beta2=1; gamma=1; g=0.3;
tau=2; a1=0.01; a2=0.1; a3=1; z=0:4:200;
[z,usol]=ode45('CNLSE',z,u,[],N,D2,k12,k23,beta2,gamma,g,tau,a1,a2,a3);
%��ͼ
for n=1:3
    subplot(2,2,n)
    waterfall(t,z,abs(usol(:,(n-1)*N+[1:N])))
    xlabel t, ylabel z, zlabel(['|u_' num2str(n) '|'])
end





colormap([0 0 0])
print -dtiff -r600 7.tif