%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=2; N=20;
%�����б�ѩ���󵼾���
[D,x]=cheb(N); D=D/(L/2);
D2=D^2; x=L/2*x;
%��ʼ����
u=1+cos(pi*x);
%ŵ�����߽�����
BC=-D([1 N+1],[1 N+1])\D([1 N+1],2:N);
%���
t=0:0.01:0.4;
[t,usol]=ode45('heat1D',t,u,[],N,D2,BC);
%��ͼ
X=L/2:-0.05:-L/2;
u=interp2(x,t,usol,X,t,'cubic');
waterfall(X,t,u)
xlabel x, ylabel t, zlabel u
axis([-1 1 0 0.4 0 2])




colormap([0 0 0])
print -dtiff -r600 19.tif