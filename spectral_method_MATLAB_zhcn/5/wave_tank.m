%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function duv=wave_tank(t,uv,dummy,Nx,Ny,D2x,D2y,BCy)
u=reshape(uv(1:end/2),Ny+1,Nx);
v=reshape(uv(end/2+1:end),Ny+1,Nx);
%ŵ�����߽�����
v([1 Ny+1],:)=BCy*v(2:Ny,:);
duv=[v(:); reshape(u*D2x'+D2y*u,Nx*(Ny+1),1)];
