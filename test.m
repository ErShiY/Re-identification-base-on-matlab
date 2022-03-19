function [ Sa, Sb ] = test( Xa1,Xb1,D,pars )

[Sa,Sb] = Initil(pars);

for i = 1 : 20
    
    n=size(D,2);
    ITER=12;
    obj = zeros (ITER,1);
    h=ones(n,1);
    for iter = 1 :ITER
        Sa = 2*D'*Xa1;
        h=sqrt(sum(Sa.*Sa,2));
        obj(iter)=sum(h);
    end
    
    h=size(D,2);
    ITER=12;
    obj=zeros(ITER,1);
    m=ones(h,1);
    for iter = 1 : ITER
        %%≤‚ ‘ºØ 100*100*sb
        Sb =2*D'*Xb1;
        m = sqrt(sum(Sb.*Sb,2));
        obj(iter)=sum(m);
    end
end

