function idx = findClosestCentroids( X,initial_centroids )
%	对每个X中的数据，返回属于哪个类别K
%   

m = size(X,1);                  %数据条数
K = size(initial_centroids,1);  %类的总数
idx = zeros(m,1);               %要返回的每条数据属于哪个类

for i = 1:m        %遍历每条数据
    for j = 1:K    %遍历每个类中心
        idx(i,j) = (X(i,:)-initial_centroids(j,:))*(X(i,:)-initial_centroids(j,:))';    %计算每个点到中心的范数的平方
    end
end

[dummy idx] = min(idx,[],2);    %返回每行最小的列号（列号就对应类别）

end

