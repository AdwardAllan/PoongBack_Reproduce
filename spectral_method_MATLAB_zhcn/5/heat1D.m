%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function du=heat1D(t,u,dummy,N,D2,BC)
du=D2*u;
du([1 N+1])=BC*du(2:N);