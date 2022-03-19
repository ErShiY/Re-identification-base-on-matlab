function [ D,Sa,Sb ] = Initilization( pars )
%INITILIZATION 初始化
% 给Sa,Sb，D一个随机初始值稳定
% 编码系数D,100*128
% 字典D，124*100
    randn('seed',100);
    [ Sa ]    = randn(pars.Atoms, pars.Persons); % D,100*125     
    randn('seed',400);
    [ Sb ]   = randn(pars.Atoms, pars.Persons); % D,100*125
    randn('seed',200); 
    [ D ]    = randn(pars.Dimensions, pars.Atoms); % D,124*100   

