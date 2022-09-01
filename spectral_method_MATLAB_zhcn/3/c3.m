%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
L=80; N=256;
x=L/N*[-N/2:N/2-1];
k=(2*pi/L)*[0:N/2-1 -N/2:-1].';
%��ʼ����
u=2*sech(x); ut=fft(u);
vt=zeros(1,N); uvt=[ut vt];
%���
a=1; t=0:0.5:20;
[t,uvtsol]=ode45('wave1D',t,uvt,[],N,k,a);
usol=ifft(uvtsol(:,1:N),[],2);
%��ͼ
p=[1 11 21 41];
for n=1:4
    subplot(5,2,n)
    plot(x,usol(p(n),:),'k','LineWidth',1.5), xlabel x, ylabel u
    title(['t=' num2str(t(p(n)))]), axis([-L/2 L/2 0 2])
end
subplot(5,2,5:10)
waterfall(x,t,usol), view(10,45)
xlabel x, ylabel t, zlabel u, axis([-L/2 L/2 0 t(end) 0 2])



colormap([0 0 0])
print -dtiff -r600 3.tif
