%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function duvt=schnakenberg(t,uvt,dummy,K2,N,gamma,a,b,d)
ut=uvt(1:N^2); vt=uvt(N^2+1:end);
ut=reshape(ut,N,N); vt=reshape(vt,N,N);
u=ifft2(ut); v=ifft2(vt);
duvt=[reshape(-K2.*ut+gamma*fft2(a-u+(u.^2).*v),N^2,1);
    reshape(-d*K2.*vt+gamma*fft2(b-(u.^2).*v),N^2,1)];