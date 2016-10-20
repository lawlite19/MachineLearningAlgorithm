function centroids = computeCentroids( X,idx,K )
%	计算中心
%   

n = size(X,2);          %每条数据的维度
centroids = zeros(K,n); %中心位置

for i = 1:K   %遍历类别个数
    centroids(i,:) = mean(X(idx==i,:),1); %计算每个类别的中心位置,mean(A,1)返回的是A中每一列的中位数
end

end

