function Z = projectData( X,U,K )
%	投影到向量上函数
%   

Z = zeros(size(X, 1), K);

U_reduce = U(:,1:K);    %选取前K个向量
Z = X*U_reduce;         %计算投影后的Z向量

end

