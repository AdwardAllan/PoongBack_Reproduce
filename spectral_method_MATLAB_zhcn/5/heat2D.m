%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function du=heat2D(t,u,dummy,N,D2,BCx,BCy)
u=reshape(u,N+1,N+1);
du=D2*u+u*D2';
du([1 N+1],:)=BCy*du(2:N,:);
du(:,[1 N+1])=du(:,2:N)*BCx';
du=du(:);