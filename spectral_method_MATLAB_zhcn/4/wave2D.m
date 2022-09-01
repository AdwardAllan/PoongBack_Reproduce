%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function duv=wave2D(t,uv,dummy,N,D2,a)
u=reshape(uv(1:N^2),N,N); v=uv(N^2+[1:N^2]);
duv=[v; reshape(a^2*D2*u+a^2*u*D2',N^2,1)];