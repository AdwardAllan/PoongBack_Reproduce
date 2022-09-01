%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function dut=burgers(t,ut,dummy,N,kX,kY,K2,v)
ut=reshape(ut,N,N); u=ifft2(ut);
dut=reshape(-v*K2.*ut-fft2(u.*ifft2(i*(kX+kY).*ut)),N^2,1);
