%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=2; N=32;
%�����б�ѩ���󵼾���
[D,x]=cheb(N); D=D/(L/2);
D2=D^2; x=L/2*x;
for m=1:2
    if m==1
        u=sech(x);
        %�����ľ�ȷ��
        du_exact(:,1)=-u.*tanh(x);
        du_exact(:,2)=u-2*u.^3;
    else
        u=exp(sin(2*x));
        %�����ľ�ȷ��
        du_exact(:,1)=2*cos(2*x).*u;
        du_exact(:,2)=4*u.*(cos(2*x).^2-sin(2*x));
    end
    %�б�ѩ���׷�����
    du_cheb(:,1)=D*u;
    du_cheb(:,2)=D2*u;
    error=max(abs(du_cheb-du_exact));
    titles={'u(x)=sech(x)','u(x)=e^{sin(2x)}'};
    labels={'u''(x)','u''''(x)'};
    subplot(3,2,m)
    plot(x,u,'k',x,u,'.r','MarkerSize',13,'LineWidth',1.5)
    title(titles(m)), xlabel x, ylabel u(x)
    for n=1:2
        subplot(3,2,2*n+m)
        plot(x,du_exact(:,n),'k',x,du_cheb(:,n), ...
            '.r','MarkerSize',13,'LineWidth',1.5)
        title(['Error_{max}=' num2str(error(n))])
        xlabel x, ylabel(labels(n))
    end    
end




print -dtiff -r600 4.tif