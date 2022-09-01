%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function deuvt=shallow_water(t,euvt,dummy,kX,kY,N,g)
et=euvt(1:N^2); ut=euvt(N^2+[1:N^2]); vt=euvt(2*N^2+[1:N^2]);
et=reshape(et,N,N); ut=reshape(ut,N,N); vt=reshape(vt,N,N);
e=ifft2(et); u=ifft2(ut); v=ifft2(vt);
deuvt=[reshape(-i*kX.*fft2(e.*u)-i*kY.*fft2(e.*v),N^2,1);
    reshape(-fft2(v.*ifft2(i*kY.*ut)+u.*ifft2(i*kX.*ut))-g*i*kX.*et,N^2,1);
    reshape(-fft2(u.*ifft2(i*kX.*vt)+v.*ifft2(i*kY.*vt))-g*i*kY.*et,N^2,1)];