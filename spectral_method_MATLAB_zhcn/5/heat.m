%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function du=heat(t,u,dummy,N,D2)
u=reshape(u,N-1,N-1);
du=reshape(D2*u+u*D2',(N-1)^2,1);