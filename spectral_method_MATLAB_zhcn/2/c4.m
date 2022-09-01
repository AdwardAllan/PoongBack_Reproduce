%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
a=1; h=0.05; x=[0:h:1];
tau=0.05; t=[0:tau:1];
s=a*tau/h; 
N=length(x)-1; M=length(t)-1;
[T X]=meshgrid(t,x);
%�������
e=s^2*ones(N-1,1);
A=spdiags([e 2*(1-e) e],[-1 0 1],N-1,N-1);
%���ó�ʼ�����ͱ߽�����
u=zeros(N+1,M+1);
u(:,1)=0; u(:,2)=tau*x;
u(1,:)=0; u(end,:)=sin(t);
%���޲��
for n=2:M
    u(2:N,n+1)=A*u(2:N,n)-u(2:N,n-1)+ ...
        tau^2*(T(2:N,n).^2-X(2:N,n).^2).*sin(X(2:N,n).*T(2:N,n));
    u(2,n+1)=u(2,n+1)+s^2*u(1,n);
    u(N,n+1)=u(N,n+1)+s^2*u(end,n);
end
%��ͼ
subplot(2,2,1)
mesh(t,x,u), view(20,40), xlabel t, ylabel x, zlabel u
subplot(2,2,2)
%�����������
mesh(t,x,u-sin(X.*T)), view(20,40), axis([0 1 0 1 0 6e-5])
xlabel t, ylabel x, zlabel Error



colormap([0 0 0])
print -dtiff -r600 4.tif