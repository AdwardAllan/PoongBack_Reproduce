%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
[T,U]=ode15s(@vdp,[0 3000],[2 0]);
plot(T,U(:,1),'k','LineWidth',1.5)
xlabel x, ylabel u_1







print -dtiff -r600 2.tif