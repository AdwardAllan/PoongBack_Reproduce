%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function dw=advection_diffusion(t,w,dummy,N,D,D2,K2,v)
w=reshape(w,N,N); wt=fft2(w);
psi=ifft2(wt./(-K2));
dw=reshape(v*(D2*w+w*D2')-(psi*D').*(D*w)+(D*psi).*(w*D'),N^2,1);
