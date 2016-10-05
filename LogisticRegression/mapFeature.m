function out = mapFeature( X1,X2 )
%   根据传递过来的X，将其映射为多项式
%   映射为多项式所需形式，例如：X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2 等，@处是要根据实际情况修改的部分

%% 初始化参数
degree = 2;     %这里最高次为2次方，    @根据需要修改
out = ones(size(X1(:,1)));  %返回的处理后的数据矩阵（假设degree为1，下面就相当于在X的最左侧加一列1）

%% 映射
for i = 1:degree
    for j = 0:i
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);   %   end+1表示每次加一列
    end
end

end

