%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=4; N=40;
%�����б�ѩ���󵼾���
[D,x]=cheb(N); D=D/(L/2);
D2=D^2; D2=D2(2:N,2:N); x=L/2*x;
%���
[V,E]=eig(D2,diag(x(2:N))); E=diag(E);
i=find(E>0); E=E(i); V=V(:,i);
[eigenvalues,i]=sort(E); V=V(:,i);
%��ͼ
x2=-2:0.01:2;
for n=1:9
    subplot(3,3,n)
    plot(x2,polyval(polyfit(x,[0;V(:,n);0],N),x2),'k','LineWidth',1.5)    
    title(num2str(eigenvalues(n)))
    axis([-2 2 -1.1 1.1]), xlabel x, ylabel u
end



print -dtiff -r600 27.tif