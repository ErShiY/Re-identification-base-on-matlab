function [ Sb ] = UpdateSb( D,Xb,Sa,Sb,pars )
opt.lamba=pars.alpha2;
opt.maxiter=100;
opt.tol=10^(-8);
opt.vis=0;
opt.fistamode=2;

%%构造不同行人，外貌最相似的矩阵
n = size(Sb,2);
ind_all = 1:n;%%下标
for i = 1 : pars.Persons
    N = Sa(:,i~=ind_all);
    for j = 1 : pars.Persons-1
        bb = Sb(:,i)-N(:,j);
        b1(j) = norm (bb,2);
    end
    [~,ind2] = min (b1);
    C(:,i) = N(:,ind2);
end

for i = 1 : pars.Persons
    u=0.001;
    k=1;
    Error=1;
    
    rou = norm(Sb(:,i)-Sa(:,i),2)+1-norm(Sb(:,i)-C(:,i),2);
    if rou >0
        while(Error>0.000001 && k<50)
            f_current = norm(Xb(:,i)-D*Sb(:,i),2)+pars.alpha2*rou;
            grad_b = 2*(D'*D)*Sb(:,i)-2*D'*Xb(:,i)+2*pars.alpha2*C(:,i)-2*pars.alpha2*Sa(:,i);
            Sb(:,i) = Sb(:,i)-u*grad_b;
            f = norm (Xb(:,i)-D*Sb(:,i),2) + pars.alpha2*rou;
            Error = abs(f_current-f);
            k=k+1;
            u=u/sqrt(k);
        end
    else
        Sb(:,i)=2*(D'*D)*Sa(:,i)-2*D'*Xb(:,i);
    end
end

