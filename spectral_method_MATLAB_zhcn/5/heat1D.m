%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function du=heat1D(t,u,dummy,N,D2,BC)
du=D2*u;
du([1 N+1])=BC*du(2:N);