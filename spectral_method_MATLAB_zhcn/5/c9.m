%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=2; N=5;
%����������˹�������
[D,x]=cheb(N); D=D/(L/2); D2=D^2;
I=eye(N+1); LA=kron(I,D2)+kron(D2,I);
x=L/2*x; y=x; [x,y]=meshgrid(x,y);
X=x(:); Y=y(:);
subplot(2,3,1), spy(LA,'k',8)
title('kron(I_{N+1},D^2_N)+kron(D^2_N,I_{N+1})')
%�޸�������˹�������
bound=find(abs(X)==L/2|abs(Y)==L/2);
LA(bound,:)=0;
subplot(2,3,2), spy(LA,'k',8)
title('L(bound,:)=0')
LA(bound,bound)=eye(4*N);
subplot(2,3,3), spy(LA,'k',8)
title('L(bound,bound)=eye(4*N)')






print -dtiff -r600 9.tif