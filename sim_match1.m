function rank=sim_match1(Yt_prb, Yt_gal)

m=size(Yt_gal,2);
n=size(Yt_prb,2);

for i=1:n
    A_probe = Yt_prb(:,i);
    dist{i}=zeros(1,n);
    for j=1:m
        A_gal = Yt_gal(:,j);
        dist{i}(j)=norm(A_probe-A_gal);
    end
end

rank=zeros(m,1);
for i=1:n
    [~,ind1]=sort(dist{i},'ascend');%…˝–Ú≈≈¡–
    r = find(ind1 == i);
    rank(r) = rank(r) + 1; 
end
rank = cumsum(rank) / n * 100;

