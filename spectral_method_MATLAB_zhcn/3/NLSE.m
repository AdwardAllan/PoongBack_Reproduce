%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function dut=NLSE(t,ut,dummy,k)
u=ifft(ut);
dut=-(i/2)*(k.^2).*ut+i*fft((abs(u).^2).*u);