%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
a=1; h=0.05; x=[0:h:1];
tau=0.00125; t=[0:tau:1];
r=a*tau/h^2;
N=length(x)-1; M=length(t)-1;
%�������
e=r*ones(N-1,1);
A=spdiags([e 1-2*e e],[-1 0 1],N-1,N-1);
%���ó�ʼ�����ͱ߽�����
u=zeros(N+1,M+1);
u(:,1)=exp(x);
u(1,:)=exp(t); 
u(end,:)=exp(1+t);
%���޲��
for n=1:M
    u(2:N,n+1)=A*u(2:N,n);
    u(2,n+1)=u(2,n+1)+r*u(1,n);
    u(N,n+1)=u(N,n+1)+r*u(end,n);
end
%��ͼ
subplot(2,2,1)
mesh(t(1:20:end),x,u(:,1:20:end))
xlabel t, ylabel x, zlabel u
subplot(2,2,2)
[T X]=meshgrid(t(1:20:end),x);
%�����������
mesh(t(1:20:end),x,exp(X+T)-u(:,1:20:end))
xlabel t, ylabel x, zlabel Error



colormap([0 0 0])
print -dtiff -r600 3.tif