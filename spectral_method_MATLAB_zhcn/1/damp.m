%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function du=damp(t,u,dummy,beta,omega)
du=[u(2); -2*beta*u(2)-omega^2*u(1)];