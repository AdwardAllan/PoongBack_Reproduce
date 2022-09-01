%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=2; N=20;
%�����б�ѩ���󵼾���
[D,x]=cheb(N); D=D/(L/2);
D2=D^2; x=L/2*x; y=x;
[X,Y]=meshgrid(x,y);
%��ʼ����
u=max(0,1-sqrt((X-1).^2+Y.^2));
%���
t=[0 0.001 0.02 0.5];
[t,usol]=ode45('heat2',t,u(:),[],N,D2);
%��ͼ
for n=1:4
    subplot(2,2,n)
    surfl(x,y,reshape(usol(n,:),N+1,N+1))
    axis([-1 1 -1 1 0 1]), shading interp
    xlabel x, ylabel y, zlabel u
    title(['t=' num2str(t(n))]);
end





colormap(gray)
print -dtiff -r600 14.tif