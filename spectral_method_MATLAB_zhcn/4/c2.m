%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=20; N=64;
x=L/N*[-N/2:N/2-1];
%�������󵼾���
h=2*pi/N;
column=[-pi^2/(3*h^2)-1/6 -0.5*(-1).^(1:N-1)./sin(h*(1:N-1)/2).^2];
D2=(2*pi/L)^2*toeplitz(column);
%����ֵ�ͱ���̬
[V,D]=eig(-D2+diag(x.^2));
eigenvalues=diag(D);
for n=1:25
    subplot(5,5,n), plot(x,V(:,n),'k','LineWidth',1.5)
    title(num2str(eigenvalues(n)))
end






print -dtiff -r600 2.tif