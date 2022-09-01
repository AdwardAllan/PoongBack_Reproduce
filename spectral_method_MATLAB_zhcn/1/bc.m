%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function res=bc(ua,ub)
%边界条件boundary condition
res=[ua(1)-1; ub(1)+1-pi/exp(pi)];