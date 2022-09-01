%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function dut=NLSE(t,ut,dummy,k)
u=ifft(ut);
dut=-(i/2)*(k.^2).*ut+i*fft((abs(u).^2).*u);