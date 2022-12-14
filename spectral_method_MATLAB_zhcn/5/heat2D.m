%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function du=heat2D(t,u,dummy,N,D2,BCx,BCy)
u=reshape(u,N+1,N+1);
du=D2*u+u*D2';
du([1 N+1],:)=BCy*du(2:N,:);
du(:,[1 N+1])=du(:,2:N)*BCx';
du=du(:);