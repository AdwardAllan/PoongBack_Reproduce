%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
x=linspace(0,pi,20);
solinit=bvpinit(x,[2 2]);
%bvp4c���ֵ����
sol=bvp4c(@shoot2,@bc,solinit);
%�ӽṹ��sol��ȡָ��λ�õ���ֵ���
u=deval(sol,x);
%������
u_exact=cos(x)+x.*exp(-x);
%��ͼ
plot(x,u(1,:),'+k',x,u_exact,'k','MarkerSize',10,'LineWidth',1.5)
set(gca,'Fontsize',16), xlabel x, ylabel u
legend('bvp4c','������',0), axis([0 pi -1 1.5])


print -dtiff -r600 5.tif