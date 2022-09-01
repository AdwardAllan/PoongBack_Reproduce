%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=4; N=18; h=2;
%�����б�ѩ���󵼾����޸�
[D,x]=cheb(N); D=D/(L/2); x=L/2*x;
D2=D^2; I=eye(N+1);
D2([1 N+1],:)=h*D([1 N+1],:)+I([1 N+1],:);
%���
f=exp(x(1:N+1)); f([1 N+1])=1; u=D2\f;
%��ͼ
exact=exp(x)+3/4*(exp(-2)-exp(2))*x+1-3*exp(-2);
error=abs(exact-u);
subplot(2,2,1)
plot(x,exact,'k',x,u,'.r','MarkerSize',16,'LineWidth',1.5)
title(['Error_{max}=' num2str(max(error))]), xlabel x, ylabel u
subplot(2,2,2)
plot(x,error,'.r','MarkerSize',16)
xlabel x, ylabel Error






print -dtiff -r600 23.tif