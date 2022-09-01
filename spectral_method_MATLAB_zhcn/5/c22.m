%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2; N=25;
%二维双调和算符矩阵
[D,x]=cheb(N); x=L/2*x; y=x; 
D=D/(L/2); D2=D^2; D2=D2(2:N,2:N);
D4=(diag(1-x.^2)*D^4-diag(8*x)*D^3-12*D^2)*diag([1./(1-x.^2)]);
D4=D4(2:N,2:N); I=eye(N-1);
LA2=kron(D4,I)+2*kron(D2,I)*kron(I,D2)+kron(I,D4);
%求解
[V,D]=eig(LA2); D=diag(real(D));
[eigenvalues,i]=sort(D); V=real(V(:,i));
%画图
x2=-1.08:0.08:1.08; y2=x2;
[py,px]=meshgrid(0.8:-0.2:0,0:0.2:0.8);
for n=1:25
    subplot('position',[px(n)+0.02 py(n)+0.01 0.15 0.2]);
    v=zeros(N+1,N+1); v(2:N,2:N)=reshape(V(:,n),N-1,N-1);
    v2=interp2(x,y,v,x2,y2','cubic');
    mesh(x2,y2,v2), hold on, axis off
    contour3(x2,y2,v2-0.25,[-0.25-eps -0.25+eps])
    text(0.7,0,0.13,sprintf('%.1f',eigenvalues(n)))
    axis([-1 1 -1 1 -0.25 0.1])
end





colormap([0 0 0])
print -dtiff -r600 22.tif