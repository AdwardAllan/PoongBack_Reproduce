%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function du=master(z,u,dummy,D2,beta2,gamma,g0,tau,alpha0,P0)
du=-i/2*(beta2+i*g0*tau)*D2*u+i*gamma*abs(u).^2.*u+...
    1/2*(g0-alpha0./(1+abs(u).^2/P0)).*u;