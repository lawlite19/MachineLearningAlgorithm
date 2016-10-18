function sim = gaussianKernel( x1,x2,sigma )
%	高斯kernel
%   

sim = 0;

term = (x1-x2)'*(x1-x2);

sim = exp(-term/(2*sigma^2));   %高斯kernel定义

end

