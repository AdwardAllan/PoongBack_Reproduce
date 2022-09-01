%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=2*pi; N=64; h=2*pi/N;
x=L/N*[-N/2:N/2-1]; y=exp(x);
subplot(2,1,1)
plot(x-L,y,'k',x,y,'k',x+L,y,'k','LineWidth',1.5)
axis([-10 10 -5 25]), xlabel x, ylabel y
subplot(2,1,2)
x2=-3/2*L:0.01:3/2*L; interpolant=0;
for n=1:length(x)
    interpolant=interpolant+ ...
        y(n)*sin(pi*(x2-x(n))/h)./((2*pi/h)*tan((x2-x(n))/2));
end
plot(x2,interpolant,'k','LineWidth',1.5)
axis([-10 10 -5 25]), xlabel x, ylabel p(x)







print -dtiff -r600 1.tif