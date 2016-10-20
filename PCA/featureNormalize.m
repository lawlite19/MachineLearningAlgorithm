function [ X_norm,mu,sigma ] = featureNormalize( X )
%	归一化数据
%   

X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

mu=mean(X_norm);
sigma=std(X_norm);
for i=1:size(X,2)
    X_norm(:,i)=X_norm(:,i)-mu(i);
    X_norm(:,i)=X_norm(:,i)./sigma(i);
end

%% 或者调用bsxfun求
%mu = mean(X);
%X_norm = bsxfun(@minus, X, mu);

%sigma = std(X_norm);
%X_norm = bsxfun(@rdivide, X_norm, sigma);

end

