function [ Sa,Sb ] = Initil( pars )
%INITIL ��ʼ��
% ��Sa,Sbһ�������ʼֵ�ȶ�
% ����ϵ��D��100*125


    randn('seed',100);
    [Sa] = randn(pars.Atoms, pars.Persons);
    randn('seed',400);
    [Sb] = randn(pars.Atoms, pars.Persons);


