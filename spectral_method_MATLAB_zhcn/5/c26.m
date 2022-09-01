%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=2; N=20; h=0.1;
%�����б�ѩ���󵼾���
[D,x]=cheb(N); D=D/(L/2);
D2=D^2; x=L/2*x; y=x;
%��ʼ����
[X,Y]=meshgrid(x,y);
u=(1+cos(pi*X)).*(1+cos(pi*Y));
%�߽�����
BCx=-(h*D([1 N+1],[1 N+1])+[1 0;0 0])\(h*D([1 N+1],2:N));
BCy=-D([1 N+1],[1 N+1])\D([1 N+1],2:N);
%���
t=[0 0.05 0.2 4];
[t,usol]=ode45('heat2D',t,u(:),[],N,D2,BCx,BCy);
%��ͼ
for n=1:4
    subplot(2,2,n)
    u=reshape(usol(n,:),N+1,N+1);
    surfl(x,y,u), shading interp
    axis([-1 1 -1 1 0 4]), view(15,15)
    xlabel x, ylabel y, zlabel u
    title(['t=' num2str(t(n))])
    %���
    E=h*u*D'+u; max(abs(E(:,1)))
end





colormap(gray)
print -dtiff -r600 26.tif