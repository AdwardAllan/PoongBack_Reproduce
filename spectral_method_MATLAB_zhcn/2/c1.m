%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2; N=50; h=L/N;
x=h*[-N/2:N/2-1]'; 
u=exp(sin(pi*x));
%导数的精确解
du_exact(:,1)=pi*cos(pi*x).*u;
du_exact(:,2)=pi*cos(pi*x).*u;
du_exact(:,3)=pi^2*(cos(pi*x).^2-sin(pi*x)).*u;
%1阶向前差商
e=ones(N,1);
D1_forword=spdiags([-e e],[0 1],N,N);
D1_forword(N,1)=1;
du(:,1)=1/h*D1_forword*u;
%1阶中心差商
D1_center=spdiags([-e e],[-1 1],N,N);
D1_center(1,N)=-1; D1_center(N,1)=1;
du(:,2)=1/(2*h)*D1_center*u;
%2阶中心差商
D2=spdiags([e -2*e e],[-1 0 1],N,N);
D2(1,N)=1; D2(N,1)=1;
du(:,3)=1/(h^2)*D2*u;
%误差
error=max(abs(du-du_exact));
%画图
labels={'u''(x)','u''(x)','u''''(x)'};
titles={'1阶向前差商','1阶中心差商','2阶中心差商'};
for n=1:4
    subplot(2,2,n)
    if n==1
        plot(x,u,'k','LineWidth',1.5)
        xlabel x, ylabel u(x), title('u(x)=e^{sin(\pix)}')
    else
        plot(x,du_exact(:,n-1),'k',x,du(:,n-1),'.r' ...
            ,'MarkerSize',13,'LineWidth',1.5)
        title(['Error_{max}=' num2str(error(n-1))])
        xlabel x, ylabel(labels(n-1))
        text(-1,min(du(:,n-1)),titles(n-1),'FontWeight','bold')
    end
end

print -dtiff -r600 1.tif