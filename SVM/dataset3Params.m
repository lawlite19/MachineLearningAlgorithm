function [ C,sigma ] = dataset3Params( X,y,Xval,yval )
%	选择error最小的C和sigma值
%   X,y为训练集
%   Xval,yval为交叉验证机

Ctest = [0.01 0.03 0.1 0.3 1 3 10 30];  % @可能的C值
sigmatest = [0.01 0.03 0.1 0.3 1 3 10 30];% @可能的sigma值
errors = zeros(size(Ctest,2), size(sigmatest,2));   %记录交叉验证集的错误率

for i=1:size(Ctest,2)   %遍历每个C
    for j=1:size(sigmatest,2)   %遍历每个sigma
        model= svmTrain(X, y, Ctest(i), @(x1, x2) gaussianKernel(x1, x2, sigmatest(j))); 
        predictions = svmPredict(model, Xval);  %交叉验证集预测
        errors(i,j) = mean(double(predictions ~= yval));    %求交叉验证集的错误率
        clear model;
        clear predictions;
    end
end

[dummy,ind] = min(errors(:));
[i,j] = ind2sub([size(errors,1) size(errors,2)],ind);   %返回错误率最先的坐标
C = Ctest(i);
sigma = sigmatest(j);

end

