%% 协同过滤算法主运行程序
%   电影推荐

%% 预处理
clear;close all;clc

%% 显示数据
fprintf('\n加载电影评分数据...\n');
load('movies.mat');
fprintf('\n对电影1（Toy Story）的平均评分为：%f\n',mean(Y(1,R(1,:))));  %R矩阵和Y矩阵同大小，记录了对应的用户是否评分

imagesc(Y); % 显示数据
ylabel('电影');
xlabel('用户');

fprintf('\n程序暂停，按任意键继续！\n');
pause;

%% 协同过滤的代价函数(正则化)
load('movieParams.mat');

% 减少数据量，用于测试代价和梯度计算是否正确
num_users = 4; num_movies = 5; num_features = 3;
X = X(1:num_movies, 1:num_features);
Theta = Theta(1:num_users, 1:num_features);
Y = Y(1:num_movies, 1:num_users);
R = R(1:num_movies, 1:num_users);

lambda = 1.5;   %正则化参数   @
J = cofiCostFunction([X(:);Theta(:)],Y, R, num_users, num_movies, ...
               num_features, lambda);
fprintf(['计算得到的代价J为 (lambda = 1.5): %f '...
         '\n(值计算正确的话应该是 31.34)\n'], J);

fprintf('\n程序暂停，按任意键继续！\n');
pause;

%% 检查梯度计算是否正确
fprintf('\n检查正则化的梯度计算是否正确！\n');

checkCostFunction(1.5); %检查梯度计算是否正确

fprintf('\n程序暂停，按任意键继续！\n');
pause;

%% 设定分数（自己修改）

movieList = loadMovieList();    %加载movie_ids.txt文件中的电影名

my_ratings = zeros(1682, 1);

% 设置评分
my_ratings(1) = 4;
my_ratings(98) = 2;
my_ratings(7) = 3;
my_ratings(12)= 5;
my_ratings(54) = 4;
my_ratings(64)= 5;
my_ratings(66)= 3;
my_ratings(69) = 5;
my_ratings(183) = 4;
my_ratings(226) = 5;
my_ratings(355)= 5;

% 显示我的打分情况
fprintf('\n\n我的打分为:\n');
for i = 1:length(my_ratings)
    if my_ratings(i) > 0 
        fprintf('对电影 %s 的评分为：%d\n', movieList{i},my_ratings(i));
    end
end

fprintf('\n程序暂停，按任意键继续！\n');
pause;


%% 训练协同过滤算法
load('movies.mat');
Y = [my_ratings Y];         %增加新的一列
R = [(my_ratings ~= 0) R];
[Ynorm, Ymean] = normalizeRatings(Y, R);    % 归一化操作

num_users = size(Y, 2); 
num_movies = size(Y, 1);
num_features = 10;

X = randn(num_movies, num_features);    %随机初始化X
Theta = randn(num_users, num_features); %随机初始化Theta

initial_parameters = [X(:); Theta(:)];

% Set options for fmincg
options = optimset('GradObj', 'on', 'MaxIter', 100);

% Set Regularization
lambda = 10;
theta = fmincg (@(t)(cofiCostFunction(t, Y, R, num_users, num_movies, ...
                                num_features, lambda)), ...
                initial_parameters, options);
%调整矩阵
X = reshape(theta(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(theta(num_movies*num_features+1:end), ...
                num_users, num_features);

fprintf('推荐系统学习结束.\n');

fprintf('\n程序暂停，按任意键继续！\n');
pause;

%% 推荐电影
p = X * Theta';
my_predictions = p(:,1) + Ymean;    

movieList = loadMovieList();

[r, ix] = sort(my_predictions, 'descend');
fprintf('\n为我推荐的前几名电影为:\n');
for i=1:10
    j = ix(i);
    fprintf('对电影 %s 的预测评分为：%.1f\n',movieList{j},my_predictions(j));
end

fprintf('\n\n最初我评分的电影:\n');
for i = 1:length(my_ratings)
    if my_ratings(i) > 0 
        fprintf('评分： %d 给电影： %s\n', my_ratings(i), ...
                 movieList{i});
    end
end