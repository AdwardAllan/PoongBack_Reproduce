%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=2; N=40;
%����������˹�������
[D,x]=cheb(N); D=D/(L/2); D2=D^2;
I=eye(N+1); LA=kron(I,D2)+kron(D2,I);
x=L/2*x; y=x; [x,y]=meshgrid(x,y);
X=x(:); Y=y(:);
%�޸�������˹�������
bound=find(abs(X)==L/2|abs(Y)==L/2);
LA(bound,:)=0; LA(bound,bound)=eye(4*N);
%��f(x)����߽�����
f=6*(X+1).*(Y+0.1).^3;
f(bound)=(Y(bound)==L/2).*sinc(4*X(bound))/2+...
    (X(bound)==L/2).*max(0,(0.5-abs(Y(bound))));
%���
u=reshape(LA\f,N+1,N+1);
%��ͼ
x2=-L/2:0.04:L/2; y2=x2;
u2=interp2(x,y,u,x2,y2','cubic');
mesh(x2,y2,u2)
view(-60,30), axis([-1 1 -1 1 -0.25 0.5])
xlabel x, ylabel y, zlabel u




colormap([0 0 0])
print -dtiff -r600 10.tif
