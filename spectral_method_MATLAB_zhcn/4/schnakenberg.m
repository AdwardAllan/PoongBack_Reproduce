%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function duv=schnakenberg(t,uv,dummy,D2,N,gamma,a,b,d)
u=uv(1:N^2); v=uv(N^2+1:end);
u=reshape(u,N,N); v=reshape(v,N,N);
duv=[reshape((D2*u+u*D2')+gamma*(a-u+u.^2.*v),N^2,1);
    reshape(d*(D2*v+v*D2')+gamma*(b-u.^2.*v),N^2,1)];