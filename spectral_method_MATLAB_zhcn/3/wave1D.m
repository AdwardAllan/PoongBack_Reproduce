%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function duvt=wave1D(t,uvt,dummy,N,k,a)
ut=uvt(1:N); vt=uvt(N+[1:N]);
duvt=[vt; -a^2*(k).^2.*ut];