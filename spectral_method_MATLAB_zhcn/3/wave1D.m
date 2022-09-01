%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function duvt=wave1D(t,uvt,dummy,N,k,a)
ut=uvt(1:N); vt=uvt(N+[1:N]);
duvt=[vt; -a^2*(k).^2.*ut];