%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2; N=5;
%构造拉普拉斯算符矩阵
[D,x]=cheb(N); D=D/(L/2); D2=D^2;
I=eye(N+1); LA=kron(I,D2)+kron(D2,I);
x=L/2*x; y=x; [x,y]=meshgrid(x,y);
X=x(:); Y=y(:);
subplot(2,3,1), spy(LA,'k',8)
title('kron(I_{N+1},D^2_N)+kron(D^2_N,I_{N+1})')
%修改拉普拉斯算符矩阵
bound=find(abs(X)==L/2|abs(Y)==L/2);
LA(bound,:)=0;
subplot(2,3,2), spy(LA,'k',8)
title('L(bound,:)=0')
LA(bound,bound)=eye(4*N);
subplot(2,3,3), spy(LA,'k',8)
title('L(bound,bound)=eye(4*N)')






print -dtiff -r600 9.tif