function plotDecisionBoundary( theta,X,y )
%	画决策边界的函数
%   @符号处是要根据实际情况修改的地方

%% 先画出X1，X2的散点图
plotData(X(:,2:3),y);
hold on;

%% 画决策边界
if size(X,2) <= 3   %如果X只包含三列，说明边界为一条直线，根据theta(1),theta(2),theta(3)可直接画出
    plot_x = [min(X(:,2))-2,max(X(:,2))+2];         %直接可以根据两个点画出，找出两个点即可（-2是怕重复，可以去除）
    plot_y = -(theta(2).*plot_x+theta(1))./theta(3);%分界线的表达式
    plot(plot_x,plot_y);
    
    legend('y = 1', 'y = 0', '决策边界');
    axis([30,100,30,100]);      % @要显示的坐标范围，请修改
else    %若是多项式，需要画出决策边界，高度为0的线
    u = linspace(-1,1.5,50);   
    v = linspace(-1,1.5,50);
    %u = linspace(30,100,100);   %  数据的范围，表示30到100，分为100份  @根据实际的数据修改
    %v = linspace(30,100,100);   %   @根据实际的数据修改
    
    z = zeros(length(u),length(v)); 
    for i = 1:length(u) %遍历每个划分的点，计算对应的高
        for j = 1:length(v)
            z(i,j) = mapFeature(u(i),v(j))*theta;   %映射的多项式值*得到的theta
        end
    end
    z = z'; %需要转置一下

    contour(u,v,z,[0,0],'LineWidth',2); %画出z值为0的等高线
end
hold off;

end

