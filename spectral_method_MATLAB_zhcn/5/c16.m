%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2; N=20;
%构造拉普拉斯算符矩阵
[D,x]=cheb(N); D=D/(L/2); D2=D^2;
D2=D2(2:N,2:N); x=L/2*x; y=x;
I=eye(N-1); LA=kron(I,D2)+kron(D2,I);
%求解
[V,E]=eig(LA); E=diag(E);
[eigenvalues,i]=sort(real(E),'descend'); V=V(:,i);
%画图
x2=-L/2:0.08:L/2; y2=x2;
[py,px]=meshgrid(0.75:-0.25:0,0:0.25:0.75);
for n=1:16
    subplot('position',[px(n)+0.04 py(n)+0.01 0.17 0.22]);
    v=zeros(N+1); v(2:N,2:N)=reshape(V(:,n),N-1,N-1);
    v2=interp2(x,y,v,x2,y2','cubic');
    mesh(x2,y2,v2), hold on, view(35,20), axis off
    axis([-1.1 1.1 -1.1 1.1 -0.2 0.13]);
    contour3(x2,y2,v2-0.2,[-0.2-eps -0.2+eps])
    m=-eigenvalues(n)*4/pi^2;
    text(0,-2.4,0.3,['-' num2str(m) '\pi^2/4']);
end




colormap([0 0 0])
print -dtiff -r600 16.tif