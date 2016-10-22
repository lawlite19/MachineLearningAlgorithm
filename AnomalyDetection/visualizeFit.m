function visualizeFit( X,mu,sigma2 )
%	可视化边界
%   

[X1 X2] = meshgrid(0:0.5:35);
Z = multivariateGaussian([X1(:) X2(:)],mu,sigma2);
Z = reshape(Z,size(X1));

plot(X(:, 1), X(:, 2),'bx');
hold on;
% Do not plot if there are infinities
if (sum(isinf(Z)) == 0)
    contour(X1, X2, Z, 10.^(-20:3:0)');
end
hold off;

end

