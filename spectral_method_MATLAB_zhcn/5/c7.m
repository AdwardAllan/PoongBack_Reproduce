%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2; N=5;
%构造切比雪夫求导矩阵
[D,x]=cheb(N); D=D/(L/2); D2=D^2;
I=eye(N+1); LA=kron(I,D2)+kron(D2,I);
subplot(2,3,1), spy(kron(I,D2),'k',8)
title('kron(I_{N+1},D^2_N)')
subplot(2,3,2), spy(kron(D2,I),'k',8)
title('kron(D^2_N,I_{N+1})')
subplot(2,3,3), spy(LA,'k',8)
title('kron(I_{N+1},D^2_N)+kron(D^2_N,I_{N+1})')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D2=D2(2:N,2:N);
I=eye(N-1); LA=kron(I,D2)+kron(D2,I);
subplot(2,3,4), spy(kron(I,D2),'k',10)
title('kron(I_{N-1},D^2_N(2:N,2:N))')
subplot(2,3,5), spy(kron(D2,I),'k',10)
title('kron(D^2_N(2:N,2:N),I_{N-1})')
subplot(2,3,6), spy(LA,'k',10)
title({['kron(I_{N-1},D^2_N(2:N,2:N))']; ...
    ['    +kron(D^2_N(2:N,2:N),I_{N-1})']})





print -dtiff -r600 7.tif