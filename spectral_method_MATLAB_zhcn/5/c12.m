%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function du=allen_cahn(t,u,dummy,D2,epsilon)
du=epsilon*D2*u+u-u.^3;
du(1)=sin(2*t/5)/5;
du(end)=0;