%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function du=heat2(t,u,dummy,N,D2)
u=reshape(u,N+1,N+1);
du=D2*u+u*D2';
du([1 N+1],:)=0; du(:,[1 N+1])=0;
du=du(:);