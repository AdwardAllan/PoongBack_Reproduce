%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function dw=advection_diffusion(t,w,dummy,N,D,D2,LA_inv,v)
psi=reshape(LA_inv*w,N-1,N-1);
w=reshape(w,N-1,N-1);
dw=reshape(v*(D2*w+w*D2')-(psi*D').*(D*w)+(D*psi).*(w*D'),(N-1)^2,1);