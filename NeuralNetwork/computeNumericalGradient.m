function [ numgrad ] = computeNumericalGradient( J,theta )
%	返回计算的梯度
%   

%% 初始化变量
numgrad = zeros(size(theta));   % 结果
step = zeros(size(theta));      % 
e = 1e-4;   % 步长

%% 计算梯度
for i = 1:numel(theta)
    step(i) = e;    %对应位置设为步长
    loss1 = J(theta-step);  %将所有theta传入会返回代价
    loss2 = J(theta+step);
    numgrad(i) = (loss2-loss1)/(2*e);   % 梯度定义
    step(i)=0;  %当前位置重置为0
end

end

