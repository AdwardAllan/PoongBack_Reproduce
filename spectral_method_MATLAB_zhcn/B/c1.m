%��Matlab΢�ַ��̸�Ч�ⷨ���׷���ԭ����ʵ�֡��������  ��е��ҵ������  ���� ����
clear all; close all;
x=-1:0.02:1; y=x;
[X,Y]=meshgrid(x,y);
filename='test.gif';
for a=1:10
    u=a*exp(-10*(X.^2+Y.^2));
    mesh(x,y,u), axis([-1 1 -1 1 0 10]), drawnow
    im=frame2im(getframe(gcf));
    [A,map]=rgb2ind(im,256);
    if a==1
        %���Ը���ģʽд��ָ����gif�ļ�
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.1);
    else
        %����׷��ģʽ��ÿһ֡д��gif�ļ�
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.1);
	end
end