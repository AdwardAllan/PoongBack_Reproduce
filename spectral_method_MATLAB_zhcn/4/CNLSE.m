%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
function du=CNLSE(z,u,dummy,N,D2,k12,k23,beta2,gamma,g,tau,a1,a2,a3)
u1=u(1:N); u2=u(N+[1:N]); u3=u(2*N+[1:N]);
du=[i*k12*u2-i/2*(beta2+i*g*tau)*D2*u1+...
    i*gamma*abs(u1).^2.*u1+1/2*(g-a1).*u1;
    i*(k12*u1+k23*u3)-a2/2*u2;
    i*k23*u2-a3/2*u3];