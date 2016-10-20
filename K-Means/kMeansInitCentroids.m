function centroids = kMeansInitCentroids( X,K )
%	随机选取K个样本X中的点作为聚类中心
%   

centroids = zeros(K,size(X,2));

rand_idx = randperm(size(X,1)); %将m条数据打乱
centroids = X(rand_idx(1:K),:); %选取前K个

end

