function W = randInitializeWeights( L_in,L_out )
%	随机初始化weights
%   L_in=S(l),L_out=S(l+1)
%   设置epsilon=(6/(L_in+L_out))^0.5

W = zeros(L_out,1+L_in); % 权重weights为[S(l+1)+1]*S(L)

epsilon_init = (6/(L_in+L_out))^0.5;

W = rand(L_out,1+L_in)*2*epsilon_init-epsilon_init;

end

