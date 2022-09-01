%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
clear all; close all;
L=2; N=32;
x=L/N*[-N/2:N/2-1]'; 
%构造谱求导矩阵
h=2*pi/N; 

column=[0 0.5*(-1).^(1:N-1).*cot((1:N-1)*h/2)]';
D=(2*pi/L)*toeplitz(column,column([1 N:-1:2]));

column=[-pi^2/(3*h^2)-1/6 -0.5*(-1).^(1:N-1)./sin(h*(1:N-1)/2).^2];
D2=(2*pi/L)^2*toeplitz(column);

column=[0 (-1).^(1:N-1).*cot((1:N-1)*h/2).*( ...
    -pi^2/(2*h^2)+3/4*csc((1:N-1)*h/2).^2)]';
D3=(2*pi/L)^3*toeplitz(column,column([1 N:-1:2]));

%导数的精确解
u=exp(sin(pi*x));
du_exact(:,1)=pi*cos(pi*x).*u;
du_exact(:,2)=pi^2*(cos(pi*x).^2-sin(pi*x)).*u;
du_exact(:,3)=pi^3*cos(pi*x).*(cos(pi*x).^2-3*sin(pi*x)-1).*u;
%谱方法求导
du_Fourier(:,1)=D*u;
du_Fourier(:,2)=D2*u;
du_Fourier(:,3)=D3*u;
error=max(abs(du_exact-du_Fourier));
%画图
labels={'u''(x)','u''''(x)','u''''''(x)'};
for n=1:4
    subplot(2,2,n)
    if n==1
        plot(x,u,'k','LineWidth',1.5)
        xlabel x, ylabel u(x), title('u(x)=e^{sin(\pix)}')
    else
        plot(x,du_exact(:,n-1),'k',x,du_Fourier(:,n-1),'.r' ...
            ,'MarkerSize',13,'LineWidth',1.5)
        title(['Error_{max}=' num2str(error(n-1))])
        xlabel x, ylabel(labels(n-1))
    end
end





print -dtiff -r600 1.tif