%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function du=allen_cahn(t,u,dummy,D2,epsilon)
du=epsilon*D2*u+u-u.^3;
du(1)=sin(2*t/5)/5;
du(end)=0;