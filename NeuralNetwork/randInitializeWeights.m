function W = randInitializeWeights( L_in,L_out )
%	Ëæ»ú³õÊ¼»¯weights
%   

W = zeros(L_out,1+L_in);

epsilon_init = (6/(L_in))^0.5;

W = rand(L_out,1+L_in)*2*epsilon_init-epsilon_init;

end

