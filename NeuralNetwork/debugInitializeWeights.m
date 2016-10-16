function W = debugInitializeWeights( fan_out,fan_in )
%	调试用的初始化weights的函数
%   使用sin初始化权值weights

W = zeros(fan_out,1+fan_in);

% 使用sin初始化W
W = reshape(sin(1:numel(W)),size(W))/10;    %numel返回W中元素个数


end

