%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function duv=wave1D(t,uv,dummy,N,D2,a)
u=uv(1:N); v=uv(N+[1:N]);
duv=[v; a^2*D2*u];