%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=2; N=16;
%�����б�ѩ���󵼾���
[D,x]=cheb(N); D=D/(L/2); D2=D^2;
D2=D2(2:N,2:N); x=L/2*x;
%���
[V,E]=eig(D2); E=diag(E);
[eigenvalues,i]=sort(E,'descend');
V=[zeros(1,N-1);V(:,i);zeros(1,N-1)];
%��ͼ
x2=-1:0.01:1;
for m=1:12
    subplot(4,3,m)
    plot(x2,polyval(polyfit(x,V(:,m),N),x2),'k', ...
        x,V(:,m),'.r','MarkerSize',15,'LineWidth',1.5)
    n=sqrt(-eigenvalues(m)*4/pi^2);
    title(['-(' num2str(n) '\pi)^2/4']);
end



print -dtiff -r600 15.tif