%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function duv=wave_tank(t,uv,dummy,Nx,Ny,D2x,D2y,BCy)
u=reshape(uv(1:end/2),Ny+1,Nx);
v=reshape(uv(end/2+1:end),Ny+1,Nx);
%诺依曼边界条件
v([1 Ny+1],:)=BCy*v(2:Ny,:);
duv=[v(:); reshape(u*D2x'+D2y*u,Nx*(Ny+1),1)];
