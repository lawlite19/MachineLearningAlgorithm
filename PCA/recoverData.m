function X_rec = recoverData( Z,U,K )
%	»Ö¸´Ô­Êý¾Ý
%  

X_rec = zeros(size(Z, 1), size(U, 1));

U_reduce = U(:,1:K);
X_rec = Z*U_reduce';

end

