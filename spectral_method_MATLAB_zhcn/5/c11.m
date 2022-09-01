%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=2; N=20;
%�����б�ѩ���󵼾���
[D,x]=cheb(N); D=D/(L/2);
x=L/2*x; D2=D^2;
%��ʼ����
u=0.53*x-0.47*sin(1.5*pi*x);
%���
t=[0:2:100]; epsilon=0.01;
[t,usol]=ode45('allen_cahn',t,u,[],D2,epsilon);
%��ͼ
subplot('position',[0.15 0.58 0.7 0.4])
mesh(x,t,usol), view(-60,55)
xlabel x, ylabel t, zlabel u
axis([-1 1 0 100 -1 round(max(usol(:)))])
subplot('position',[0.15 0.08 0.7 0.4])
X=L/2:-0.02:-L/2;
u=interp2(x,t,usol,X,t,'cubic');
mesh(X,t,u), view(-60,55)
xlabel x, ylabel t, zlabel u
axis([-1 1 0 100 -1 round(max(u(:)))])





colormap([0 0 0])
print -dtiff -r600 11.tif