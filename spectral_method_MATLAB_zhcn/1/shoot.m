%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function du=shoot(x,u)
du=[u(2); -abs(u(1))];