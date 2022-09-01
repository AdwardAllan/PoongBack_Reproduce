%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=10; N=32;
x=L/N*[-N/2:N/2-1]; y=x;
%构造谱求导矩阵
h=2*pi/N;
column=[-pi^2/(3*h^2)-1/6 -0.5*(-1).^(1:N-1)./sin(h*(1:N-1)/2).^2];
D2=(2*pi/L)^2*toeplitz(column);
%求本征值和本征态
I=eye(N); L=kron(D2,I)+kron(I,D2);
x2=kron(diag(x.^2),I); y2=kron(I,diag(y.^2));
[V,D]=eig(-L+x2+y2); eigenvalues=diag(D);
%画图
[py,px]=meshgrid(0.75:-0.25:0,0:0.25:0.75);
figure(1)
for n=1:16
    subplot('position',[px(n)+0.04 py(n)+0.04 0.17 0.17])
    mesh(x,y,reshape(V(:,n),N,N))
    axis([-4 4 -4 4 -0.1 0.1]), title(num2str(eigenvalues(n)))
end
figure(2)
for n=1:16
    subplot('position',[px(n)+0.04 py(n)+0.04 0.17 0.17])
    contour(x,y,reshape(V(:,n),N,N),[-0.03 0.03])
    axis([-4 4 -4 4]), axis square, title(num2str(eigenvalues(n)))
end




colormap([0 0 0]);
print -dtiff -r600 3_2.tif
close
colormap([0 0 0]);
print -dtiff -r600 3_1.tif