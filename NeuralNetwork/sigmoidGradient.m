function [ g ] = sigmoidGradient( z )
%	求sigmoid的导数

g = sigmoid(z).*(1-sigmoid(z));

end

