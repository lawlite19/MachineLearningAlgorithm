function [ h,display_array ] = displayData_OneVsAll( X,example_width )
%   将X中对应的手写数字画出来
%   此处显示详细说明

%% 设置要显示手写数字的宽度（这里是20px），如果没有传入参数的话
if ~exist('example_width','var') || isempty('example_width')
    example_width = round(sqrt(size(X,2)));  % round四舍五入取整
end

%% 画图 
colormap(gray)  %创建灰色系的曲面图
[m n] = size(X);
example_height = n/example_width;   %手写数字的高度（这里是20px）
%每个图的行号和列号（这里行、列都是10）
display_rows = floor(sqrt(m));
display_cols = ceil(m/display_rows);

pad = 1;    %两个图像的padding
% 要显示的区域
display_array = - ones(pad+display_rows*(example_height+pad),...
                       pad+display_cols*(example_width+pad));

 cur = 1;   %遍历当前行号
 for i = 1:display_rows
     for j = 1:display_cols
         if cur > m  %超过了行数，退出当前循环
             break;
         end
         
         max_val = max(abs(X(cur,:)));  %获取每行的最大值,主要后序控制每个像素点的大小
         display_array(pad+(i-1)*(example_height+pad)+(1:example_height),...    %每个图像对应的绘画区域的高(1:example_height)
                       pad+(j-1)*(example_width +pad)+(1:example_width))=...    %每个图像对应的绘画区域的宽(1:example_height)
                       reshape(X(cur,:),example_height,example_width)/max_val;  %将X中当前行调整为图像的矩阵（因为图像是对应中X中的一行数据）
         cur = cur+1;
     end
     if cur > m  %超过了行数，退出当前循环(因为display_array的复制是将整行调整后复制的，不是一个一个像素点复制的，所以这里直接退出当前循环)
         break;
     end
 end
 h = imagesc(display_array,[-1 1]);%将display_array中的值转换为颜色显示，[-1 1]因为每个像素点都除以了max_val,所以肯定在[-1,1]的区间
 
 axis image off;    %不显示x,y轴
 drawnow;
 
end

