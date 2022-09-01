%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function duvt=wave2D(t,uvt,dummy,N,K2,a)
ut=uvt(1:N^2); vt=uvt(N^2+[1:N^2]);
duvt=[vt; -a^2*K2.*ut];
