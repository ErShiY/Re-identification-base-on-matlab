function [ Sa,Sb ] = Initil( pars )
%INITIL 初始化
% 给Sa,Sb一个随机初始值稳定
% 编码系数D，100*125


    randn('seed',100);
    [Sa] = randn(pars.Atoms, pars.Persons);
    randn('seed',400);
    [Sb] = randn(pars.Atoms, pars.Persons);


