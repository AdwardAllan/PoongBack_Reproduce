%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2;
for m=1:2
    N=2^6*m;
    for n=1:2
        if n==1
            x=L/N*[-N/2:N/2];
        else
            x=L/2*cos(pi*[0:N]/N);
        end
        y=1./(1+25*x.^2); x2=-L/2:0.01:L/2;
        y2=polyval(polyfit(x,y,N),x2);
        error=max(abs(y2-1./(1+25*x2.^2)));
        subplot(2,2,n+2*(m-1))
        plot(x2,y2,'k',x,y,'.r','MarkerSize',15,'LineWidth',1.5)
        axis([-1.1 1.1 -0.1 1.1]), xlabel x, ylabel y
        title(['N=' num2str(N) ', Error_{max}=' num2str(error)])
    end
end






% print -dtiff -r600 2.tif