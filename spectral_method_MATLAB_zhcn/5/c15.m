%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2; N=16;
%构造切比雪夫求导矩阵
[D,x]=cheb(N); D=D/(L/2); D2=D^2;
D2=D2(2:N,2:N); x=L/2*x;
%求解
[V,E]=eig(D2); E=diag(E);
[eigenvalues,i]=sort(E,'descend');
V=[zeros(1,N-1);V(:,i);zeros(1,N-1)];
%画图
x2=-1:0.01:1;
for m=1:12
    subplot(4,3,m)
    plot(x2,polyval(polyfit(x,V(:,m),N),x2),'k', ...
        x,V(:,m),'.r','MarkerSize',15,'LineWidth',1.5)
    n=sqrt(-eigenvalues(m)*4/pi^2);
    title(['-(' num2str(n) '\pi)^2/4']);
end



print -dtiff -r600 15.tif