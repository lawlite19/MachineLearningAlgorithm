function  plotData( X,y )
%	二分类作图函数
%   X包含两列（x1,x2），y中为0和1

figure;     %创建一个新图
hold on; 

%% 
pos = find(y==1);   %找到y中为1的
neg = find(y==0);   %找到y中为0的

plot(X(pos,1),X(pos,2),'k+','LineWidth',2,'MarkerSize',7);      %作x1,x2的散点图，相当于x1,x2,y三维图在xoy面的投影
plot(X(neg,1),X(neg,2),'ko','MarkerFaceColor','y','MarkerSize',7);

hold off;

end

