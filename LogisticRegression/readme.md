逻辑回归算法
=============
### 一、文件说明
- [main.m][1.1]
 - 主运行程序
- [sigmoid.m][1.2]
 - S形函数
- [plotData.m][1.3]
 - 作图函数（主要是两个变量）
- [costFunctionReg.m][1.4]
 - 计算代价函数J和梯度grad
- [plotDecisionBoundary.m][1.5]
 - 画决策边界
- [predict.m][1.6]
 - 根据得到的假设函数再次预测训练集，输出准确度

### 二、重要文件说明
- plotDecisionBoundary.m   
决策边界的u,v坐标的范围需要根据实际数据修改
- mapFeature.m   
映射多项式函数，需要根据实际情况degree，防止过拟合（尽管已经采用正则化防止过拟合了）
### 三、测试数据
- data1.txt文件
![逻辑回归][3.1]
- data2.txt文件
![逻辑回归][3.2]



[1.1]:main.m
[1.2]:sigmoid.m
[1.3]:plotData.m
[1.4]:costFunctionReg.m
[1.5]:plotDecisionBoundary.m
[1.6]:predict.m

[3.1]: ././images/LogisticRegression_01.png "LogisticRegression_01.png"
[3.2]: ./images/LogisticRegression_02.png "LogisticRegression_02.png"
