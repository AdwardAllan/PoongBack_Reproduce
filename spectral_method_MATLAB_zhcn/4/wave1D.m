%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function duv=wave1D(t,uv,dummy,N,D2,a)
u=uv(1:N); v=uv(N+[1:N]);
duv=[v; a^2*D2*u];