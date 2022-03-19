function [ D ] = UpdateD( D,Xa,Xb,Sa,Sb )
XX=[Xa,Xb];
SS=[Sa,Sb];
D=learn_basis(XX,SS,1);
end

