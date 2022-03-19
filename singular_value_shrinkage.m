function [ Y,svp ] = singular_value_shrinkage( X, tau )
%SINGULAR_VALUE_SHRINKAGE Summary of this function goes here
%   Detailed explanation goes here
[U,S,V]=svd(X,'econ');
S = diag(S);
svp = length(find(S > tau));
S = S(1:svp)-tau;
U = U(:, 1:svp);
V = V(:, 1:svp);
Y = U*diag(S)*V';
end


