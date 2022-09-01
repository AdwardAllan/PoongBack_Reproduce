%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function dut=KdV(t,ut,dummy,k)
u=ifft(ut);
dut=-(i*k).*ut-12*fft(u.*ifft(i*k.*ut))-(i*k).^3.*ut;