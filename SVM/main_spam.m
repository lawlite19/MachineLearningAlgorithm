%% 垃圾邮件预测主文件
%   使用SVM支持向量机预测

%% 预处理
clear; close all;clc


%% 处理邮件
fprintf('\n处理样本邮件(emailSample1.txt)...\n');

file_contents = readFile('emailSample1.txt');   %读取邮件内容
word_indices  = processEmail(file_contents);    %处理邮件内容，返回的是词出现的位置的列向量
%映射特征向量，大小词汇表中单词个数，将word_indices中的位置值为1，其余为0，
features      = emailFeatures(word_indices);    
fprintf('程序暂停，按任意键继续！\n');
pause;

%% 训练线性SVM分类器
load('spamTrain.mat');
fprintf('\n训练线性SVM分类器...\n');

C = 0.1;
model = svmTrain(X, y, C, @linearKernel);   %调用线性SVM
%训练集准确度
p = svmPredict(model, X);   %预测训练集上的数据
fprintf('训练集预测精准度为: %f\n', mean(double(p == y)) * 100);

%测试集准确度
load('spamTest.mat');

fprintf('\n测试集预测精准度为...\n')

p = svmPredict(model, Xtest);

fprintf('程序暂停，按任意键继续！\n');
pause;

%% 显示哪些词最可能表示spam
[weight, idx] = sort(model.w, 'descend');   %按照权重降序排序
vocabList = getVocabList();

fprintf('\n前15名预测为spam的词为: \n');
for i = 1:15
    fprintf(' %-15s (%f) \n', vocabList{idx(i)}, weight(i));
end

fprintf('\n\n');
fprintf('程序暂停，按任意键继续！\n');
pause;

%% 处理一封邮件，预测是否为spam
filename = 'spamSample1.txt';   %文件名 @

file_contents = readFile(filename);
word_indices  = processEmail(file_contents);
x             = emailFeatures(word_indices);
p = svmPredict(model, x);   % 预测

fprintf('\n处理的 %s\n预测结果为: %d\n', filename, p);
fprintf('(1 表示是spam, 0 不是spam)\n\n');
