%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
n=0; m(1)=1; alpha=0; beta0=-2;
while n==0||abs(beta(n)-beta0)>=1e-6
    n=n+1;
    %在猜测的初始条件下求解初值问题
    [x,usol]=ode45('shoot',[0 4],[alpha m(n)]);
    beta(n)=usol(end,1);
    if n==1
        m(2)=m(1)-0.1;
    else
        %线性插值法修正m的取值
        m(n+1)=m(n-1)+(m(n)-m(n-1))*(beta0-beta(n-1))/(beta(n)-beta(n-1));
    end
end
plot(x,usol(:,1),'k','LineWidth',1.5), xlabel x, ylabel u


print -dtiff -r600 4.tif