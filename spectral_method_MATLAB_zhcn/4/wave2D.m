%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function duv=wave2D(t,uv,dummy,N,D2,a)
u=reshape(uv(1:N^2),N,N); v=uv(N^2+[1:N^2]);
duv=[v; reshape(a^2*D2*u+a^2*u*D2',N^2,1)];