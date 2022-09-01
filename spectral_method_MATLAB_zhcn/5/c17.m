%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=4; N=17;
%�����б�ѩ���󵼾���
[D,x]=cheb(N); D=D/(L/2); x=L/2*x;
D2=D^2; D2(1,:)=D(1,:);
D2=D2(1:N,1:N);
%���
f=exp(x(1:N)); f(1)=0;
u=D2\f; u=[u;0];
exact=exp(x)-exp(2)*x-exp(-2)-2*exp(2);
error=abs(exact-u);
%��ͼ
subplot(2,2,1)
plot(x,exact,'k',x,u,'.r','MarkerSize',16,'LineWidth',1.5)
title(['Error_{max}=' num2str(max(error))]), xlabel x, ylabel u
subplot(2,2,2)
plot(x,error,'.r','MarkerSize',16)
xlabel x, ylabel Error






print -dtiff -r600 17.tif