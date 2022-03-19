function x = opt_fista_lasso(h,y,x0,opt,hfun)
% The objective function: F(x) = 1/2 ||y - hx||^2 + lambda |x|
% Input: 
%   h: impulse response (lexicographically arranged)
%   y: degraded image (vector)
%   x0: initialization (vector)
%   opt.lambda: weight constant for the regularization term
%   hfun: functions
% Output:
%   x: output image
%
% Author: Seunghwan Yoo

% fprintf(' - Running FISTA Method\n');
% norm_D2 = sqrt(sum(h.^2, 1)); %对矩阵进行归一化，使得所有元素的值在0-1之间
% h = h./repmat(norm_D2, size(h, 1), 1);%对矩阵元素按列排列

A = h; b = y;
AtA = A'*A;
evs = eig(AtA);
L = max(evs);
l = 1/L;

lamda = opt.lamda;
maxiter = opt.maxiter; %10000;
tol = opt.tol;
vis = opt.vis;
mode = opt.fistamode;

% k-th (k=0) function, gradient, hessian
% objk  = func(x0,b,A,lambda);
%gradk = grad(x0,b,A);
xk = x0;
yk = xk;
if mode == 1
    tk = 1;
end

% fprintf('%6s %9s %9s\n','iter','f','sparsity');
% fprintf('%6i %9.2e %9.2e\n',0,objk,nnz(xk)/numel(xk));
% tic;
for i = 1:maxiter
    x_old = xk;
    y_old = yk;
    if mode == 1
        t_old = tk;
    end

    yg = y_old - l*(AtA*y_old-A'*b); 
    %yg = y_old - l*A'*(A*y_old-b);
    xk = subplus(abs(yg)-lamda/L) .* sign(yg); % shrinkage operation
    if mode == 1
        tk = (1+sqrt(1+4*t_old*t_old))/2;
        yk = xk + (t_old-1)/tk*(xk-x_old);
    elseif mode == 2
        yk = xk + i/(i+3) * (xk-x_old);
    end

%     if vis > 0
%         fprintf('%6i %9.2e %9.2e\n',i,func(xk,b,A,lambda),nnz(xk)/numel(xk));
%     end
    if norm(xk-x_old)/norm(x_old) < tol
%         fprintf('%6i %9.2e %9.2e\n',i,func(xk,b,A,lambda),nnz(xk)/numel(xk));
%          fprintf('  converged at %dth iterations\n',i);
        break;
    end
end
% toc;
x = xk;


% function objk = func(xk,b,A,lambda)
% e = b - A*xk;
% objk = 0.5*(e)'*e + lambda*sum(abs(xk));
