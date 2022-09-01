%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=2; N=32;
x=L/N*[-N/2:N/2-1];
k=2*pi/L*[0:N/2-1 -N/2:-1];
u=exp(sin(pi*x)); ut=fft(u);
%�����ľ�ȷ��
du_exact(:,1)=pi*cos(pi*x).*u;
du_exact(:,2)=pi^2*(cos(pi*x).^2-sin(pi*x)).*u;
du_exact(:,3)=pi^3*cos(pi*x).*(cos(pi*x).^2-3*sin(pi*x)-1).*u;
%�׷�����
du_Fourier(:,1)=ifft(i*k.*ut);
du_Fourier(:,2)=ifft((i*k).^2.*ut);
du_Fourier(:,3)=ifft((i*k).^3.*ut);
error=max(abs(du_exact-du_Fourier));
%��ͼ
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





print -dtiff -r600 2.tif