function plotData( X,y )
%	做二维散点图
%   
pos = find(y==1);   %找到y==1的行号
neg = find(y==0);   

plot(X(pos,1),X(pos,2),'k+','LineWidth',1,'MarkerSize',7);
hold on;
plot(X(neg,1),X(neg,2),'ko','MarkerFaceColor','y','MarkerSize',7);
hold off;

end

