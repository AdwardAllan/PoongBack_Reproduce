%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
beta=1; omega=10; xspan=[0 5];
[x,usol]=ode45('damp',xspan,[1 0],[],beta,omega);
plot(x,usol(:,1),'k','LineWidth',1.5)
xlabel x, ylabel u




print -dtiff -r600 3.tif