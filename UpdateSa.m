function [ Sa ] = UpdateSa( D,Xa,Sa,Sb,pars )
opt.lamba = pars.alpha1;
opt.maxiter=100;
opt.tol=10^(-8);
opt.vis=0;
opt.fistamode=2;

%%构造不同行人，外貌最相似的矩阵
n = size(Sb,2);
ind_all = 1:n;
for i = 1 : pars.Persons
    M = Sb(:,i~=ind_all);
    for j = 1 : pars.Persons-1
        bb = Sa(:,i)-M(:,j);
        b1(j) = norm (bb,2);
    end
    [~,ind2] = min (b1);
    B(:,i) = M(:,ind2);
end

for i = 1 : pars.Persons
    u=0.001;
    k=1;
    Error=1;
    
    rou = norm(Sa(:,i)-Sb(:,i),2)+1-norm(Sa(:,i)-B(:,i));
    if rou > 0
         while(Error>0.0000001 && k<50)
            f_current = norm(Xa(:,i)-D*Sa(:,i),2)+pars.alpha1*rou;
            grad_a = 2*(D'*D)*Sa(:,i)-2*D'*Xa(:,i)+2*pars.alpha1*B(:,i)-2*pars.alpha1*Sb(:,i);
            Sa(:,i) = Sa(:,i) - u*grad_a;
            f = norm(Xa(:,i)-D*Sa(:,i),2)+pars.alpha1*rou;
            Error = abs(f_current - f);
            k = k+1;
            u = u/sqrt(k);
         end
    else
        Sa(:,i)=2*(D'*D)*Sa(:,i)-2*D'*Xa(:,i);
    end
end

