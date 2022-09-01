%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function duv=schnakenberg(t,uv,dummy,D2,N,gamma,a,b,d)
u=uv(1:N^2); v=uv(N^2+1:end);
u=reshape(u,N,N); v=reshape(v,N,N);
duv=[reshape((D2*u+u*D2')+gamma*(a-u+u.^2.*v),N^2,1);
    reshape(d*(D2*v+v*D2')+gamma*(b-u.^2.*v),N^2,1)];