%《Matlab微分方程高效解法：谱方法原理与实现》随书代码  机械工业出版社  张晓 编著
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
        %先以覆盖模式写入指定的gif文件
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.1);
    else
        %再以追加模式将每一帧写入gif文件
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.1);
	end
end