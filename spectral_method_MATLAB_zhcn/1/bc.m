%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
function res=bc(ua,ub)
%�߽�����boundary condition
res=[ua(1)-1; ub(1)+1-pi/exp(pi)];