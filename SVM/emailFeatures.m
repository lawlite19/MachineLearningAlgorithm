function features = emailFeatures( word_indices )
%	根据word_indices产生特征向量
%   此处显示详细说明

n = 1899;   %字典中数据总数@

features = zeros(n,1);

for i=1:size(word_indices,1)
    features(word_indices(i)) = 1;
end


end

