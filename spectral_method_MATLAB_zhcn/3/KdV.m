%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function dut=KdV(t,ut,dummy,k)
u=ifft(ut);
dut=-(i*k).*ut-12*fft(u.*ifft(i*k.*ut))-(i*k).^3.*ut;