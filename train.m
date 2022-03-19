function[  D ] = train( Xa, Xb, pars )

[ D,  Sa, Sb ] =Initilization(pars);
    mu = 0.05;
    max_mu = 10^8;
    rho =1;

for i=1:20
    [ Sa ]   = UpdateSa( D,Xa,Sa,Sb,pars );
    [ Sb ]   = UpdateSb( D,Xb,Sa,Sb,pars );
    [ D ]    = UpdateD(  D,Xa, Xb,  Sa, Sb );
    mu = min(rho*mu,max_mu);  
end
