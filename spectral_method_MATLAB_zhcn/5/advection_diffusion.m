%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function dw=advection_diffusion(t,w,dummy,N,D,D2,LA_inv,v)
psi=reshape(LA_inv*w,N-1,N-1);
w=reshape(w,N-1,N-1);
dw=reshape(v*(D2*w+w*D2')-(psi*D').*(D*w)+(D*psi).*(w*D'),(N-1)^2,1);